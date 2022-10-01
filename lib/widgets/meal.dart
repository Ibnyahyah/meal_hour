import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final double id;
  final String imageUrl;
  final String name;
  final double price;
  final Color _color;
  final String _icon;
  final Function toggleCart;
  final Function isMealCarted;
  final Function toggleFavorite;
  final Function isMealFavorite;

  const MealItem(
      this.id,
      this.imageUrl,
      this.name,
      this.price,
      this._color,
      this._icon,
      this.toggleCart,
      this.isMealCarted,
      this.toggleFavorite,
      this.isMealFavorite,
      {Key? key})
      : super(key: key);

  void selectedMeal(BuildContext context) {
    Navigator.of(context).pushNamed('/meal_details', arguments: id).then(
      (result) {
        // print('result');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {selectedMeal(context)},
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5.00,
          horizontal: 7.00,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('./assets/icons/active_icon.png'),
                GestureDetector(
                  onTap: () => toggleFavorite(id),
                  child: Icon(
                    isMealFavorite(id)
                        ? Icons.star
                        : Icons.star_border_outlined,
                    size: 20,
                    color: Colors.red[400],
                  ),
                ),
                // Image.asset('./assets/icons/$_icon'),
              ],
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                name,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 360 ? 16 : 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₦$price',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.width > 360 ? 16 : 12,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: _color,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: GestureDetector(
                    onTap: () => toggleCart(id),
                    child: Icon(
                      Icons.add,
                      color:
                          isMealCarted(id) ? Colors.red.shade300 : Colors.white,
                      size: MediaQuery.of(context).size.width > 360 ? 20 : 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
