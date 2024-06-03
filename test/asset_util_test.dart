import 'package:instagram_clone/utils/asset_util.dart';
import 'package:test/test.dart';

void main() {
  test('_parseAndDecode should return a Map', () {
    const jsonString = '{"key": "value"}';
    final result = AssetUtil.parseAndDecode(jsonString);
    expect(result, isA<Map<String, dynamic>>());
    expect(result['key'], 'value');
  });
}