import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/model/enum_parser.dart';

class CategoryRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: SafeArea(
        child: ListView(
          children: ShimmerCategory.values.map(
            (category) {
              final text = EnumParser.upperCamelCaseStringOf(category);
              return ListTile(
                title: Text(text),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text(text),
                      ),
                      body: SafeArea(
                        child: Center(
                          child: Text('Contents'),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
