import 'package:flutter/material.dart';
import 'package:meal_hour/widgets/total_amount.dart';

import '../models/meal.dart';

import '../widgets/checkoutItem.dart';
import '../widgets/nothing_here.dart';

class CheckOutScreen extends StatelessWidget {
  static const routeName = '/checkout_screen';

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
            title: const Text('Check Out'),
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
                          height: MediaQuery.of(context).size.width > 768
                              ? MediaQuery.of(context).size.height * .76
                              : MediaQuery.of(context).size.height * .58,
                          child: ListView(
                            children: [
                              ...cartedMeals
                                  .map(
                                    (data) => CheckOutItem(
                                      data.id,
                                      data.title,
                                      data.imageUrl,
                                      data.price,
                                      data.qauntity,
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
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                          child: TextButton(
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/userdetails_screen');
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
                                const Text(
                                  'Proceed',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
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
        ),
      ),
    );
  }
}
