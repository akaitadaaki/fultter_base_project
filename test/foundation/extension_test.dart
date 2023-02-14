import 'package:flutter_test/flutter_test.dart';
import 'package:fultter_base_project/foundation/extension/date_time.dart';
import 'package:fultter_base_project/foundation/extension/int.dart';
import 'package:fultter_base_project/foundation/extension/map.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  test('DateTime Test', () async {
    await initializeDateFormatting('ja_JP');
    final date = DateTime(2023, 2, 13, 9, 15, 26);

    expect(date.format(DateFormat('yyyyMMddHHmmss')), equals('20230213091526'));
    expect(date.formatYMd(), equals('2023年02月13日'));
    expect(date.formatDateTimeYMd(), equals('2023-02-13'));
    expect(date.formatYYYYMMdd(), equals('2023/02/13'));
    expect(date.formatMMdd(), equals('02/13'));
    expect(date.formatYM(), equals('2023年2月'));
    expect(date.formatDateTime(), equals('2023年02月13日 9:15'));
    expect(date.formatTime(), equals('9:15'));
    expect(date.dayOfWeek(), equals('月'));
    expect(date.isToday(), false);
    expect(DateTime.now().isToday(), true);
  });
  test('Int Test', () {
    const intData = 12345;

    expect(intData.format(NumberFormat('00000000')), "00012345");
    expect(intData.formatStep(), "12,345");
  });
  test('Map Test', () async {
    final date = DateTime(2023, 2, 13, 9, 15, 26);
    final Map<String, String> changeMap = {
      "dataId": "id",
      "dataName": "name",
      "removeKey": "remove_key",
      "lastUpdate": "last_update",
    };
    final Map<String, dynamic> keyMap = {
      "dataId": 1,
      "dataName": "testName",
      "removeKey": null,
      "lastUpdate": date,
      "boolkey1": true,
      "boolkey2": false
    };
    final Map<String, dynamic> resultMap1 = {
      "id": 1,
      "name": "testName",
      "remove_key": null,
      "last_update": date,
      "boolkey1": true,
      "boolkey2": false,
    };
    // keyの変換テスト
    final changed1 = keyMap.changeKey(changeMap);
    expect(changed1, resultMap1);

    final List<String> checkColumn = ["id", "name", "last_update", "boolkey1", "boolkey2"];
    final Map<String, dynamic> resultMap2 = {
      "id": 1,
      "name": "testName",
      "last_update": date,
      "boolkey1": true,
      "boolkey2": false,
    };
    // 特定keyのみの変換テスト
    final changed2 = keyMap.changeKey(changeMap, checkColumns: checkColumn);
    expect(changed2, resultMap2);

    // null値key削除テスト
    expect(resultMap1.removeNullValue(), resultMap2);

    final Map<String, dynamic> baseMap = {
      "id": 1,
      "name": "testName",
      "remove_key": null,
      "last_update": date,
      "boolkey1": 1,
      "boolkey2": 0,
    };

    // DateTimeは戻すときはStringとする
    final Map<String, dynamic> restoredMap = {
      "dataId": 1,
      "dataName": "testName",
      "removeKey": null,
      "lastUpdate": date.toString(),
      "boolkey1": true,
      "boolkey2": false
    };

    // keyの戻しテスト
    expect(baseMap.restoreKey(changeMap, boolList: ["boolkey1", "boolkey2"]), restoredMap);
  });
}
