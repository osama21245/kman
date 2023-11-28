import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingDisplayWidget extends StatelessWidget {
  final double
      rating; // The rating value you want to display (e.g., 3.5, 4.0, etc.)
  final color;

  RatingDisplayWidget({required this.rating, required this.color});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: color,
      ),
      itemCount: 5,
      itemSize: 20.0,
      direction: Axis.horizontal,
    );
  }
}
