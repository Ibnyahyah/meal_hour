import 'package:flutter/material.dart';

class FavoriteMeal extends StatelessWidget {
  final dynamic data;
  const FavoriteMeal({
    Key? key,
    required this.toggleFavorite,
    required this.data,
  }) : super(key: key);

  final Function toggleFavorite;

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed('/meal_details', arguments: data.id);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {selectMeal(context)},
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 5.0),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10.00),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.only(right: 10.00),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.00),
                    color: Colors.grey[200],
                  ),
                  child: ClipOval(
                    child: Image.asset(data.imageUrl),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(
                        fontSize: 17.00,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '₦${data.price}',
                      style: const TextStyle(
                        fontSize: 14.00,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                toggleFavorite(data.id);
              },
              icon: Icon(
                Icons.star,
                color: Colors.red[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
