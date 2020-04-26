import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_size.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/model/date_parser.dart';
import 'package:shimmer/widget/shimmer_card.dart';

class ShimmerCardSummary extends StatelessWidget {
  final ShimmerData _shimmerData;
  final double elevation;
  final Function onTap;

  ShimmerCardSummary(this._shimmerData, {this.elevation, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ShimmerCard(
      elevation: elevation,
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: <Widget>[
              Image.network(
                'https://www.pakutaso.com/shared/img/thumb/KUMAKICHI1027642_TP_V.jpg',
                width: constraints.maxWidth / 2,
              ),
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
}
