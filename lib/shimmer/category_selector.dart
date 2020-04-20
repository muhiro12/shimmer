import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/shimmer/card_creator.dart';

class ShimmerCardCategorySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: ShimmerCategory.values
            .map(
              (category) => ListTile(
                title: Text(category
                    .toString()
                    .replaceAll('ShimmerCategory.', '')
                    .toUpperCase()),
                onTap: () => _onTap(context, category),
              ),
            )
            .toList(),
      ),
    );
  }

  void _onTap(BuildContext context, ShimmerCategory category) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => ShimmerCardCreator(category),
    ).whenComplete(
      () => Navigator.pop(context),
    );
  }
}
