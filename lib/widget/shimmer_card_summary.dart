import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_size.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/model/date_parser.dart';
import 'package:shimmer/model/route_navigator.dart';
import 'package:shimmer/scaffold/shimmer_card_detail.dart';
import 'package:shimmer/widget/shimmer_card.dart';

class ShimmerCardSummary extends StatelessWidget {
  final ShimmerData _shimmerData;
  final double elevation;
  final bool toDetail;

  ShimmerCardSummary(this._shimmerData,
      {this.elevation, this.toDetail = false});

  @override
  Widget build(BuildContext context) {
    return ShimmerCard(
      elevation: elevation,
      onTap: toDetail ? () => _onTap(context) : null,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: <Widget>[
              _shimmerData.images.isNotEmpty
                  ? Image.memory(
                      _shimmerData.images.first,
                      width: constraints.maxWidth / 2,
                    )
                  : Container(),
              SizedBox(
                width: AppSize.spaceM,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(DateParser.yearMonthDayStringOf(_shimmerData.date)),
                    Text(
                      _shimmerData.title,
                      style: Theme.of(context).textTheme.headline,
                    ),
                    Text(_shimmerData.creator),
                    Text(_shimmerData.location),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onTap(BuildContext context) {
    RouteNavigator.push(
      context: context,
      widget: ShimmerCardDetail(_shimmerData),
    );
  }
}
