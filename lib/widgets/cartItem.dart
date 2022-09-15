import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final Function increasement;
  final Function decreasement;
  final double id;
  final num qty;

  const CartItem(this.imageUrl, this.title, this.price, this.increasement,
      this.decreasement, this.id, this.qty,
      {Key? key})
      : super(key: key);

  void selectedMeal(BuildContext context) {
    Navigator.of(context).pushNamed('./meal_details', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectedMeal(context);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 5.00),
        padding: const EdgeInsets.all(10.00),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.00),
          color: Colors.grey[300],
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 5.00),
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
                        margin: const EdgeInsets.only(left: 10.00),
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
                            Text('₦${price * qty}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10.00),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => decreasement(),
                          icon: const Icon(Icons.remove),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(2.00),
                            ),
                          ),
                          child: Text(
                            '${qty.floor()}',
                          ),
                        ),
                        IconButton(
                          onPressed: () => increasement(id),
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
