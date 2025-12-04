import 'package:flutter/foundation.dart';

abstract interface class HttpClient {
  Future<void> post(String url, Map<String, dynamic> body);
}

class HttpClientImpl implements HttpClient {
  @override
  Future<void> post(String url, Map<String, dynamic> body) async {
    await Future.delayed(const Duration(seconds: 2));
    debugPrint('HttpClientImpl: post - url: $url, body: $body');
  }
}
