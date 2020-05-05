import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:shimmer/configuration/app_parameter.dart';
import 'package:shimmer/model/list_extension.dart';

class HorizontalListImagePicker extends StatefulWidget {
  HorizontalListImagePicker({this.height = AppParameter.componentM});

  final double height;

  final GlobalKey<_HorizontalListImagePickerState> key =
      GlobalKey<_HorizontalListImagePickerState>();

  @override
  State<StatefulWidget> createState() {
    return _HorizontalListImagePickerState();
  }
}

class _HorizontalListImagePickerState extends State<HorizontalListImagePicker> {
  final ScrollController _scrollController = ScrollController();

  List<Uint8List> images = [];
  List<Asset> assets = [];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollToLast(),
    );
    return SizedBox(
      height: widget.height,
      child: ListView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        children: images
            .map<Widget>(
              (image) => SizedBox(
                width: widget.height,
                height: widget.height,
                child: Card(
                  child: Image.memory(image),
                ),
              ),
            )
            .toList()
            .added(
              IconButton(
                icon: Icon(
                  Icons.add_photo_alternate,
                  color: Colors.grey.shade600,
                ),
                iconSize: AppParameter.componentS,
                onPressed: _onImageIconPressed,
              ),
            ),
      ),
    );
  }

  void _onImageIconPressed() async {
    try {
      assets = await MultiImagePicker.pickImages(
        maxImages: 8,
        selectedAssets: assets,
      );
    } on Exception catch (error) {
      print(error);
    }
    List<Uint8List> newImages = [];
    await Future.forEach(
      assets,
      (_asset) async {
        final byteData = await _asset.getByteData();
        newImages.add(byteData.buffer.asUint8List());
      },
    );
    setState(() {
      images = newImages;
    });
  }

  void _scrollToLast() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
