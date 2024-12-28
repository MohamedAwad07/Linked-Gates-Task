import 'package:flutter/material.dart';
import 'package:linkedgates_task/features/home/presentation/controllers/get%20products%20cubit/get_products_states.dart';
import 'package:linkedgates_task/features/home/presentation/widgets/product_item.dart';

class MobileLayout extends StatefulWidget {
  final GetProductsOnSuccess state;

  const MobileLayout({super.key, required this.state});

  @override
  MobileLayoutState createState() => MobileLayoutState();
}

class MobileLayoutState extends State<MobileLayout> {
  late ScrollController scrollController;
  bool isLoading = false;
  int loadedItemsCount = 10;
  final int itemsPerPage = 10;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent && !isLoading) {
        loadMoreProducts();
      }
    });

    loadMoreProducts();
  }

  Future<void> loadMoreProducts() async {
    if (loadedItemsCount >= widget.state.products.length) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      isLoading = false;
      int nextPageStart = loadedItemsCount;
      int nextPageEnd = (loadedItemsCount + itemsPerPage) > widget.state.products.length ? widget.state.products.length : (loadedItemsCount + itemsPerPage);

      loadedItemsCount = nextPageEnd;
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(15),
      itemCount: loadedItemsCount + (isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == loadedItemsCount) {
          return isLoading ? Center(child: CircularProgressIndicator()) : SizedBox.shrink();
        }

        final product = widget.state.products[index];
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
