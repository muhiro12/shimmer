import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_size.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/widget/shimmer_card_summary.dart';

class HomeListItem extends StatelessWidget {
  final ShimmerData _shimmerData;

  HomeListItem(this._shimmerData);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(AppSize.spaceM),
          child: Row(
            children: <Widget>[
              Text(
                _shimmerData.tags.isNotEmpty
                    ? _shimmerData.tags.first
                    : '#None',
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .copyWith(color: Colors.grey),
              ),
              Text(_shimmerData.date.toString().substring(10)),
              Spacer(),
              Text(
                EnumParser.upperCamelCaseStringOf(_shimmerData.category),
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
            _shimmerData,
            toDetail: true,
          ),
        ),
      ],
    );
  }
}