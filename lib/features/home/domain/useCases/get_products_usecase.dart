import 'package:either_dart/either.dart';
import 'package:linkedgates_task/core/errors/failure.dart';
import 'package:linkedgates_task/core/use%20cases/base_use_case.dart';
import 'package:linkedgates_task/features/home/domain/entities/product_entity.dart';
import 'package:linkedgates_task/features/home/domain/repository/home_repo.dart';

class GetProductsUseCase extends BaseUseCase<List<ProductEntity>, NoParameters> {
  final BaseHomeRepo viewProductsRepo;
  GetProductsUseCase({required this.viewProductsRepo});
  @override
  Future<Either<Failure, List<ProductEntity>>> call(
      NoParameters parameter) async {
    try {
      return await viewProductsRepo.getProducts();
    } catch (e) {
      return Left(e as Failure);
    }
  }
}
