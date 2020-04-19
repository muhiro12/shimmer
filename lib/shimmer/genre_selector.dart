import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/hive/genre.dart';
import 'package:shimmer/shimmer/card_creator.dart';

class ShimmerCardGenreSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: Genre.values
            .map(
              (genre) => ListTile(
                title: Text(genre.toString().replaceAll('Genre.', '')),
                onTap: () => _onTap(context, genre),
              ),
            )
            .toList(),
      ),
    );
  }

  void _onTap(BuildContext context, Genre genre) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => ShimmerCardCreate(genre),
    ).whenComplete(
      () => Navigator.pop(context),
    );
  }
}
