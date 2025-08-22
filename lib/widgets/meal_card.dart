import 'package:flutter/material.dart';
import 'package:restau/models/meal.dart';

class MealCard extends StatefulWidget {
  final Meal meal;
  const MealCard({Key? key, required this.meal}) : super(key: key);

  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  bool isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(widget.meal.imageUrl),
          Text(widget.meal.nom),
          Text("${widget.meal.prix} £"),
          Text(widget.meal.description),
          IconButton(
            onPressed: _toggleFavorite,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.pink : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
