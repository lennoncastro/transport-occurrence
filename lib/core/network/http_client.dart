import 'dart:math';
import 'package:flutter/foundation.dart';

abstract interface class HttpClient {
  Future<void> post(String url, Map<String, dynamic> body);
}

class HttpClientImpl implements HttpClient {
  final Random _random = Random();

  @override
  Future<void> post(String url, Map<String, dynamic> body) async {
    await Future.delayed(const Duration(seconds: 2));
    if (_random.nextDouble() >= 0.7) {
      throw Exception('Erro ao enviar ocorrência');
    }
    debugPrint('HttpClientImpl: post - url: $url, body: $body');
  }
}
