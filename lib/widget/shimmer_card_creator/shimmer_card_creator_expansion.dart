import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_parameter.dart';

class ShimmerCardCreatorExpansion extends StatelessWidget {
  ShimmerCardCreatorExpansion._({
    this.locationController,
    this.creatorController,
    this.genreController,
    this.themeController,
    this.noteController,
    this.scrollController,
  });

  final TextEditingController locationController;
  final TextEditingController creatorController;
  final TextEditingController genreController;
  final TextEditingController themeController;
  final TextEditingController noteController;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ExpansionTile(
        title: Text('More'),
        children: <Widget>[
          _item(
            TextFormField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Location',
              ),
            ),
          ),
          _item(
            TextFormField(
              controller: creatorController,
              decoration: InputDecoration(
                labelText: 'Creator',
              ),
            ),
          ),
          _item(
            TextFormField(
              controller: genreController,
              decoration: InputDecoration(
                labelText: 'Genre',
              ),
            ),
          ),
          _item(
            TextFormField(
              controller: themeController,
              decoration: InputDecoration(
                labelText: 'Theme',
              ),
            ),
          ),
          _item(
            TextFormField(
              controller: noteController,
              decoration: InputDecoration(
                labelText: 'Note',
              ),
              maxLines: 5,
            ),
          ),
          SizedBox(
            height: AppParameter.spaceM,
          ),
        ],
        onExpansionChanged: onExpansionChanged,
      ),
    );
  }

  void onExpansionChanged(bool expand) async {
    if (expand) {
      await Future.delayed(Duration(milliseconds: 500));
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _item(Widget child) {
    return Container(
      margin: EdgeInsets.only(
        left: AppParameter.spaceM,
        right: AppParameter.spaceM,
      ),
      child: child,
    );
  }

  static ShimmerCardCreatorExpansion init({
    String location,
    String creator,
    String genre,
    String theme,
    String note,
    ScrollController scrollController,
  }) {
    return ShimmerCardCreatorExpansion._(
      locationController: TextEditingController(text: location),
      creatorController: TextEditingController(text: creator),
      genreController: TextEditingController(text: genre),
      themeController: TextEditingController(text: theme),
      noteController: TextEditingController(text: note),
      scrollController: scrollController,
    );
  }
}
