import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_parameter.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/main.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/scaffold/shimmer_card_creator_scaffold.dart';
import 'package:shimmer/widget/sized_spacer.dart';

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
    ShimmerCardCreatorScaffold.showAsModal(
      context,
      category,
      completion: () => Navigator.pop(context),
    );
  }

  static void showAsBottomSheet() {
    showModalBottomSheet(
      context: MyHomePage.context,
      builder: (context) => SafeArea(
        child: ShimmerCardCreatorLauncher(),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppParameter.radius),
        ),
      ),
    );
  }
}
