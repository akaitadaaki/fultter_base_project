import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'sample_data_database.dart';

abstract class TableInfo {
  String getTableName();

  Map<String, String> getColumn();
}

abstract class AppDatabase {
  late Database _database;
  final tableInfo = {
    SampleDataDatabase.tableName: SampleDataDatabase.columns,
  };

  Future<Database> get database async {
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'kfps.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createTable,
      onUpgrade: _upgradeTable,
    );
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
