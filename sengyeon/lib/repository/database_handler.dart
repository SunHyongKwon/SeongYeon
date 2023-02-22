import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:pj_test/view_model/calendar_viewmodel.dart';
import 'package:sqflite/sqflite.dart';

import '../model/calendar.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, "cal.db"),
      onCreate: (database, version) async {
        await database.execute(
            "create table cal(id integer primary key autoincrement, title text, inex text, income integer, expenditure integer, content text, writeday text)");
      },
      version: 1,
    );
  }

  Future<int> insertCal(Calendar calendar) async {
    //파일쓰는거라 async 사용
    int result = 0;
    final Database db = await initializeDB(); //그런애있냐 하고 이니셜라이징하고
    result = await db.rawInsert(
        "insert into cal (title, inex, income, expenditure, content, writeday) values(?,?,?,?,?,?)",
        [
          calendar.title,
          calendar.inex,
          calendar.income,
          calendar.expenditure,
          calendar.content,
          calendar.writeday
        ]);
    return result;
  }

  // 데이터 불러오기
  Future<List<Calendar>> queryCal() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db
        .rawQuery("select * from cal"); //셀렉트 때문에 ap<String, Object?> toMap()만듬
    print(queryResult);
    return queryResult.map((e) => Calendar.fromMap(e)).toList();
  }

// 날짜 오름차순
  Future<List<Calendar>> queryYear(String? selectedDate) async {
    final Database db = await initializeDB();

    final List<Map<String, Object?>> queryResult = await db.rawQuery(
        "select * from cal where writeday == ?",
        [selectedDate]); //셀렉트 때문에 ap<String, Object?> toMap()만듬
    return queryResult.map((e) => Calendar.fromMap(e)).toList();
  }

  // 날짜별 데이터 가져오기
  Future<List<Calendar>> querySelectDate(DateTime date) async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.rawQuery(
        "select * from cal order by writeday"); //셀렉트 때문에 ap<String, Object?> toMap()만듬
    return queryResult.map((e) => Calendar.fromMap(e)).toList();
  }

  // 수입 합계
  queryIncom() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.rawQuery(
        "select sum(income) as sum from cal"); //셀렉트 때문에 ap<String, Object?> toMap()만듬
    int result = int.parse(queryResult[0]['sum'].toString());
    CalendartVM.income = result;
  }

  // 지출합계
  queryExpenditure() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.rawQuery(
        "select sum(expenditure) as sum from cal"); //셀렉트 때문에 ap<String, Object?> toMap()만듬
    int result = int.parse(queryResult[0]['sum'].toString());
    CalendartVM.expenditure = result;
  }

  // 지출합계
  Future<void> queryTotal() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.rawQuery(
        "select sum(income) - sum(expenditure) as sum from cal"); //셀렉트 때문에 ap<String, Object?> toMap()만듬
    int result = int.parse(queryResult[0]['sum'].toString());
    CalendartVM.total = result;
  }

  // 삭제
  Future<void> deleteCal(int id) async {
    var db = await initializeDB();
    await db.delete(
      "cal",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
