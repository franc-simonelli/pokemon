// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:pokedex/network/loading_interceptors.dart';

class NetworkClient {
  ///Ritorna un'instanza di [Dio] con preimpostati gli interceptor e la [baseUrl]
  ///
  ///Se `showLoading` è true mostra una schermata di loading mentre la chiamata è in corso
  ///
  ///Se `isAuthenticated` è true aggiunge all'header il valore `Authorization`
  ///assegnadoci il bearer token
  ///
  Dio getDio({
    bool showLoading = true,
    bool handleError = true,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://pokeapi.co/api/v2/',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    if (showLoading) {
      dio.interceptors.add(LoadingInterceptors());
    }

    // if (handleError) {
    //   dio.interceptors.add(ErrorInterceptors());
    // }

    return dio;
  }
}
