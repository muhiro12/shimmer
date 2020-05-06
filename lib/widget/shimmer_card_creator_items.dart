import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_parameter.dart';
import 'package:shimmer/widget/date_picker.dart';
import 'package:shimmer/widget/horizontal_list_image_picker.dart';
import 'package:shimmer/widget/star_rating.dart';

class ShimmerCardCreatorItems extends StatelessWidget {
  ShimmerCardCreatorItems._({
    this.datePicker,
    this.titleController,
    this.summaryController,
    this.detailController,
    this.starRating,
    this.tagController,
    this.imagePicker,
  });

  final DatePicker datePicker;
  final TextEditingController titleController;
  final TextEditingController summaryController;
  final TextEditingController detailController;
  final StarRating starRating;
  final TextEditingController tagController;
  final HorizontalListImagePicker imagePicker;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: AppParameter.spaceM,
        right: AppParameter.spaceM,
      ),
      child: Form(
        child: Column(
          children: <Widget>[
            FormField(
              builder: (_) => Row(
                children: <Widget>[
                  Text(
                    'Date',
                    style: Theme.of(context).textTheme.subhead.copyWith(
                          color: Colors.grey.shade600,
                        ),
                  ),
                  Spacer(),
                  datePicker,
                ],
              ),
            ),
            TextFormField(
              controller: titleController,
              autovalidate: true,
              validator: (value) => value.isEmpty ? 'Required' : null,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextFormField(
              controller: summaryController,
              decoration: InputDecoration(
                labelText: 'Summary',
              ),
            ),
            TextFormField(
              controller: detailController,
              decoration: InputDecoration(
                labelText: 'Detail',
              ),
              maxLines: 10,
            ),
            FormField(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Star',
                    style: Theme.of(context).textTheme.subhead.copyWith(
                          color: Colors.grey.shade600,
                        ),
                  ),
                  Spacer(),
                  starRating,
                ],
              ),
            ),
            TextFormField(
              controller: tagController,
              decoration: InputDecoration(
                labelText: '#tag',
              ),
            ),
            FormField(
              builder: (_) => imagePicker,
            ),
          ],
        ),
      ),
    );
  }

  static ShimmerCardCreatorItems init({
    DateTime date,
    String title,
    String summary,
    String detail,
    double star,
    List<String> tags,
    List<Uint8List> images,
  }) {
    return ShimmerCardCreatorItems._(
      datePicker: DatePicker(initialDate: date),
      titleController: TextEditingController(text: title),
      summaryController: TextEditingController(text: summary),
      detailController: TextEditingController(text: detail),
      starRating: StarRating(initialRating: star),
      tagController: TextEditingController(text: tags.toString()),
      imagePicker: HorizontalListImagePicker(initialImages: images),
    );
  }
}
