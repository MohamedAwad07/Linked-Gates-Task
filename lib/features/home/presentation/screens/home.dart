import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkedgates_task/core/di/service_locator.dart';
import 'package:linkedgates_task/features/home/presentation/controllers/get%20products%20cubit/get_products_cubit.dart';
import 'package:linkedgates_task/features/home/presentation/controllers/get%20products%20cubit/get_products_states.dart';
import 'package:linkedgates_task/features/home/presentation/widgets/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> handleRefresh(BuildContext context) async {
    BlocProvider.of<GetProductsCubit>(context).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) {
          final cubit = sl<GetProductsCubit>();
          cubit.getProducts();
          return cubit;
        },
        child: BlocBuilder<GetProductsCubit, GetProductsState>(
          builder: (context, state) {
            if (state is GetProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GetProductsOnFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.message,
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    IconButton(
                      onPressed: () {
                        handleRefresh(context);
                      },
                      icon: Icon(Icons.refresh),
                    ),
                  ],
                ),
              );
            }
            if (state is GeProductsOnSuccess) {
              return RefreshIndicator.adaptive(
                onRefresh: () => handleRefresh(context),
                child: ListView.separated(
                  padding: const EdgeInsets.all(15),
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return ProductList(
                      title: product.name.toUpperCase(),
                      imagePath: product.imageURL,
                      description: product.productDescription,
                      price: product.productPrice,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 15),
                  itemCount: state.products.length,
                ),
              );
            }
            return const Center(
              child: Text('Unexpected state, please try again later.'),
            );
          },
        ),
      ),
    );
  }
}
