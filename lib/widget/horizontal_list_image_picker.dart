import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/configuration/app_size.dart';

class HorizontalListImagePicker extends StatefulWidget {
  final double height;

  HorizontalListImagePicker({this.height = AppSize.componentM});

  final List<Uint8List> images = [];

  @override
  State<StatefulWidget> createState() {
    return _HorizontalListImagePickerState();
  }
}

class _HorizontalListImagePickerState extends State<HorizontalListImagePicker> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollToLast(),
    );
    List<Widget> list = [];
    list.addAll(
      widget.images.map(
        (image) => SizedBox(
          width: widget.height,
          height: widget.height,
          child: Card(
            child: Image.memory(image),
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
    return SizedBox(
      height: widget.height,
      child: ListView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        children: list,
      ),
    );
  }

  void _onImageIconPressed() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        widget.images.add(image.readAsBytesSync());
      });
    }
  }

  void _scrollToLast() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
