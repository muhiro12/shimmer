import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_size.dart';

class ShimmerCardCreatorSubItem extends StatelessWidget {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController creatorController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController themeController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
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
      ],
    );
  }

  Widget _item(Widget child) {
    return Container(
      margin: EdgeInsets.only(
        left: AppSize.spaceM,
        right: AppSize.spaceM,
      ),
      child: child,
    );
  }
}
