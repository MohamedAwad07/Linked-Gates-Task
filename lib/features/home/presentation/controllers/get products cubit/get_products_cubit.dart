import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkedgates_task/core/use%20cases/base_use_case.dart';
import 'package:linkedgates_task/features/home/domain/entities/product_entity.dart';
import 'package:linkedgates_task/features/home/domain/useCases/get_products_usecase.dart';
import 'package:linkedgates_task/features/home/presentation/controllers/get%20products%20cubit/get_products_states.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  final GetProductsUseCase getProductsUseCase;
  GetProductsCubit({required this.getProductsUseCase}) : super(GetProductsInitial());

  static GetProductsCubit get(context) => BlocProvider.of(context);

  late List<ProductEntity> currentProducts;

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    final products = await getProductsUseCase.call(const NoParameters());
    products.fold((failure) {
      currentProducts = [];
      emit(GetProductsOnFailure(message: failure.message));
    }, (success) {
      currentProducts = success;
      emit(GeProductsOnSuccess(products: success));
    });
  }
}
