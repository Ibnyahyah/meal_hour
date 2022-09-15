import 'package:flutter/material.dart';

import '../dummy_data.dart';

import '../widgets/meal.dart';

class MyMeals extends StatelessWidget {
  final Function toggleCart;
  final Function isMealCarted;
  final Function toggleFavorite;
  final Function isMealFavorite;
  const MyMeals(this.toggleCart, this.isMealCarted, this.toggleFavorite,
      this.isMealFavorite,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: .932,
      ),
      children: [
        ...meals_data
            .map(
              (data) => MealItem(
                  data.id,
                  data.imageUrl,
                  data.title,
                  data.price,
                  Colors.grey.shade400,
                  '_favorite_icon.png',
                  toggleCart,
                  isMealCarted,
                  toggleFavorite,
                  isMealFavorite),
            )
            .toList(),
      ],
    );
  }
}
