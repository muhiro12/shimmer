import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/router/router.dart';
import 'package:shimmer/scaffold/shimmer_card_detail_scaffold.dart';

class ShimmerCardDetailScaffoldRouter extends Router {
  final BuildContext context;
  final ShimmerLog log;

  ShimmerCardDetailScaffoldRouter({
    this.context,
    this.log,
  });

  @override
  ShimmerCardDetailScaffold injected() {
    return ShimmerCardDetailScaffold(
      log,
    );
  }

  void push() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => injected(),
      ),
    );
  }
}
