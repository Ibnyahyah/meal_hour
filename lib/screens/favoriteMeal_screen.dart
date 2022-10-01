import 'package:flutter/material.dart';
import '../models/meal.dart';

import '../widgets/favoriteMeal.dart';
import '../widgets/nothing_here.dart';

class FavoriteMealScreen extends StatelessWidget {
  static const routeName = '/favorites__screen';

  final Function toggleFavorite;
  final Function isMealFavorite;
  final List<Meal> favoriteMeals;
  const FavoriteMealScreen(
      this.toggleFavorite, this.isMealFavorite, this.favoriteMeals,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width > 800
        ? MediaQuery.of(context).size.width * .4
        : MediaQuery.of(context).size.width < 560
            ? MediaQuery.of(context).size.width * .99
            : MediaQuery.of(context).size.width < 768
                ? MediaQuery.of(context).size.width * .6
                : double.infinity;
    return Center(
      child: Container(
        width: width,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Your Favorites'),
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
        ),
      ),
    );
  }
}
