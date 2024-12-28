import 'package:flutter/material.dart';
import 'package:linkedgates_task/features/home/presentation/controllers/get%20products%20cubit/get_products_states.dart';
import 'package:linkedgates_task/features/home/presentation/widgets/product_item.dart';

class DesktopLayout extends StatelessWidget {
  final GetProductsOnSuccess state;
  const DesktopLayout({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 1,
      ),
      itemCount: state.products.length,
      itemBuilder: (context, index) {
        final product = state.products[index];
        return ProductCard(
          title: product.name.toUpperCase(),
          imagePath: product.imageURL,
          description: product.productDescription,
          price: product.productPrice,
        );
      },
    );
  }
}
