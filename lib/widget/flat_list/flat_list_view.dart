import 'package:flutter/cupertino.dart';
import 'package:shimmer/widget/flat_list/flat_list_section.dart';

class FlatListView extends StatelessWidget {
  FlatListView({this.sections});

  final List<FlatListSection> sections;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: sections,
    );
  }
}
