import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/shimmer_size.dart';

class ShimmerCardSummary extends StatelessWidget {
  final ShimmerData _data;

  ShimmerCardSummary(this._data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(ShimmerSize.spaceS),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                _data.tags.first,
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .copyWith(color: Colors.grey),
              ),
              Spacer(),
              Text(
                _data.genre.toString().substring(6),
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Card(
              elevation: 12,
              child: Container(
                padding: EdgeInsets.all(ShimmerSize.spaceM),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      children: <Widget>[
                        Image.network(
                          'https://www.pakutaso.com/shared/img/thumb/KUMAKICHI1027642_TP_V.jpg',
                          width: constraints.maxWidth / 2,
                        ),
                        SizedBox(
                          width: ShimmerSize.spaceM,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
