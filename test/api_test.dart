import 'package:flutter_test/flutter_test.dart';
import 'package:hn_app/api/hn_api.dart';

void main() {
  test("top story ids", () async {
    List<int> ids = await HnApi().topStoryIds();
    expect(ids, isNotEmpty);
  });

  test("item", () async {
    var item = await HnApi().item(17736046);
    print(item);
    expect(item, isNotNull);
  });
}