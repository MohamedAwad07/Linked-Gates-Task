import 'package:either_dart/either.dart';
import 'package:linkedgates_task/core/errors/failure.dart';
import 'package:linkedgates_task/features/home/data/data_source/home_remote_data_source.dart';
import 'package:linkedgates_task/features/home/domain/entities/product_entity.dart';
import 'package:linkedgates_task/features/home/domain/repository/home_repo.dart';

class HomeRepoImpl extends BaseHomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepoImpl({required HomeRemoteDataSource homeRemoteDataSource}) : _homeRemoteDataSource = homeRemoteDataSource;
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async{
    final result = await _homeRemoteDataSource.getProducts();
    return Right(result);
  }
}