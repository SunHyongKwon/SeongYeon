import 'package:flutter/material.dart';

class IndicatorComponent extends CustomPainter {
  final BuildContext context;
  final Color color;

  IndicatorComponent({required this.context, required this.color});

  // 선 그리기
  @override
  void paint(Canvas canvas, Size size) {
    // 점들이 그려질 좌표를 구합니다.
    drawLines(canvas, size);
  }

  void drawLines(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path();

    path.moveTo(3, 0);
    path.lineTo(MediaQuery.of(context).size.width / 7 + 3, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(IndicatorComponent oldDelegate) {
    return true;
  }
}
