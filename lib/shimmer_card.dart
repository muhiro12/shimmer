import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer_size.dart';

class ShimmerCard extends StatelessWidget {
  final String _text;

  ShimmerCard(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(ShimmerSize.spaceS),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                '#theHIATUS',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.grey),
              ),
              Spacer(),
              Text(
                'Live',
                style: TextStyle(color: Colors.grey),
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
                              Text(_text.substring(0, 10)),
                              Text(
                                'Jive Turkey',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text('the HIATUS'),
                              Text('Tokyo'),
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
