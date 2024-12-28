import 'package:either_dart/either.dart';
import 'package:linkedgates_task/core/errors/failure.dart';
import 'package:linkedgates_task/features/home/domain/entities/product_entity.dart';

abstract class BaseHomeRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
