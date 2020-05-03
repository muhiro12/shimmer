import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/router/router.dart';
import 'package:shimmer/scaffold/shimmer_card_detail_scaffold.dart';

class ShimmerCardDetailScaffoldRouter extends Router {
  final BuildContext _context;
  final ShimmerLog _log;

  ShimmerCardDetailScaffoldRouter(this._context, this._log);

  @override
  ShimmerCardDetailScaffold injected() {
    return ShimmerCardDetailScaffold(
      _log,
    );
  }

  void push() {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (_) => injected(),
      ),
    );
  }
}
