import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pvd_things_app/models/thing.dart';

class ThingApi {
  static final Uri _uri =
      Uri.https("starboardcoop-things-api.glitch.me", "/things");

  static List<Thing> _cachedThings = [];

  static Future<List<Thing>> getThings() async {
    if (_cachedThings.isNotEmpty) return _cachedThings;

    final response = await http.get(_uri);
    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['things']) {
      _temp.add(i);
    }

    _cachedThings = Thing.thingsFromSnapshot(_temp);
    return _cachedThings;
  }
}
