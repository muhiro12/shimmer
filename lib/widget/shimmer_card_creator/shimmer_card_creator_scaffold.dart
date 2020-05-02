import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/model/interface/shimmer_data_data_store.dart';
import 'package:shimmer/widget/shimmer_card_creator/shimmer_card_creator_expansion.dart';
import 'package:shimmer/widget/shimmer_card_creator/shimmer_card_creator_items.dart';

class ShimmerCardCreatorScaffold extends StatelessWidget {
  final ShimmerCategory _category;

  ShimmerCardCreatorScaffold(this._category);

  final _items = ShimmerCardCreatorItems();
  final _expansion = ShimmerCardCreatorExpansion();

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
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Text(
                      EnumParser.upperCamelCaseStringOf(_category),
                      style: Theme.of(context).textTheme.headline,
                    ),
                    _items,
                    _expansion,
                  ],
                ),
              ),
              Divider(
                height: 0,
              ),
              // TODO: Only for debug
              SizedBox(
                width: double.infinity,
                height: kBottomNavigationBarHeight,
                child: FlatButton(
                  child: Text(
                    'Debug',
                    style: Theme.of(context).textTheme.button.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                  ),
                  onPressed: () {
                    ShimmerDataDataStore.createDebugData(
                      _items.datePicker.key.currentState.date,
                      _category,
                      _items.starRating.key.currentState.rating,
                      _items.imagePicker.key.currentState.images,
                    );
                    Navigator.pop(context);
                  },
                ),
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
    );
  }

  void _onButtonPressed(BuildContext context) {
    if (_items.titleController.text.isEmpty) {
      return;
    }
    final shimmerData = ShimmerData();
    shimmerData.category = _category;
    shimmerData.date = _items.datePicker.key.currentState.date;
    shimmerData.title = _items.titleController.text;
    shimmerData.summary = _items.summaryController.text;
    shimmerData.detail = _items.detailController.text;
    shimmerData.star = _items.starRating.key.currentState.rating;
    shimmerData.tags = [_items.tagController.text];
    shimmerData.images = _items.imagePicker.key.currentState.images;
    shimmerData.location = _expansion.locationController.text;
    shimmerData.creator = _expansion.creatorController.text;
    shimmerData.genre = _expansion.genreController.text;
    shimmerData.theme = _expansion.themeController.text;
    shimmerData.note = _expansion.noteController.text;
    ShimmerDataDataStore.createShimmerData(shimmerData);
    Navigator.pop(context);
  }
}
