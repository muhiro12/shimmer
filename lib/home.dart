import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/hive/keys.dart';
import 'package:shimmer/shimmer_card.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(HiveKeys.dataBox).listenable(),
      builder: (context, box, widget) {
        final List<String> card = box.get(HiveKeys.card);
        return ListView(
          children: card
              .map(
                (card) => ShimmerCard(card),
              )
              .toList(),
        );
      },
    );
  }
}
