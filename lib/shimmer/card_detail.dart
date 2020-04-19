import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/hive/shimmer_data.dart';

class ShimmerCardDetail extends StatelessWidget {
  final ShimmerData _data;

  ShimmerCardDetail(this._data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_data.title),
      ),
      body: Center(
        child: Text(_data.artist),
      ),
    );
  }
}
