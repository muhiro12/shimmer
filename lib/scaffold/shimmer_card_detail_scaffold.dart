import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shimmer/configuration/app_parameter.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/interface/share.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/model/list_extension.dart';
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
        children: <Widget>[
          ShimmerCardSummary(_log),
          ShimmerCard.init(
            children: [
              ShimmerCardChild.init(
                items: [_log.summary],
                scrollable: true,
              ),
            ],
          ),
          ShimmerCard.init(
            children: [
              ShimmerCardChild.init(
                items: [
                  EnumParser.upperCamelCaseStringOf(_log.category),
                  _log.genre,
                  _log.theme,
                ],
              ),
              ShimmerCardChild.init(
                items: _log.images.safetySublist(1, 2),
              ),
            ],
          ),
          ShimmerCard.init(
            children: [
              ShimmerCardChild.init(
                items: [_log.detail],
                scrollable: true,
              ),
            ],
          ),
          ShimmerCard.init(
            children: [
              ShimmerCardChild.init(
                items: _log.images.safetySublist(2, 3),
              ),
              ShimmerCardChild.init(
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
        ]
            .addedAll(
              _log.images.safetySublist(3).map(
                    (image) => ShimmerCard.init(
                      children: [
                        ShimmerCardChild.init(
                          items: [image],
                        ),
                      ],
                    ),
                  ),
            )
            .where(
              (shimmerCard) => shimmerCard != null,
            )
            .toList(),
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
