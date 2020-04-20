import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shimmer/hive/data_box.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/hive/shimmer_data_list.dart';

class ShimmerCardCreator extends StatelessWidget {
  ShimmerCardCreator(this._category);

  final ShimmerCategory _category;

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

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
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _controller1,
                decoration: InputDecoration(
                  hintText: 'Title',
                ),
              ),
              TextFormField(
                controller: _controller2,
                decoration: InputDecoration(
                  hintText: 'Artist',
                ),
              ),
              TextFormField(
                controller: _controller3,
                decoration: InputDecoration(
                  hintText: 'Location',
                ),
              ),
              FormField(
                builder: (context) => Text(
                  _category
                      .toString()
                      .replaceAll('ShimmerCategory.', '')
                      .toUpperCase(),
                ),
              ),
              TextFormField(
                controller: _controller4,
                decoration: InputDecoration(
                  hintText: '#tag',
                ),
              ),
              FlatButton(
                child: Text('Button'),
                onPressed: () => _onPressed(context),
              ),
            ],
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
