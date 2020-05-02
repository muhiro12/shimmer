import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_parameter.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/widget/shimmer_card_summary.dart';

class TimelineItem extends StatelessWidget {
  final ShimmerLog _log;

  TimelineItem(this._log);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(AppParameter.spaceM),
          child: Row(
            children: <Widget>[
              Text(
                _log.tags.isNotEmpty ? _log.tags.first : '#None',
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .copyWith(color: Colors.grey),
              ),
              Text(_log.date.toString().substring(10)),
              Spacer(),
              Text(
                EnumParser.upperCamelCaseStringOf(_log.category),
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
        ),
        Container(
          transform: Matrix4.translationValues(AppParameter.spaceL, 0, 0),
          child: ShimmerCardSummary(
            _log,
            toDetail: true,
          ),
        ),
      ],
    );
  }
}
