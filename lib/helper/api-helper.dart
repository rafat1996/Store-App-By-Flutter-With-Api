import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiHelper {
  final Dio dio;

  ApiHelper({required this.dio});

  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    Response response = await dio.get(url, options: Options(headers: headers));

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(
          'there is error from status Code = ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic data,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    Response response =
        await dio.post(url, data: data, options: Options(headers: headers));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'there is error from status Code = ${response.statusCode} with Response data= ${response.data}');
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic data,
      @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    Response response =
        await dio.put(url, data: data, options: Options(headers: headers));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'there is error from status Code = ${response.statusCode} with Response data= ${response.data}');
    }
  }
}
