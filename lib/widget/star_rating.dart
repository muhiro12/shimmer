import 'package:flutter/cupertino.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class StarRating extends StatefulWidget {
  StarRating({this.initialRating = 3, this.touchEnabled = true});

  final double initialRating;
  final bool touchEnabled;

  final GlobalKey<_StarRatingState> key = GlobalKey<_StarRatingState>();

  @override
  State<StatefulWidget> createState() {
    return _StarRatingState();
  }
}

class _StarRatingState extends State<StarRating> {
  double rating;

  @override
  void initState() {
    super.initState();
    rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return SmoothStarRating(
      rating: rating,
      onRated: _onRatingChanged,
    );
  }

  void _onRatingChanged(value) {
    if (!widget.touchEnabled) {
      return;
    }
    setState(() {
      rating = value;
    });
  }
}
