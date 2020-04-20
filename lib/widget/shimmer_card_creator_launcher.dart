import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_size.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/scaffold/shimmer_card_creator.dart';

class ShimmerCardCreatorLauncher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: AppSize.spaceS,
        ),
        ListTile(
          title: Text(
            'Category',
            style: Theme.of(context).textTheme.subhead.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Divider(
          color: Theme.of(context).accentColor,
          thickness: AppSize.border,
        ),
        Expanded(
          child: ListView(
            children: ShimmerCategory.values
                .map(
                  (category) => ListTile(
                    title: Text(EnumParser.upperCamelCaseStringOf(category)),
                    onTap: () => _onTap(context, category),
                  ),
                )
                .toList(),
          ),
        ),
      ],
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
