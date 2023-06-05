import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final sp = await SharedPreferences.getInstance();

    final oauthUsername = sp.getString('oauthUsername');
    final oauthPassword = sp.getString('oauthPassword');
    final oauthToken = sp.getString('oauthToken');

    final accessToken = sp.getString('accessToken');

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    } else {
      options.headers['username'] = oauthUsername;
      options.headers['password'] = oauthPassword;
      options.headers['token'] = oauthToken;
    }

    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      //GlobalContext.instance.loginExpire();
    } else {
      handler.next(err);
    }
  }
}
