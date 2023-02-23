import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class LineChart extends CustomPainter {
  double textScaleFactorXAxis = 0.2; // x축 텍스트의 비율을 정함.
  double textScaleFactorYAxis = 1.2;
  int maxValueIndex = 0;
  int minValueIndex = 0;
  double fontSize = 18.0;

  List<double> points;
  List<String> labels;
  double lineWidth;
  double pointSize;
  Color lineColor;
  Color pointColor;

  LineChart(
      {required this.points,
      required this.labels,
      required this.pointSize,
      required this.lineWidth,
      required this.lineColor,
      required this.pointColor});

  // 선 그리기
  @override
  void paint(Canvas canvas, Size size) {
    List<Offset> offsets = getCoordinates(points, size); // 점들이 그려질 좌표를 구합니다.

    drawText(canvas, offsets); // 텍스트를 그립니다. 최저값과 최고값 위아래에 적은 텍스트입니다.
    drawLines(canvas, size, offsets); // 구한 좌표를 바탕으로 선을 그립니다.
    drawPoints(canvas, size, offsets); // 좌표에 따라 점을 그립니다.
    drawXLabels(canvas, size, offsets); // x축을 그려줍니다.
  }

  void drawLines(Canvas canvas, Size size, List<Offset> offsets) {
    Paint paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path();

    double dx = offsets[0].dx;
    double dy = offsets[0].dy;

    path.moveTo(dx, dy);
    offsets.map((offset) {
      path.lineTo(offset.dx, offset.dy);
    }).toList();

    canvas.drawPath(path, paint);
  }

  void drawXLabels(Canvas canvas, Size size, List<Offset> coordinates) {
    double fontSize = calculateFontSize(labels[0], size,
        xAxis: true); // 화면 크기에 유동적으로 폰트 크기를 계산함.

    for (int index = 0; index < labels.length; index++) {
      TextSpan span = TextSpan(
          style: TextStyle(
              color: const Color.fromARGB(255, 100, 72, 45),
              fontSize: fontSize * 1.8,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold),
          text: labels[index]);

      TextPainter tp =
          TextPainter(text: span, textDirection: TextDirection.ltr);
      tp.layout();

      Offset offset = coordinates[index];
      double dx = offset.dx - 6;
      double dy = size.height - tp.height * 1.5;

      tp.paint(canvas, Offset(dx, dy));
    }
  }

  double calculateFontSize(String value, Size size, {bool xAxis = true}) {
    int numberOfCharacters = value.length; // 글자수에 따라 폰트 크기를 계산하기 위함.
    double fontSize = (size.width / numberOfCharacters) /
        points.length; // width가 600일 때 100글자를 적어야 한다면, fontSize는 글자 하나당 6이어야겠죠.

    if (xAxis) {
      fontSize *= textScaleFactorXAxis;
    } else {
      fontSize *= textScaleFactorYAxis;
    }
    return fontSize;
  }

  void drawPoints(Canvas canvas, Size size, List<Offset> offsets) {
    Paint paint = Paint()
      ..color = pointColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = pointSize;

    canvas.drawPoints(PointMode.points, offsets, paint);
  }

  // x , y 좌표값 구하기 (정규화 시켜서)
  List<Offset> getCoordinates(List<double> points, Size size) {
    List<Offset> coordinates = [];

    double spacing =
        size.width / (points.length - 1); // 좌표를 일정 간격으로 벌리지 위한 값을 구합니다.
    double maxY = points.reduce(
        (current, next) => current > next ? current : next); // 데이터 중 최소값을 구합니다.
    double minY = points.reduce(
        (current, next) => current < next ? current : next); // 데이터 중 최대값을 구합니다.

    double bottomPadding = fontSize * 0.8; // 텍스트가 들어갈 패딩(아랫쪽)을 구합니다.
    double topPadding = fontSize * 5; // 텍스트가 들어갈 패딩(위쪽)을 구합니다.
    double h = size.height - topPadding; // 패딩을 제외한 화면의 높이를 구합니다.

    for (int index = 0; index < points.length; index++) {
      double x = spacing * index; // x축 좌표를 구합니다.
      double normalizedY = (points[index] - minY) /
          (maxY - minY); // 정규화한다. 정규화란 [0 ~ 1] 사이가 나오게 값을 변경하는 것.
      double y =
          getYPos(h, bottomPadding, normalizedY); // Y축 좌표를 구합니다. 높이에 비례한 값입니다.

      Offset coord = Offset(x, y);
      coordinates.add(coord);

      findMaxIndex(
          points, index, maxY, minY); // 텍스트(최대값)를 적기 위해, 최대값의 인덱스를 구해놓습니다.
      findMinIndex(
          points, index, maxY, minY); // 텍스트(최소값)를 적기 위해, 최대값의 인덱스를 구해놓습니다.
    }

    return coordinates;
  }

  double getYPos(double h, double bottomPadding, double normalizedY) =>
      (h + bottomPadding) - (normalizedY * h);

  void findMaxIndex(List<double> points, int index, double maxY, double minY) {
    if (maxY == points[index]) {
      maxValueIndex = index;
    }
  }

  void findMinIndex(List<double> points, int index, double maxY, double minY) {
    if (minY == points[index]) {
      minValueIndex = index;
    }
  }

  void drawText(Canvas canvas, List<Offset> offsets) {
    double maxValue =
        points.reduce((current, next) => current > next ? current : next);
    String max = (((maxValue / pow(10, 7)).round()) / 10).toString();
    double minValue =
        points.reduce((current, next) => current < next ? current : next);
    String min = (((minValue / pow(10, 7)).round()) / 10).toString();

    drawTextValue(canvas, '$min억', offsets[minValueIndex], false);
    drawTextValue(canvas, '$max억', offsets[maxValueIndex], true);
  }

  void drawTextValue(Canvas canvas, String text, Offset pos, bool textUpward) {
    TextSpan maxSpan = TextSpan(
        style: TextStyle(
            fontSize: fontSize * 0.7,
            color: Colors.black,
            fontWeight: FontWeight.bold),
        text: text);
    TextPainter tp =
        TextPainter(text: maxSpan, textDirection: TextDirection.ltr);
    tp.layout();

    double y = textUpward
        ? -tp.height * 1.7
        : tp.height * 0.7; // 텍스트의 방향을 고려해 y축 값을 보정해줍니다.
    double dx = pos.dx - tp.width / 2; // 텍스트의 위치를 고려해 x축 값을 보정해줍니다.
    double dy = pos.dy + y;

    Offset offset = Offset(dx, dy);

    tp.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(LineChart oldDelegate) {
    return true;
  }
}
