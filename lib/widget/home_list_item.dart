import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_size.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/scaffold/shimmer_card_detail.dart';
import 'package:shimmer/widget/shimmer_card_summary.dart';

class HomeListItem extends StatelessWidget {
  final ShimmerData _data;

  HomeListItem(this._data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(AppSize.spaceM),
          child: Row(
            children: <Widget>[
              Text(
                _data.tags?.first ?? '#None',
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .copyWith(color: Colors.grey),
              ),
              Spacer(),
              Text(
                EnumParser.upperCamelCaseStringOf(_data.category),
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
        ),
        Container(
          transform: Matrix4.translationValues(AppSize.spaceL, 0, 0),
          child: ShimmerCardSummary(
            _data,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ShimmerCardDetail(_data),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
