import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/model/date_parser.dart';
import 'package:shimmer/model/list_extension.dart';
import 'package:shimmer/scaffold/shimmer_card_detail_scaffold.dart';
import 'package:shimmer/widget/shimemr_card.dart';
import 'package:shimmer/widget/shimmer_card_child.dart';

class ShimmerCardSummary extends StatelessWidget {
  ShimmerCardSummary(
    this._log, {
    this.elevation,
    this.toDetail = false,
  });

  final ShimmerLog _log;
  final double elevation;
  final bool toDetail;

  @override
  Widget build(BuildContext context) {
    return ShimmerCard.init(
      elevation: elevation,
      onTap: toDetail ? () => _onTap(context, _log) : null,
      children: <ShimmerCardChild>[
        ShimmerCardChild.init(
          items: _log.images.safetySublist(0, 1),
        ),
        ShimmerCardChild.init(
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

  void _onTap(BuildContext context, ShimmerLog log) {
    ShimmerCardDetailScaffold.push(context, log);
  }
}
