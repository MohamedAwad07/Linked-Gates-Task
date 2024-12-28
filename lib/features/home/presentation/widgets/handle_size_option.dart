import 'package:flutter/material.dart';
import 'package:linkedgates_task/core/themes/text_theme.dart';

List<Widget> buildSizeOptions(List<String> sizes) {
  return sizes
      .map(
        (size) => Container(
          height: 25,
          width: 25,
          margin: const EdgeInsets.only(
            left: 5,
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Colors.black,
              width: 0.5,
            ),
          ),
          child: Center(
            child: Text(
              size,
              style: TextThemeHandler.sizeOptionStyle(),
            ),
          ),
        ),
      )
      .toList();
}
