import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flexcardapio/src/core/rest_client/interceptors/auth_interceptors.dart';

import '../env/env.dart';

class CustomDio extends DioForNative {
  late final AuthInterceptor _authInterceptor;

  CustomDio()
      : super(
          BaseOptions(
            baseUrl: Env.instance['backend_url'] ?? '',
            connectTimeout: 5000, // const Duration(seconds: 5),
            receiveTimeout: 60000, //const Duration(seconds: 60),
          ),
        ) {
    interceptors.add(
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ),
    );

    _authInterceptor = AuthInterceptor();
  }

  CustomDio auth() {
    interceptors.add(_authInterceptor);
    return this;
  }

  CustomDio unauth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}
