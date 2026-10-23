import 'package:flutter/material.dart';

class RatingBadge extends StatelessWidget {
  final double rating;
  final String? label;

  const RatingBadge({
    super.key,
    required this.rating,
    this.label,
  }) : assert(rating >= 0 && rating <= 5);

  Color get ratingColor {
    if (rating >= 4) {
      return Colors.green;
    } else if (rating >= 2.5) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star,
          color: ratingColor,
        ),
        const SizedBox(width: 4),
        Text(
          rating.toStringAsFixed(1),
          style: TextStyle(
            color: ratingColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (label != null) ...[
          const SizedBox(width: 6),
          Text(label!),
        ],
      ],
    );
  }
}
