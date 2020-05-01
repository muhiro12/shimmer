import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_parameter.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/model/parser/enum_parser.dart';
import 'package:shimmer/widget/common/sized_spacer.dart';
import 'package:shimmer/widget/shimmer_card_creator/shimmer_card_creator_scaffold.dart';

class ShimmerCardCreatorLauncher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedSpacer(
          height: AppParameter.spaceS,
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
          thickness: AppParameter.border,
        ),
        Expanded(
          child: ListView(
            children: ShimmerCategory.values
                .map(
                  (category) => ListTile(
                    title: Text(EnumParser.upperCamelCaseStringOf(category)),
                    onTap: () => _onListItemTap(context, category),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  void _onListItemTap(BuildContext context, ShimmerCategory category) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => ShimmerCardCreatorScaffold(category),
    ).whenComplete(
      () => Navigator.pop(context),
    );
  }
}
