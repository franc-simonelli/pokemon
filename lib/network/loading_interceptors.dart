// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:pokedex/core/di/shared_export.dart';

class LoadingInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    loadingNotifier.addFullscreenLoadingTask(options.path);
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _removeTaskPending(response.requestOptions);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _removeTaskPending(err.requestOptions);
    return super.onError(err, handler);
  }

  void _removeTaskPending(RequestOptions options) {
    loadingNotifier.removeTask(options.path);
  }
}
