import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/route.dart';
import 'package:shimmer/hive/genre.dart';

class ShimmerCardGenreSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: Genre.values
            .map(
              (genre) => ListTile(
                title: Text(genre.toString().substring(6)),
                onTap: () => _onTap(context),
              ),
            )
            .toList(),
      ),
    );
  }

  void _onTap(BuildContext context) {
    Navigator.popAndPushNamed(context, AppRoute.cardCreator);
  }
}
