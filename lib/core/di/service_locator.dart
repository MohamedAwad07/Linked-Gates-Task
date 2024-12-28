import 'package:get_it/get_it.dart';
import 'package:linkedgates_task/core/network/api%20service/api_service.dart';
import 'package:linkedgates_task/features/home/data/data_source/home_remote_data_source.dart';
import 'package:linkedgates_task/features/home/data/repository/home_repo_impl.dart';
import 'package:linkedgates_task/features/home/domain/repository/home_repo.dart';
import 'package:linkedgates_task/features/home/domain/useCases/get_products_usecase.dart';
import 'package:linkedgates_task/features/home/presentation/controllers/get%20products%20cubit/get_products_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    registerSingletons();
    registerDataSources();
    registerRepositories();
    registerUseCases();
    registerCubits();
  }

  static void registerSingletons() {
    sl.registerSingleton<ApiService>(ApiService());
  }

  static void registerDataSources() {
     sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(apiService: sl()));
  }

  static void registerRepositories() {
     sl.registerLazySingleton<BaseHomeRepo>(() => HomeRepoImpl(homeRemoteDataSource: sl()));
  }

  static void registerUseCases() {
    sl.registerLazySingleton<GetProductsUseCase>(() => GetProductsUseCase(viewProductsRepo: sl()));
  }

  static void registerCubits() {
     sl.registerFactory<GetProductsCubit>(() => GetProductsCubit(getProductsUseCase: sl())..getProducts());
  }
}
