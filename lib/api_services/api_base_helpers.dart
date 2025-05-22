import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class ApiBaseHelper {
  final String baseUrl = "https://qa-api.habbiton.com/v1/";

  Future<Map<String, String>> _getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwtToken') ?? '';
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<dynamic> get(String url) async {
    debugPrint('Api Get, url ${baseUrl + url}');
    dynamic responseJson;
    try {
      final headers = await _getHeaders();
      final response = await http
          .get(Uri.parse(baseUrl + url), headers: headers)
          .timeout(const Duration(seconds: 180));
      responseJson = _returnResponse(response);
    } on TimeoutException {
      throw Exception("Timeout");
    } on SocketException {
      throw Exception("No Internet connection");
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    debugPrint('Api Post, url ${baseUrl + url}');
    final headers = await _getHeaders();
    dynamic responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(baseUrl + url),
            body: jsonEncode(body),
            headers: headers,
          )
          .timeout(const Duration(seconds: 180));
      responseJson = _returnResponse(response);
    } on TimeoutException {
      throw Exception("Timeout");
    } on SocketException {
      throw Exception("No Internet connection");
    }
    return responseJson;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
      return json.decode(response.body);
    case 400:
    case 404:
    case 500:
      return json.decode(response.body);
    case 401:
    case 403:
      Fluttertoast.showToast(msg: "Unauthorized");
      throw Exception("Unauthorized");
    default:
      throw Exception("Error ${response.statusCode}");
  }
}
