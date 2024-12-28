import 'package:dio/dio.dart';
import 'package:linkedgates_task/core/errors/failure.dart';
import 'package:linkedgates_task/core/utils/app_strings.dart';

class ApiService {
  static const String baseUrl = "https://api.escuelajs.co/api/v1/";
  Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
      validateStatus: (int? status) {
        return (status ?? 0) < 500;
      },
    ),
  );

  Future<Response> get({
    required String endPoint,
  }) async {
    try {
      Response response = await dio.get(
        '$baseUrl$endPoint',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        throw response;
      }
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioError(e);
      } else {
        throw _handleError(e);
      }
    }
  }

  static Exception _handleError(dynamic e) {
    if (e.data != null) {
      final response = e.data;
      switch (e.statusCode) {
        case 400:
          throw ServerFailure(message: response['message'] ?? 'Bad request');
        case 401:
          throw const ServerFailure(message: AppStrings.errorUnauthorized);
        case 403:
          throw const ServerFailure(message: AppStrings.errorForbidden);
        case 404:
          throw ServerFailure(
              message: response['message'] ?? AppStrings.errorResource);
        case 429:
          throw const ServerFailure(message: AppStrings.errorServer);
        case 500:
          throw const ServerFailure(message: AppStrings.errorInternal);
        default:
          throw ServerFailure(
              message:
                  'Server error: ${e.response!.statusCode} ${e.response!.statusMessage}');
      }
    } else {
      throw const ServerFailure(message: AppStrings.errorNetwork);
    }
  }
}
