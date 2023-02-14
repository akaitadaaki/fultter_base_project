import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import '../../foundation/extension/map.dart';
import '../model/sample_data.dart';
import 'app_database.dart';

final sampleDatabaseProvider = Provider((ref) => SampleDataDatabase(ref.watch(testDatabasePathProvider)));
// Unit テスト用DBのパス指定（通常時は利用しない）
final testDatabasePathProvider = StateProvider<String?>((ref) => null);

class SampleDataDatabase extends AppDatabase {
  SampleDataDatabase(testPath) : super(testPath);
  static const String _tableName = 'sample_data';
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

  final Map<String, String> _changeMap = {
    "dataId": _columnId,
    "dataName": _columnName,
    "lastUpdate": _columnLastUpdate,
  };

  Future<List<SampleData>> getSampleDataList() async {
    final db = await database;
    final maps = await db.query(
      _tableName,
      orderBy: '$_columnId ASC',
    );

    if (maps.isEmpty) return [];

    return maps.map((map) => SampleData.fromJson(map.restoreKey(_changeMap))).toList();
  }

  Future<SampleData?> getSampleDataById(int id) async {
    final db = await database;
    final maps = await db.query(_tableName, where: "$_columnId = ?", whereArgs: [id]);

    if (maps.isEmpty) return null;

    return maps.map((map) => SampleData.fromJson(map.restoreKey(_changeMap))).toList()[0];
  }

  Future<SampleData> insert(SampleData sampleData) async {
    final db = await database;

    final id = await db.insert(
      _tableName,
      sampleData.toJson().changeKey(_changeMap),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return sampleData.copyWith(
      id: id,
    );
  }

  Future update(SampleData sampleData) async {
    final db = await database;

    return await db.update(
      _tableName,
      sampleData.toJson().changeKey(_changeMap),
      where: '$_columnId = ?',
      whereArgs: [sampleData.id],
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
