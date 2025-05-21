import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/core/app/res/radius.dart';
import 'package:Y99/source/common/widget/box/custom_box.dart';
import 'package:flutter/material.dart';


class SearchWidget extends StatelessWidget {
  final TextEditingController searchController;
  final String hintText;
  final Color? fillColor;

  const SearchWidget({
    super.key,
    required this.searchController,
    this.hintText = 'Search',
    this.fillColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBox(
      decoration: BoxDecoration(
        color: fillColor ?? ResColor.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(ResRadius.r8),
      ),
      padding: EdgeInsets.zero,
      child: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(
            Icons.search,
            color: ResColor.placeholderColor,
          ),
          border: InputBorder.none,
          fillColor: Colors.transparent,
          filled: true,
          hintStyle: const TextStyle(
            color: ResColor.placeholderColor,
          ),
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
