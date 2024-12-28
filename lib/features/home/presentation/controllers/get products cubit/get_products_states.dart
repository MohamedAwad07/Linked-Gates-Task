import 'package:equatable/equatable.dart';
import 'package:linkedgates_task/features/home/domain/entities/product_entity.dart';

abstract class GetProductsState extends Equatable {
  const GetProductsState();

  @override
  List<Object> get props => [];
}

class GetProductsInitial extends GetProductsState {}

class GetProductsLoading extends GetProductsState {}

class GeProductsOnSuccess extends GetProductsState {
  final List<ProductEntity> products;

  const GeProductsOnSuccess({required this.products});
}

class GetProductsOnFailure extends GetProductsState {
  final String message;
  const GetProductsOnFailure({required this.message});
}