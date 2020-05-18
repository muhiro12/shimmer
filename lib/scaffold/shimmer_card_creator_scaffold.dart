import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_parameter.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/main.dart';
import 'package:shimmer/model/shimmer_card_creator_type.dart';
import 'package:shimmer/model/shimmer_logs_repository.dart';
import 'package:shimmer/widget/shimmer_card_creator/shimmer_card_creator_expansion.dart';
import 'package:shimmer/widget/shimmer_card_creator/shimmer_card_creator_items.dart';

class ShimmerCardCreatorScaffold extends StatelessWidget {
  ShimmerCardCreatorScaffold._(
    this._type,
    this._log,
    this._items,
    this._expansion,
  );

  final ShimmerCardCreatorType _type;
  final ShimmerLog _log;
  final ShimmerCardCreatorItems _items;
  final ShimmerCardCreatorExpansion _expansion;

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
                    Container(
                      margin: EdgeInsets.all(AppParameter.spaceM),
                      child: Text(
                        _log.category.toUpperCamelCaseString(),
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    _items,
                    _expansion,
                  ],
                ),
              ),
              Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom ==
                    AppParameter.zero,
                child: Column(
                  children: <Widget>[
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
                                color: Colors.blue,
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
                          _type.title(),
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () => _onSaveButtonPressed(context),
                      ),
                    ),
                    Visibility(
                      visible: _type == ShimmerCardCreatorType.edit,
                      child: SizedBox(
                        width: double.infinity,
                        height: kBottomNavigationBarHeight,
                        child: FlatButton(
                          child: Text(
                            'Archive',
                            style: Theme.of(context).textTheme.button.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                          ),
                          onPressed: () => _onDeleteButtonPressed(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSaveButtonPressed(BuildContext context) {
    if (_items.titleController.text.isEmpty) {
      return;
    }
    _createLog();
    Navigator.pop(context);
  }

  void _onDeleteButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      child: AlertDialog(
        title: Text('Caution'),
        content: Text('This action cannot be undone.'),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text('Delete'),
            onPressed: () {
              _archiveLog();
              Navigator.popUntil(
                context,
                (route) => route.isFirst,
              );
            },
          ),
        ],
      ),
    );
  }

  void _createLog() {
    _log
      ..category = _log.category
      ..date = _items.datePicker.key.currentState.date
      ..title = _items.titleController.text
      ..summary = _items.summaryController.text
      ..detail = _items.detailController.text
      ..star = _items.starRating.key.currentState.rating
      ..tags = [_items.tagController.text]
      ..images = _items.imagePicker.key.currentState.images
      ..location = _expansion.locationController.text
      ..creator = _expansion.creatorController.text
      ..genre = _expansion.genreController.text
      ..theme = _expansion.themeController.text
      ..note = _expansion.noteController.text;
    ShimmerLogsRepository.instance.saveLog(_log);
  }

  void _archiveLog() {
    ShimmerLogsRepository.instance.archiveLog(_log);
    _isArchived = true;
  }

  static ShimmerCardCreatorScaffold init({
    ShimmerCardCreatorType type,
    ShimmerLog log,
  }) {
    return ShimmerCardCreatorScaffold._(
      type,
      log,
      ShimmerCardCreatorItems.init(
        date: log.date,
        title: log.title,
        summary: log.summary,
        detail: log.detail,
        star: log.star,
        tags: log.tags,
        images: log.images,
      ),
      ShimmerCardCreatorExpansion.init(
        location: log.location,
        creator: log.creator,
        genre: log.genre,
        theme: log.theme,
        note: log.note,
      ),
    );
  }

  static bool _isArchived = false;

  static void showAsModal({
    ShimmerCardCreatorType type,
    ShimmerLog log,
    Function(bool isArchived) completion,
  }) {
    showCupertinoModalPopup(
      context: MyHomePage.context,
      builder: (context) => ShimmerCardCreatorScaffold.init(
        type: type,
        log: log,
      ),
    ).whenComplete(
      () {
        if (completion != null) {
          completion(_isArchived);
        }
        _isArchived = false;
      },
    );
  }
}
