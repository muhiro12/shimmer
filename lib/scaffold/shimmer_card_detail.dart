import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_extend/share_extend.dart';
import 'package:shimmer/configuration/app_size.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/widget/shimmer_card.dart';
import 'package:shimmer/widget/shimmer_card_summary.dart';

class ShimmerCardDetail extends StatelessWidget {
  final ShimmerData _data;

  ShimmerCardDetail(this._data);

  @override
  Widget build(BuildContext context) {
    final controller = ScreenshotController();
    return Scaffold(
      appBar: AppBar(
        title: Text(_data.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () => showDialog(
              context: context,
              child: SimpleDialog(
                backgroundColor: Colors.transparent,
                children: <Widget>[
                  Screenshot(
                    controller: controller,
                    child: ShimmerCardSummary(
                      _data,
                      elevation: 0,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      final image = await controller.capture(
                        pixelRatio: MediaQuery.of(context).devicePixelRatio,
                      );
                      ShareExtend.share(image.path, "image");
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSize.spaceM),
        children: <Widget>[
          ShimmerCardSummary(_data),
          ShimmerCard(
            child: Text(EnumParser.upperCamelCaseStringOf(_data.category)),
          ),
          ShimmerCard(
            child: Text(_data.date.toString().substring(0, 10)),
          ),
          ShimmerCard(
            child: Text(_data.title),
          ),
          ShimmerCard(
            child: Text(_data.artist),
          ),
          ShimmerCard(
            child: Text(_data.location),
          ),
          ShimmerCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _data.tags
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
}
