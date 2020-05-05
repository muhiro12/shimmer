import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/main.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/model/shimmer_logs_repository.dart';
import 'package:shimmer/widget/shimmer_card_creator_expansion.dart';
import 'package:shimmer/widget/shimmer_card_creator_items.dart';

class ShimmerCardCreatorScaffold extends StatelessWidget {
  ShimmerCardCreatorScaffold(this._category);

  final ShimmerCategory _category;

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
                    ShimmerLogsRepository.instance.createDebugData(
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
    final log = ShimmerLog();
    log.category = _category;
    log.date = _items.datePicker.key.currentState.date;
    log.title = _items.titleController.text;
    log.summary = _items.summaryController.text;
    log.detail = _items.detailController.text;
    log.star = _items.starRating.key.currentState.rating;
    log.tags = [_items.tagController.text];
    log.images = _items.imagePicker.key.currentState.images;
    log.location = _expansion.locationController.text;
    log.creator = _expansion.creatorController.text;
    log.genre = _expansion.genreController.text;
    log.theme = _expansion.themeController.text;
    log.note = _expansion.noteController.text;
    ShimmerLogsRepository.instance.createLog(log);
    Navigator.pop(context);
  }

  static void showAsModal(
    ShimmerCategory category, {
    Function completion,
  }) {
    showCupertinoModalPopup(
      context: MyHomePage.context,
      builder: (context) => ShimmerCardCreatorScaffold(category),
    ).whenComplete(
      () {
        if (completion != null) {
          completion();
        }
      },
    );
  }
}
