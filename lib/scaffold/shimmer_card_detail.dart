import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shimmer/configuration/app_size.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/model/date_parser.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/model/share.dart';
import 'package:shimmer/widget/shimmer_card.dart';
import 'package:shimmer/widget/shimmer_card_summary.dart';

class ShimmerCardDetail extends StatelessWidget {
  final ShimmerData _shimmerData;

  ShimmerCardDetail(this._shimmerData);

  final ScreenshotController _controller = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_shimmerData.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () => _onShareIconPressed(context),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSize.spaceM),
        children: <Widget>[
          ShimmerCardSummary(_shimmerData),
          ShimmerCard(
            child:
                Text(EnumParser.upperCamelCaseStringOf(_shimmerData.category)),
          ),
          ShimmerCard(
            child: Text(DateParser.yearMonthDayStringOf(_shimmerData.date)),
          ),
          ShimmerCard(
            child: Text(_shimmerData.title),
          ),
          ShimmerCard(
            child: Text(_shimmerData.creator),
          ),
          ShimmerCard(
            child: Text(_shimmerData.location),
          ),
          ShimmerCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _shimmerData.tags
                  .map(
                    (tag) => Text(tag),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _onShareIconPressed(BuildContext context) {
    showDialog(
      context: context,
      child: SimpleDialog(
        backgroundColor: Colors.transparent,
        children: <Widget>[
          Screenshot(
            controller: _controller,
            child: ShimmerCardSummary(
              _shimmerData,
              elevation: 0,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.white,
            ),
            onPressed: () => _onSendIconPressed(context),
          ),
        ],
      ),
    );
  }

  void _onSendIconPressed(BuildContext context) async {
    final image = await _controller.capture(
      pixelRatio: MediaQuery.of(context).devicePixelRatio,
    );
    Share.image(image);
  }
}