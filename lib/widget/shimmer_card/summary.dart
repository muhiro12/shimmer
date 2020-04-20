import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration//size.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/widget/shimmer_card/detail.dart';

class ShimmerCardSummary extends StatelessWidget {
  final ShimmerData _data;

  ShimmerCardSummary(this._data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppSize.spaceS),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                _data.tags?.first ?? '#None',
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .copyWith(color: Colors.grey),
              ),
              Spacer(),
              Text(
                EnumParser.upperCamelCaseStringOf(_data.category),
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ShimmerCardDetail(_data),
                  ),
                );
              },
              child: Card(
                elevation: 12,
                child: Container(
                  padding: EdgeInsets.all(AppSize.spaceM),
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
