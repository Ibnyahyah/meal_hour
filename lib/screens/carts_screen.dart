import 'package:flutter/material.dart';
import '../models/meal.dart';

import '../widgets/cartItem.dart';
import '../widgets/nothing_here.dart';

class CartsScreen extends StatelessWidget {
  static const routeName = '/carts_screen';

  final List<Meal> cartItems;
  final Function increment;
  final Function decrement;

  const CartsScreen(this.cartItems, this.increment, this.decrement, {Key? key})
      : super(key: key);

  void getEach() {
    var text = '';
    for (int i = 0; i < cartItems.length; i++) {
      text += cartItems[i].imageUrl;
    }
    print(text);
  }

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
            title: Text('Cart (${cartItems.length})'),
          ),
          body: Container(
            padding: const EdgeInsets.all(10.00),
            height: MediaQuery.of(context).size.height * .82,
            child: cartItems.isEmpty
                ? const NothingHere()
                : ListView(
                    children: [
                      ...cartItems
                          .map(
                            (data) => CartItem(
                              data.imageUrl,
                              data.title,
                              data.price,
                              increment,
                              decrement,
                              data.id,
                              data.qauntity,
                            ),
                          )
                          .toList(),
                    ],
                  ),
          ),
          floatingActionButton: cartItems.isNotEmpty
              ? FloatingActionButton(
                  onPressed: getEach,
                  tooltip: 'Buy All',
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Text('Buy'),
                )
              : null,
          backgroundColor: Colors.grey[200],
        ),
      ),
    );
  }
}
