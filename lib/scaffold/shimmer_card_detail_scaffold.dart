import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shimmer/configuration/app_parameter.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/interface/share.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/widget/shimemr_card.dart';
import 'package:shimmer/widget/shimmer_card_child.dart';
import 'package:shimmer/widget/shimmer_card_summary.dart';
import 'package:shimmer/widget/sized_spacer.dart';
import 'package:shimmer/widget/star_rating.dart';

class ShimmerCardDetailScaffold extends StatelessWidget {
  final ShimmerLog _log;

  ShimmerCardDetailScaffold(this._log);

  final ScreenshotController _controller = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_log.title),
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
      ShimmerCardSummary(_log),
      ShimmerCard(
        children: [
          ShimmerCardChild.instance(
            [_log.summary],
          ),
        ],
      ),
      ShimmerCard(
        children: [
          ShimmerCardChild.instance(
            [
              EnumParser.upperCamelCaseStringOf(_log.category),
              _log.genre,
              _log.theme,
            ],
          ),
          ShimmerCardChild.instance(
            _log.images,
            start: 1,
            end: 2,
          ),
        ],
      ),
      ShimmerCard(
        children: [
          ShimmerCardChild.instance(
            [_log.detail],
            scrollable: true,
          ),
        ],
      ),
      ShimmerCard(
        children: [
          ShimmerCardChild.instance(
            _log.images,
            start: 2,
            end: 3,
          ),
          ShimmerCardChild(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_log.tags.toString()),
                SizedSpacer(
                  height: AppParameter.spaceS,
                ),
                StarRating(
                  initialRating: _log.star,
                  touchEnabled: false,
                ),
              ],
            ),
          ),
        ],
      ),
    ];
    if (_log.images.length > 2) {
      children.addAll(
        _log.images.sublist(3).map(
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
              _log,
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
