import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_app/exceptions/api_exception.dart';

abstract class BaseBloc<E, S> extends Bloc<E, S> {
  BaseBloc(S initialState) : super(initialState);

  void onErrorCallback(String message);

  Future<void> performSafeAction(AsyncCallback action) async {
    try {
      await action.call();
    } on DioException catch (e, stackTrace) {
      log('Error: ${e.message}', stackTrace: stackTrace);
      onErrorCallback(e.message ?? 'Connection Error: ${e.error}');
    } on ApiException catch (e, stackTrace) {
      log('Error: ${e.message}', stackTrace: stackTrace);
      onErrorCallback(e.message);
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      onErrorCallback(e.toString());
    }
  }
}
