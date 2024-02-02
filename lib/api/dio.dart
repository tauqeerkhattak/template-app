import 'dart:developer';

import 'package:dio/dio.dart';

final dio = Dio()
  ..interceptors.addAll([
    InterceptorsWrapper(
      // onRequest: (options, handler) {
      //   log('Request body: ${options.data}');
      //   handler.next(options);
      // },
      onResponse: (options, handler) {
        log('Response body: ${options.data}');
        handler.next(options);
      },
    ),
  ]);
