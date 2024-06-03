import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

class AssetUtil {
  /// Load json from assets folder.
  /// e.g. loadJsonFromAssets('assets/data.json')
  static Future<Map<String, dynamic>> loadJsonFromAssets(
      String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return parseJson(jsonString);
  }

  static Map<String, dynamic> parseAndDecode(String response) {
    return jsonDecode(response) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> parseJson(String text) {
    return compute(parseAndDecode, text);
  }
}
