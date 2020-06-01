import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_parameter.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/widget/shimmer_card/shimmer_card_summary.dart';
import 'package:shimmer/widget/sized_spacer.dart';
import 'package:shimmer/widget/timeline/timeline_item.dart';

class CardTimelineItem extends TimelineItem {
  CardTimelineItem(this._log) : super(_log);

  final ShimmerLog _log;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppParameter.spaceM),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                _log.tags.isNotEmpty ? _log.tags.first : '#None',
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
              ),
              Spacer(),
              Text(
                _log.category.toUpperCamelCaseString(),
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
          SizedSpacer(
            height: AppParameter.spaceS,
          ),
          Container(
            transform: Matrix4.translationValues(
              AppParameter.spaceL,
              0,
              0,
            ),
            child: ShimmerCardSummary(
              _log,
              toDetail: true,
            ),
          ),
        ],
      ),
    );
  }
}
