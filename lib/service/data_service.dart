import 'dart:convert';
import 'dart:ffi';

import 'package:app_project2/dto/news.dart';
import 'package:app_project2/endpoint/endpoint.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataService {
  static Future<void> sendData(String title, String body) async {
    Map<String, String> data = {"title": title, "body": body};
    String jsonData = jsonEncode(data);
    await http.post(Uri.parse(Endpoints.news),
        body: jsonData, headers: {'Content-type': 'application/json'});
  }

  static Future<void> updateData(String id, String title, String body) async {
    Map<String, String> data = {"id": id, "title": title, "body": body};
    String jsonData = jsonEncode(data);
    await http.put(Uri.parse('${Endpoints.news}/$id'),
        body: jsonData, headers: {'Content-type': 'application/json'});
  }

  static Future<void> deleteData(String id) async {
    await http.delete(Uri.parse('${Endpoints.news}/$id'),
        headers: {'Content-type': 'application/json'});
  }

  static Future<List<News>> fetchNews() async {
    final response = await http.get(Uri.parse(Endpoints.news));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((item) => News.fromJson(item)).toList();
    } else {
      //menghandle eror
      throw Exception('Failed to load news');
    }
  }
}
