import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_parameter.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/main.dart';
import 'package:shimmer/model/shimmer_card_creator_type.dart';
import 'package:shimmer/scaffold/shimmer_card_creator_scaffold.dart';
import 'package:shimmer/widget/flat_list_item.dart';
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
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Divider(
          thickness: AppParameter.dividerThick,
          color: Theme.of(context).accentColor,
        ),
        Expanded(
          child: ListView(
            children: ShimmerCategory.values
                .map(
                  (category) => FlatListItem(
                    ListTile(
                      title: Text(category.toUpperCamelCaseString()),
                      onTap: () => _onTap(context, category),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  void _onTap(BuildContext context, ShimmerCategory category) {
    final log = ShimmerLog(
      category: category,
    );
    ShimmerCardCreatorScaffold.showAsModal(
      type: ShimmerCardCreatorType.create,
      log: log,
      completion: (_) => Navigator.pop(context),
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
