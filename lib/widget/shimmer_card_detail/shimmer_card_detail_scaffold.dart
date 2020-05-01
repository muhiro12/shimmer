import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shimmer/configuration/app_parameter.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/model/share.dart';
import 'package:shimmer/widget/common/shimemr_card.dart';
import 'package:shimmer/widget/common/shimmer_card_column.dart';
import 'package:shimmer/widget/common/shimmer_card_summary.dart';
import 'package:shimmer/widget/common/star_rating.dart';

class ShimmerCardDetailScaffold extends StatelessWidget {
  final ShimmerData _shimmerData;

  ShimmerCardDetailScaffold(this._shimmerData);

  final ScreenshotController _controller = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    List<ShimmerCard> children = [
      ShimmerCardSummary(_shimmerData),
      ShimmerCard(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Text(_shimmerData.summary),
            ],
          ),
          Image.network(
            'https://www.pakutaso.com/shared/img/thumb/cafe201261763_TP_V.jpg',
          ),
        ],
      ),
      ShimmerCard(
        children: <Widget>[
          Image.network(
            'https://www.pakutaso.com/shared/img/thumb/cafe201261763_TP_V.jpg',
          ),
          ShimmerCardColumn(
            children: <Widget>[
              StarRating(
                initialRating: _shimmerData.star,
                touchEnabled: false,
              ),
              Text(_shimmerData.tags.toString()),
            ],
          ),
        ],
      ),
      ShimmerCard(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Text(_shimmerData.detail),
            ],
          ),
        ],
      )
    ];
    List<Widget> subItems = [
      ShimmerCardColumn(
        children: <Widget>[
          Text(_shimmerData.genre),
          Text(_shimmerData.theme),
        ],
      ),
    ];
    subItems.addAll(
      _shimmerData.images.map(
        (image) => Image.memory(image),
      ),
    );
    for (int index = 0; index < subItems.length / 2; index++) {
      var subItem = [subItems[index * 2]];
      if (subItems.length > index * 2 + 1) {
        subItem.add(subItems[index * 2 + 1]);
      }
      children.add(
        ShimmerCard(
          children: subItem,
        ),
      );
    }
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
        children: children,
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
