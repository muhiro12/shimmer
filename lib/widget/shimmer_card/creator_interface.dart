import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/widget/shimmer_card/creator.dart';

class ShimmerCardCreatorInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: ShimmerCategory.values
            .map(
              (category) => ListTile(
                title: Text(EnumParser.upperCamelCaseStringOf(category)),
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
