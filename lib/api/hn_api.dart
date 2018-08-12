import 'dart:async';
import 'dart:convert';
import 'package:hn_app/data/serializers.dart';
import 'package:http/http.dart' as http;
import 'package:hn_app/data/entities.dart';

isResponseOk(http.Response resp) => resp.statusCode / 100 == 2;

class HnApi {
  static final String _endPoint = "https://hacker-news.firebaseio.com/v0";

  static final HnApi _singleton = new HnApi._constructor();

  factory HnApi() => _singleton;

  HnApi._constructor();

  Future<int> maxItemId() async {
    var url = "$_endPoint/maxitem.json";
    print("[http] url: $url}");
    var resp = await http.get(url);
    print("maxItemId: $resp}");

    if (isResponseOk(resp)) {
      await Future.delayed(Duration(seconds: 5));
      return int.parse(resp.body);
    } else {
      throw Exception("Request error: ${resp.statusCode}");
    }
  }

  Future<List<int>> topStoryIds() async {
    var url = "$_endPoint/topstories.json";
    var resp = await http.get(url);
    if (isResponseOk(resp)) {
      List<dynamic> ids = jsonDecode(resp.body);
      return ids.cast();
    } else {
      throw Exception("error");
    }
  }

  Future<Story> item(int id) async {
    var url = "$_endPoint/item/$id.json";
    var resp = await http.get(url);
    if (isResponseOk(resp)) {
      return serializers.deserializeWith(
          Story.serializer, jsonDecode(resp.body));
    } else {
      throw Exception("Request error: ${resp.statusCode}");
    }
  }
}
