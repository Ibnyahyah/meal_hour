import 'package:flutter/material.dart';

class CheckOutItem extends StatelessWidget {
  final double id;
  final String title;
  final String imageUrl;
  final double price;
  final Function toggleCart;
  const CheckOutItem(
      this.id, this.title, this.imageUrl, this.price, this.toggleCart,
      {Key? key})
      : super(key: key);

  void selectedMeal(BuildContext context) {
    Navigator.of(context).pushNamed('./meal_details', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {selectedMeal(context)},
      child: Container(
        height: 90.00,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 5.00),
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
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(imageUrl),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10.00, top: 5.00),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      Text('₦ ${price}K'),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 10.00),
              child: IconButton(
                onPressed: () {
                  toggleCart(id);
                },
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.red[400],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
