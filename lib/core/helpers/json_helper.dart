import 'dart:convert';

class JsonHelper {
  static String convertObjectToString(dynamic object) {
    Map<String, dynamic> json = object.toJson();
    String jsonString = jsonEncode(json);
    return jsonString;
  }

  static List<String> convertListOfObjectsToListOfString(
      List<dynamic> objects) {
    List<String> result = [];
    for (var object in objects) {
      result.add(convertObjectToString(object));
    }
    return result;
  }

  static List<T> convertListOfStringToListOfObjects<T>(
      List<String> items, Function(Map<String, dynamic> json) fromJson) {
    List<T> objects = [];
    for (var item in items) {
      dynamic temp = fromJson(jsonDecode(item));
      objects.add(temp);
    }
    return objects;
  }
}
