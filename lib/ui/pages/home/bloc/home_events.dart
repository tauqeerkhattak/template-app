abstract class HomeEvent {}

class GetProductsHomeEvent extends HomeEvent {}

class ErrorHomeEvent extends HomeEvent {
  final String message;

  ErrorHomeEvent({
    required this.message,
  });
}
