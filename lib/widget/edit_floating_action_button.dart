import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/scaffold/shimmer_card_creator_scaffold.dart';

class EditFloatingActionButton extends StatelessWidget {
  EditFloatingActionButton(this._log);

  final ShimmerLog _log;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _showCreatorLauncher,
      tooltip: 'Edit',
      child: Icon(Icons.edit),
    );
  }

  void _showCreatorLauncher() {
    ShimmerCardCreatorScaffold.showAsModal(_log);
  }
}
