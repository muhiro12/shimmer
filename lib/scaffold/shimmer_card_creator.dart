import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_size.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/model/data_store.dart';
import 'package:shimmer/model/enum_parser.dart';

class ShimmerCardCreator extends StatelessWidget {
  ShimmerCardCreator(this._category);

  final ShimmerCategory _category;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _artistController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          CloseButton(),
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(AppSize.spaceL),
          child: Form(
            child: Column(
              children: <Widget>[
                FormField(
                  builder: (context) =>
                      Text(EnumParser.upperCamelCaseStringOf(_category)),
                ),
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                TextFormField(
                  controller: _artistController,
                  decoration: InputDecoration(
                    hintText: 'Artist',
                  ),
                ),
                TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(
                    hintText: 'Location',
                  ),
                ),
                TextFormField(
                  controller: _tagController,
                  decoration: InputDecoration(
                    hintText: '#tag',
                  ),
                ),
                SizedBox(
                  height: AppSize.spaceL,
                ),
                FlatButton(
                  child: Text('Button'),
                  onPressed: () => _onButtonPressed(context),
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
    shimmerData.title = _titleController.text;
    shimmerData.creator = _artistController.text;
    shimmerData.location = _locationController.text;
    shimmerData.tags = [_tagController.text];
    DataStore.createShimmerData(shimmerData);
    Navigator.pop(context);
  }
}
