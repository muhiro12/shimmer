import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shimmer/configuration/app_parameter.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/model/interface/share.dart';
import 'package:shimmer/widget/common/shimmer_card/shimemr_card.dart';
import 'package:shimmer/widget/common/shimmer_card/shimmer_card_child.dart';
import 'package:shimmer/widget/common/shimmer_card/shimmer_card_summary.dart';
import 'package:shimmer/widget/common/sized_spacer.dart';
import 'package:shimmer/widget/common/star_rating.dart';

class ShimmerCardDetailScaffold extends StatelessWidget {
  final ShimmerData _shimmerData;

  ShimmerCardDetailScaffold(this._shimmerData);

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
        padding: EdgeInsets.all(AppParameter.spaceM),
        children: _children(),
      ),
    );
  }

  List<ShimmerCard> _children() {
    final List<ShimmerCard> children = <ShimmerCard>[
      ShimmerCardSummary(_shimmerData),
      ShimmerCard(
        children: [
          ShimmerCardChild.instance(
            [_shimmerData.summary],
          ),
        ],
      ),
      ShimmerCard(
        children: [
          ShimmerCardChild.instance(
            [
              EnumParser.upperCamelCaseStringOf(_shimmerData.category),
              _shimmerData.genre,
              _shimmerData.theme,
            ],
          ),
          ShimmerCardChild.instance(
            _shimmerData.images,
            start: 1,
            end: 2,
          ),
        ],
      ),
      ShimmerCard(
        children: [
          ShimmerCardChild.instance(
            [_shimmerData.detail],
            scrollable: true,
          ),
        ],
      ),
      ShimmerCard(
        children: [
          ShimmerCardChild.instance(
            _shimmerData.images,
            start: 2,
            end: 3,
          ),
          ShimmerCardChild(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_shimmerData.tags.toString()),
                SizedSpacer(
                  height: AppParameter.spaceS,
                ),
                StarRating(
                  initialRating: _shimmerData.star,
                  touchEnabled: false,
                ),
              ],
            ),
          ),
        ],
      ),
    ];
    if (_shimmerData.images.length > 2) {
      children.addAll(
        _shimmerData.images.sublist(3).map(
              (image) => ShimmerCard(
                children: [
                  ShimmerCardChild.instance([image])
                ],
              ),
            ),
      );
    }
    return children.where((shimmerCard) => !shimmerCard.isEmpty()).toList();
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
              elevation: AppParameter.zero,
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
