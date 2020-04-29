import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_size.dart';
import 'package:shimmer/model/date_parser.dart';
import 'package:shimmer/widget/horizontal_list_image_picker.dart';

class ShimmerCardCreatorMainItem extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  final TextEditingController tagController = TextEditingController();

  final HorizontalListImagePicker imagePicker = HorizontalListImagePicker(
    height: AppSize.componentL,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: AppSize.spaceM,
        right: AppSize.spaceM,
      ),
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
                FlatButton(
                  onPressed: () {
                    final duration = Duration(days: 365 * 25);
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(
                        duration,
                      ),
                      lastDate: DateTime.now().add(
                        duration,
                      ),
                    );
                  },
                  child: Text(
                    DateParser.yearMonthDayStringOf(
                      DateTime.now(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextFormField(
            controller: titleController,
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
                Radio(
                  value: false,
                ),
                Radio(
                  value: false,
                ),
                Radio(),
                Radio(
                  value: false,
                ),
                Radio(
                  value: false,
                ),
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
    );
  }
}
