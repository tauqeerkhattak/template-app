import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:template_app/models/product.dart';
import 'package:template_app/utils/constants.dart';

part 'store_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class StoreApi {
  factory StoreApi(Dio dio, {String baseUrl}) = _StoreApi;

  @GET('/products')
  Future<List<Product>> getProducts();
}
