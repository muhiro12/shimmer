import 'package:flutter/cupertino.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class StarRating extends StatefulWidget {
  final double initialRating;
  final bool touchEnabled;

  StarRating({this.initialRating = 3, this.touchEnabled = true});

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
      onRatingChanged: (value) {
        if (widget.touchEnabled) {
          setState(() {
            rating = value;
          });
        }
      },
    );
  }
}
