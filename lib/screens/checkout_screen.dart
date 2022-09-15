import 'package:flutter/material.dart';
import 'package:meal_hour/widgets/total_amount.dart';

import '../models/meal.dart';

import '../widgets/checkoutItem.dart';
import '../widgets/nothing_here.dart';

class CheckOutScreen extends StatelessWidget {
  static const routeName = './checkout_screen';

  final List<Meal> cartedMeals;
  final Function toggleCart;
  final double cartedAmount;
  final num cartedQauntity;

  const CheckOutScreen(
      this.cartedMeals, this.toggleCart, this.cartedAmount, this.cartedQauntity,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deliveryFee = (cartedAmount / 4).ceil();
    var vatAmount = (cartedAmount / 9).ceil();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Check Out'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10.00),
            alignment: Alignment.centerRight,
            child: Text(
              cartedMeals.isEmpty ? 'Meal(0)' : 'Meals(${cartedMeals.length})',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      body: cartedMeals.isEmpty
          ? const NothingHere()
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10.00),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .58,
                      child: ListView(
                        children: [
                          ...cartedMeals
                              .map(
                                (data) => CheckOutItem(
                                  data.id,
                                  data.title,
                                  data.imageUrl,
                                  data.price,
                                  toggleCart,
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                    TotalAmount(
                        deliveryFee: deliveryFee,
                        vatAmount: vatAmount,
                        cartedAmount: cartedAmount),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed('./userdetails_screen');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total: ₦${cartedAmount + vatAmount + deliveryFee}k',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('./userdetails_screen');
                              },
                              child: const Text(
                                'Proceed',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      backgroundColor: Colors.grey[200],
    );
  }
}
