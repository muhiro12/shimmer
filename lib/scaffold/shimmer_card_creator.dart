import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/configuration/app_size.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/model/data_store.dart';
import 'package:shimmer/model/enum_parser.dart';

class ShimmerCardCreator extends StatefulWidget {
  final ShimmerCategory _category;

  ShimmerCardCreator(this._category);

  @override
  State<StatefulWidget> createState() {
    return _ShimmerCardCreatorState();
  }
}

class _ShimmerCardCreatorState extends State<ShimmerCardCreator> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _artistController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<File> _images = [];
  final TextEditingController _tagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollToLast(),
    );
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
            child: ListView(
              children: <Widget>[
                FormField(
                  builder: (context) =>
                      Text(EnumParser.upperCamelCaseStringOf(widget._category)),
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
                FormField(
                  builder: (_) => SizedBox(
                    height: AppSize.componentL,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        List<Widget> list = [];
                        list.addAll(
                          _images.map(
                            (image) => SizedBox(
                              width: AppSize.componentL,
                              height: AppSize.componentL,
                              child: Card(
                                child: Image.file(image),
                              ),
                            ),
                          ),
                        );
                        list.add(
                          IconButton(
                            icon: Icon(
                              Icons.add_photo_alternate,
                            ),
                            iconSize: AppSize.componentS,
                            onPressed: _onImageIconPressed,
                          ),
                        );
                        return ListView(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          children: list,
                        );
                      },
                    ),
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

  void _onImageIconPressed() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _images.add(image);
      });
    }
  }

  void _onButtonPressed(BuildContext context) {
    final shimmerData = ShimmerData();
    shimmerData.category = widget._category;
    shimmerData.title = _titleController.text;
    shimmerData.creator = _artistController.text;
    shimmerData.location = _locationController.text;
    shimmerData.tags = [_tagController.text];
    DataStore.createShimmerData(shimmerData);
    Navigator.pop(context);
  }

  void _scrollToLast() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
