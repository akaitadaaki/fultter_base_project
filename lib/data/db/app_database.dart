import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'sample_data_database.dart';

abstract class TableInfo {
  String getTableName();

  Map<String, String> getColumn();
}

const String databaseFileName = "sample_database.db";

abstract class AppDatabase {
  AppDatabase(this._testPath);
  final String? _testPath;
  late Database _database;
  final tableInfo = {
    SampleDataDatabase.tableName: SampleDataDatabase.columns,
  };

  Future<Database> get database async {
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    const version = 1;
    if (_testPath == null) {
      String path = join(await getDatabasesPath(), databaseFileName);

      return await openDatabase(
        path,
        version: version,
        onCreate: _createTable,
        onUpgrade: _upgradeTable,
      );
    } else {
      // テスト用
      Directory(_testPath!).create();
      sqfliteFfiInit();
      final options = OpenDatabaseOptions(
        version: version,
        onCreate: _createTable,
        onUpgrade: _upgradeTable,
      );
      return await databaseFactoryFfi.openDatabase(_testPath!, options: options);
    }
  }

  Future<void> _createTable(Database db, int version) async {
    tableInfo.forEach((tableName, columns) async {
      String sql = "CREATE TABLE " + tableName + "(";
      columns.forEach((columnName, type) {
        sql += "$columnName $type, ";
      });
      sql = sql.trim().substring(0, sql.trim().length - 1) + ");";
      await db.execute(sql);
    });
  }

  Future<void> _upgradeTable(Database db, int oldVersion, int newVersion) async {}
}
