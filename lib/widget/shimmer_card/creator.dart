import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shimmer/configuration/size.dart';
import 'package:shimmer/hive/data_box.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/hive/shimmer_data_list.dart';
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
                  onPressed: () => _onPressed(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPressed(BuildContext context) {
    final box = Hive.box(DataBox.key.toString());
    ShimmerDataList dataList = box.get(
      DataBox.dataList.toString(),
      defaultValue: ShimmerDataList(),
    );
    dataList.create(ShimmerData());
    box.put(DataBox.dataList.toString(), dataList);
    Navigator.pop(context);
  }
}
