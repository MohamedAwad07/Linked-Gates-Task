import 'package:linkedgates_task/core/network/api%20service/api_service.dart';
import 'package:linkedgates_task/features/home/data/models/product_model/product_model.dart';
import 'package:linkedgates_task/features/home/domain/entities/product_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductEntity>> getProducts();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl({required ApiService apiService}) : _apiService = apiService;

  @override
  Future<List<ProductEntity>> getProducts() async {
    const String endPoint = 'products';
    var result = await _apiService.get(endPoint: endPoint);
    List<ProductEntity> products = result.data.map((productJson) => ProductModel.fromJson(productJson)).toList();

    return products;
  }
}
