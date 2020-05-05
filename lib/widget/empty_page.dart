import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_parameter.dart';
import 'package:shimmer/widget/shimmer_card_creator_launcher.dart';

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Let\'s create\nnew Shimmer Card!!',
            style: Theme.of(context).textTheme.title.copyWith(
                  color: Colors.grey,
                ),
          ),
          IconButton(
            icon: Icon(
              Icons.create,
              color: Theme.of(context).primaryColor,
            ),
            iconSize: AppParameter.componentS,
            onPressed: () => _showCreatorLauncher(context),
          ),
        ],
      ),
    );
  }

  void _showCreatorLauncher(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: ShimmerCardCreatorLauncher(),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppParameter.radius),
        ),
      ),
    );
  }
}
