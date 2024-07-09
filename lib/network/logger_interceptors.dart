// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

///
/// Se aggiunto come Interceptor a Dio, stampa in console i dati relativi alla
/// richiesta, alla response se va in success o l'errore se va in errore
///
///[More info about interceptors](https://pub.dev/documentation/dio/latest/dio/Interceptors-class.html)
///
class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _printLogs([
      'REQUEST[${options.method}]',
      'PATH:${options.uri}',
      'HEADER:${options.headers}',
      'BODY:${jsonEncode(options.data)}'
    ]);
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _printLogs([
      'RESPONSE[${response.statusCode}]',
      'PATH:${response.requestOptions.path}',
      'BODY:${jsonEncode(response.data)}'
    ]);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _printLogs([
      'ERROR[${err.response?.statusCode}]',
      'PATH:${err.requestOptions.path}',
      'BODY:${jsonEncode(err.response?.data ?? '')}'
    ]);

    return super.onError(err, handler);
  }
}

/// Print the logs in console with a separator
void _printLogs(List<String> logs) {
  String fullLog = '';

  for (String log in logs) {
    fullLog += '$log\r\r';
  }

  debugPrint(fullLog);
}
