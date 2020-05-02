import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_parameter.dart';
import 'package:shimmer/widget/common/date_picker.dart';
import 'package:shimmer/widget/common/horizontal_list_image_picker.dart';
import 'package:shimmer/widget/common/star_rating.dart';

class ShimmerCardCreatorItems extends StatelessWidget {
  final DatePicker datePicker = DatePicker();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  final StarRating starRating = StarRating();
  final TextEditingController tagController = TextEditingController();
  final HorizontalListImagePicker imagePicker = HorizontalListImagePicker(
    height: AppParameter.componentL,
  );

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
}
