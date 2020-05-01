import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/model/date_parser.dart';
import 'package:shimmer/widget/common/route_navigator.dart';
import 'package:shimmer/widget/common/shimemr_card.dart';
import 'package:shimmer/widget/shimmer_card_detail/shimmer_card_detail_scaffold.dart';

class ShimmerCardSummary extends ShimmerCard {
  final ShimmerData _shimmerData;
  final double elevation;
  final bool toDetail;

  ShimmerCardSummary(this._shimmerData,
      {this.elevation, this.toDetail = false});

  @override
  Widget build(BuildContext context) {
    return ShimmerCard(
      elevation: elevation,
      onTap: toDetail ? () => _onCardTap(context) : null,
      children: <Widget>[
        _shimmerData.images.isNotEmpty
            ? Image.memory(
                _shimmerData.images.first,
              )
            : Container(),
        Column(
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
      ],
    );
  }

  void _onCardTap(BuildContext context) {
    RouteNavigator.push(
      context: context,
      widget: ShimmerCardDetailScaffold(_shimmerData),
    );
  }
}
