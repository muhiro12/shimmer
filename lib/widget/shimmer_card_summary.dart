import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_size.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/widget/shimmer_card.dart';

class ShimmerCardSummary extends StatelessWidget {
  final ShimmerData _data;
  final double elevation;
  final Function onTap;

  ShimmerCardSummary(this._data, {this.elevation, this.onTap});

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
                    Text(_data.date.toString().substring(0, 10)),
                    Text(
                      _data.title,
                      style: Theme.of(context).textTheme.headline,
                    ),
                    Text(_data.artist),
                    Text(_data.location),
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
