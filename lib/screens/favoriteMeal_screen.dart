import 'package:flutter/material.dart';
import '../models/meal.dart';

import '../widgets/favoriteMeal.dart';
import '../widgets/nothing_here.dart';

class FavoriteMealScreen extends StatelessWidget {
  static const routeName = './favorites__screen';

  final Function toggleFavorite;
  final Function isMealFavorite;
  final List<Meal> favoriteMeals;
  const FavoriteMealScreen(
      this.toggleFavorite, this.isMealFavorite, this.favoriteMeals,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Your Favorites'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5.00),
            child: Row(
              children: [
                Text(
                  '(${favoriteMeals.length})',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Icon(Icons.star, size: 10.00),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: MediaQuery.of(context).size.height * .84,
          child: favoriteMeals.isEmpty
              ? const NothingHere()
              : Column(
                  children: [
                    ...favoriteMeals
                        .map(
                          (data) => FavoriteMeal(
                            toggleFavorite: toggleFavorite,
                            data: data,
                          ),
                        )
                        .toList(),
                  ],
                ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
