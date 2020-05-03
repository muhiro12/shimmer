import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/model/date_parser.dart';
import 'package:shimmer/model/extended_list.dart';
import 'package:shimmer/router/shimmer_card_child_router.dart';
import 'package:shimmer/router/shimmer_card_detail_scaffold_router.dart';
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
      onTap: toDetail ? () => _onCardTap(context, _log) : null,
      children: <ShimmerCardChild>[
        ShimmerCardChildRouter(
          items: ExtendedList(_log.images).safetySublist(0, 1),
        ).injected(),
        ShimmerCardChildRouter(
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
        ).injected(),
      ],
    );
  }

  void _onCardTap(BuildContext context, ShimmerLog log) {
    ShimmerCardDetailScaffoldRouter(
      context: context,
      log: log,
    ).push();
  }

  @override
  bool isEmpty() {
    return false;
  }
}
