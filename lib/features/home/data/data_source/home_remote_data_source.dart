import 'package:flutter/foundation.dart';
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
    List<ProductEntity> products = [];
    try {
      for (var productJson in result.data) {
        products.add(ProductModel.fromJson(productJson as Map<String, dynamic>));
      }
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print(stackTrace);
      }
    }
    return products;
  }
}
