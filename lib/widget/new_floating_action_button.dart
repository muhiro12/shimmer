import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/widget/shimmer_card_creator_launcher.dart';

class NewFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _showCreatorLauncher,
      tooltip: 'New',
      child: Icon(Icons.add),
    );
  }

  void _showCreatorLauncher() {
    ShimmerCardCreatorLauncher.showAsBottomSheet();
  }
}
