import 'package:sqflite/sqflite.dart';

import '../../foundation/extension/map.dart';
import '../model/test_data.dart';
import 'app_database.dart';

class TestDataDatabase extends AppDatabase {
  static const String _tableName = 'test_data';
  static const String _columnId = 'id';
  static const String _columnName = 'name';
  static const String _columnDescription = 'description';
  static const String _columnLastUpdate = 'last_update';

  static get tableName => _tableName;
  static get columns {
    return {
      _columnId: "INTEGER PRIMARY KEY",
      _columnName: "TEXT",
      _columnDescription: "TEXT",
      _columnLastUpdate: "INTEGER",
    };
  }

  final Map<String, String> changeMap = {
    "dataId": _columnId,
    "dataName": _columnName,
    "lastUpdate": _columnLastUpdate,
  };

  Future<List<TestData>> getTestDataList() async {
    final db = await database;
    final maps = await db.query(
      _tableName,
      orderBy: '$_columnId ASC',
    );

    if (maps.isEmpty) return [];

    return maps.map((map) => TestData.fromJson(map.restoreKey(changeMap))).toList();
  }

  Future<TestData?> getTestDataById(int id) async {
    final db = await database;
    final maps = await db.query(_tableName, where: "$_columnId = ?", whereArgs: [id]);

    if (maps.isEmpty) return null;

    return maps.map((map) => TestData.fromJson(map.restoreKey(changeMap))).toList()[0];
  }

  Future<TestData> insert(TestData testData) async {
    final db = await database;

    final id = await db.insert(
      _tableName,
      testData.toJson().changeKey(changeMap),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return testData.copyWith(
      id: id,
    );
  }

  Future update(TestData testData) async {
    final db = await database;

    return await db.update(
      _tableName,
      testData.toJson().changeKey(changeMap),
      where: '$_columnId = ?',
      whereArgs: [testData.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future delete(int id) async {
    final db = await database;

    return await db.delete(
      _tableName,
      where: '$_columnId = ?',
      whereArgs: [id],
    );
  }

  Future deleteAll() async {
    final db = await database;

    return await db.delete(
      _tableName,
    );
  }

  Future<int> getLastId() async {
    final db = await database;
    final maps = await db.query(
      _tableName,
      orderBy: '$_columnId DESC',
    );

    if (maps.isEmpty) return 0;

    return maps.first[_columnId] as int;
  }
}
