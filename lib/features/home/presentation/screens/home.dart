import 'package:flutter/material.dart';
import 'package:linkedgates_task/features/home/presentation/widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.separated(
        padding: const EdgeInsets.all(15),
        itemBuilder: (context, index) {
          final title = 'Manga'.toUpperCase();
          return ProductList(
            title: title,
            imagePath: 'https://i.imgur.com/cSytoSD.jpeg',
            description: 'Product Description',
            price: 100,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemCount: 10,
      ),
    );
  }
}
