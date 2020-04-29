import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/model/data_store.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/widget/shimmer_card_creator_main_item.dart';
import 'package:shimmer/widget/shimmer_card_creator_sub_item.dart';

class ShimmerCardCreator extends StatelessWidget {
  final ShimmerCategory _category;

  ShimmerCardCreator(this._category);

  final _main = ShimmerCardCreatorMainItem();
  final _sub = ShimmerCardCreatorSubItem();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('New Card'),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            CloseButton(),
          ],
        ),
        body: SafeArea(
          child: Form(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Text(
                        EnumParser.upperCamelCaseStringOf(_category),
                        style: Theme.of(context).textTheme.headline,
                      ),
                      _main,
                      _sub,
                    ],
                  ),
                ),
                Divider(
                  height: 0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: kBottomNavigationBarHeight,
                  child: FlatButton(
                    child: Text(
                      'Create',
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => _onButtonPressed(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onButtonPressed(BuildContext context) {
    final shimmerData = ShimmerData();
    shimmerData.category = _category;
//    shimmerData.date = DateTime.now();
    shimmerData.title = _main.titleController.text;
    shimmerData.summary = _main.summaryController.text;
    shimmerData.detail = _main.detailController.text;
//    shimmerData.star = 6;
    shimmerData.tags = [_main.tagController.text];
    shimmerData.images = _main.imagePicker.images;
    shimmerData.location = _sub.locationController.text;
    shimmerData.creator = _sub.creatorController.text;
    shimmerData.genre = _sub.genreController.text;
    shimmerData.theme = _sub.themeController.text;
    shimmerData.note = _sub.noteController.text;
    DataStore.createShimmerData(shimmerData);
    Navigator.pop(context);
  }
}
