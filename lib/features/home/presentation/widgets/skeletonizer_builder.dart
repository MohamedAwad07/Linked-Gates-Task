import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerHolder extends StatelessWidget {
  const SkeletonizerHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.grey[300],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 5),
                Container(
                  height: 15,
                  width: 150,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 15,
                  width: 100,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
