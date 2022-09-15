import 'package:flutter/material.dart';

class OrderedItem extends StatelessWidget {
  String id;
  String imageUrl;
  String title;
  String quantity;
  String price;
  OrderedItem(this.id, this.imageUrl, this.title, this.quantity, this.price,
      {Key? key})
      : super(
          key: key,
        );

  void selectedMeal(BuildContext context) {
    Navigator.of(context).pushNamed('./meal_details', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectedMeal(context);
      },
      child: Container(
        height: 80.00,
        padding: const EdgeInsets.all(10.00),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 60.00,
                  height: 60.00,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.00),
                  ),
                  child: ClipOval(
                    child: Image.asset(imageUrl),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        price,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Qty: $quantity',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Status: Pending',
                  style: TextStyle(
                    color: Colors.red.shade400,
                    fontWeight: FontWeight.w500,
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
