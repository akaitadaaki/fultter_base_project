import 'package:flutter_test/flutter_test.dart';
import 'package:fultter_base_project/data/model/sample_data.dart';
import 'dart:convert';

void main() {
  test('json model Test', () async {
    const jsonData =
        '{ "dataId":1,"dataName":"test name", "description":"test description", "lastUpdate":"2023-02-13 09:15:26.000"}';
    SampleData data = SampleData.fromJson(json.decode(jsonData) as Map<String, dynamic>);
    expect(data.id, 1);
    expect(data.name, "test name");
    expect(data.description, "test description");
    expect(data.lastUpdate, DateTime(2023, 2, 13, 9, 15, 26));

    var jsonMap = data.toJson();
    expect(jsonMap["dataId"], 1);
    expect(jsonMap["dataName"], "test name");
    expect(jsonMap["description"], "test description");
    expect(jsonMap["lastUpdate"], "1676247326");
  });
}
