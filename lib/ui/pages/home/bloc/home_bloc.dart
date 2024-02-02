import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_app/api/dio.dart';
import 'package:template_app/api/store_api.dart';
import 'package:template_app/ui/pages/home/bloc/home_events.dart';
import 'package:template_app/ui/pages/home/bloc/home_states.dart';
import 'package:template_app/utils/base_bloc.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  final _storeApi = StoreApi(dio);
  HomeBloc() : super(InitialHomeState()) {
    on<HomeEvent>(
      (event, emit) async {
        if (event is ErrorHomeEvent) {
          emit(
            ErrorHomeState(
              message: event.message,
            ),
          );
        } else if (event is GetProductsHomeEvent) {
          await _getEvents(emit);
        }
      },
    );
  }

  Future<void> _getEvents(Emitter<HomeState> emit) async {
    await performSafeAction(() async {
      emit(
        LoadingHomeState(),
      );
      final products = await _storeApi.getProducts();
      emit(
        SuccessHomeState(
          products: products,
        ),
      );
    });
  }

  @override
  void onErrorCallback(String message) {
    add(
      ErrorHomeEvent(
        message: message,
      ),
    );
  }
}
