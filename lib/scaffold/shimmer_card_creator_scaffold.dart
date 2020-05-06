import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/main.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/model/shimmer_logs_repository.dart';
import 'package:shimmer/widget/shimmer_card_creator_expansion.dart';
import 'package:shimmer/widget/shimmer_card_creator_items.dart';

class ShimmerCardCreatorScaffold extends StatelessWidget {
  ShimmerCardCreatorScaffold(this._log);

  final ShimmerLog _log;

  final _items = ShimmerCardCreatorItems();
  final _expansion = ShimmerCardCreatorExpansion();

  @override
  Widget build(BuildContext context) {
    _insertLog();
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
                      EnumParser.upperCamelCaseStringOf(_log.category),
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
                      _log.category,
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
    final log = _pickUpLog();
    ShimmerLogsRepository.instance.createLog(log);
    Navigator.pop(context);
  }

  void _insertLog() {
    // TODO: Uncomment
//    category: _log.category,
//    _items.datePicker.key.currentState.date = _log.date;
    _items.titleController.text = _log.title;
    _items.summaryController.text = _log.summary;
    _items.detailController.text = _log.detail;
//    _items.starRating.key.currentState.rating = _log.star;
    // TODO: to List
    _items.tagController.text = _log.tags.toString();
//    _items.imagePicker.key.currentState.images = _log.images;
    _expansion.locationController.text = _log.location;
    _expansion.creatorController.text = _log.creator;
    _expansion.genreController.text = _log.genre;
    _expansion.themeController.text = _log.theme;
    _expansion.noteController.text = _log.note;
  }

  ShimmerLog _pickUpLog() {
    return ShimmerLog(
      category: _log.category,
      date: _items.datePicker.key.currentState.date,
      title: _items.titleController.text,
      summary: _items.summaryController.text,
      detail: _items.detailController.text,
      star: _items.starRating.key.currentState.rating,
      tags: [_items.tagController.text],
      images: _items.imagePicker.key.currentState.images,
      location: _expansion.locationController.text,
      creator: _expansion.creatorController.text,
      genre: _expansion.genreController.text,
      theme: _expansion.themeController.text,
      note: _expansion.noteController.text,
    );
  }

  static void showAsModal(
    ShimmerLog log, {
    Function completion,
  }) {
    showCupertinoModalPopup(
      context: MyHomePage.context,
      builder: (context) => ShimmerCardCreatorScaffold(log),
    ).whenComplete(
      () {
        if (completion != null) {
          completion();
        }
      },
    );
  }
}
