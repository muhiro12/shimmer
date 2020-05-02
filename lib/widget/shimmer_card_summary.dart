import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/database/shimmer_log.dart';
import 'package:shimmer/model/date_parser.dart';
import 'package:shimmer/scaffold/shimmer_card_detail_scaffold.dart';
import 'package:shimmer/widget/route_navigator.dart';
import 'package:shimmer/widget/shimemr_card.dart';
import 'package:shimmer/widget/shimmer_card_child.dart';

class ShimmerCardSummary extends ShimmerCard {
  final ShimmerLog _log;
  final double elevation;
  final bool toDetail;

  ShimmerCardSummary(this._log, {this.elevation, this.toDetail = false});

  @override
  Widget build(BuildContext context) {
    return ShimmerCard(
      elevation: elevation,
      onTap: toDetail ? () => _onCardTap(context) : null,
      children: <ShimmerCardChild>[
        ShimmerCardChild.instance(_log.images, end: 1),
        ShimmerCardChild(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(DateParser.yearMonthDayStringOf(_log.date)),
              Text(
                _log.title,
                style: Theme.of(context).textTheme.headline,
              ),
              Text(_log.creator),
              Text(_log.location),
            ],
          ),
        ),
      ],
    );
  }

  void _onCardTap(BuildContext context) {
    RouteNavigator.push(
      context: context,
      widget: ShimmerCardDetailScaffold(_log),
    );
  }

  @override
  bool isEmpty() {
    return false;
  }
}
