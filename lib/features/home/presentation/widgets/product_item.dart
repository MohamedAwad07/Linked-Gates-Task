import 'package:flutter/material.dart';
import 'package:linkedgates_task/core/themes/text_theme.dart';
import 'package:linkedgates_task/features/home/presentation/widgets/handle_size_option.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;
  final num price;

  const ProductCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 170,
        child: Row(
          spacing: 10,
          children: [
            Container(
              width: 130,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.error,
                ),
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextThemeHandler.titleStyle(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      description,
                      style: TextThemeHandler.descriptionStyle(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '\$$price',
                      style: TextThemeHandler.priceStyle(),
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 230, 211, 7),
                        ),
                        Text(
                          "4.8",
                          style: TextThemeHandler.ratingStyle(),
                        ),
                        Text(
                          "Rating",
                          style: TextThemeHandler.sizeLabelStyle(),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Row(
                        spacing: 1,
                        children: [
                          Text(
                            "Size",
                            style: TextThemeHandler.sizeLabelStyle(),
                          ),
                          ...buildSizeOptions(
                            [
                              'S',
                              'M',
                              'L'
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border_rounded),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
