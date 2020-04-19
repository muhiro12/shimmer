import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shimmer/hive/genre.dart';
import 'package:shimmer/hive/keys.dart';
import 'package:shimmer/hive/shimmer_data.dart';

class ShimmerCardCreate extends StatelessWidget {
  ShimmerCardCreate(this._genre);

  final Genre _genre;

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
      ),
      body: SafeArea(
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _controller1,
                decoration: InputDecoration(
                  hintText: 'Title',
                ),
              ),
              TextFormField(
                controller: _controller2,
                decoration: InputDecoration(
                  hintText: 'Artist',
                ),
              ),
              TextFormField(
                controller: _controller3,
                decoration: InputDecoration(
                  hintText: 'Location',
                ),
              ),
              FormField(
                builder: (context) =>
                    Text(_genre.toString().replaceAll('Genre.', '')),
              ),
              TextFormField(
                controller: _controller4,
                decoration: InputDecoration(
                  hintText: '#tag',
                ),
              ),
              FlatButton(
                child: Text('Button'),
                onPressed: () => _onPressed(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed(BuildContext context) {
    final box = Hive.box(HiveKeys.dataBox);
    List card = box.get(
      HiveKeys.shimmerData,
      defaultValue: List<ShimmerData>(),
    );
    card.insert(
      0,
      ShimmerData(
        DateTime.now(),
        _controller1.text,
        _controller2.text,
        _controller3.text,
        Genre.concert,
        _controller4.text.split(' '),
      ),
    );
    box.put(HiveKeys.shimmerData, card);
    Navigator.pop(context);
  }
}
