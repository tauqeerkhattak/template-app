import '../../../../models/product.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final List<Product> products;

  SuccessHomeState({
    required this.products,
  });
}

class ErrorHomeState extends HomeState {
  final String message;

  ErrorHomeState({
    required this.message,
  });
}
