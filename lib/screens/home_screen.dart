import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../widgets/_icon_button.dart';
import '../widgets/meal.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset('./assets/icons/hambuger_icon.png'),
          elevation: 0,
          backgroundColor: Colors.grey[100],
          actions: [
            FlatButton(
              onPressed: () {},
              child: Image.asset('./assets/icons/search_icon.png'),
            ),
          ],
        ),
        // drawer: const MenuDrawer(),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20.00),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Work Place',
                  style: TextStyle(
                    fontSize: 24.00,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.65),
                  ),
                ),
                const Text(
                  'Choose your delicious meal',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.65),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.00),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyIconButton(
                        './assets/icons/home_icon.png',
                        Colors.green.shade400,
                      ),
                      MyIconButton(
                        './assets/icons/_favorite_icon.png',
                        Colors.grey.shade400,
                      ),
                      MyIconButton(
                        './assets/icons/filter_icon.png',
                        Colors.grey.shade400,
                      ),
                      MyIconButton(
                        './assets/icons/cart_icon.png',
                        Colors.grey.shade400,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Meal(
                            './assets/images/247chops.png',
                            '247chops',
                            '30.00',
                            Theme.of(context).primaryColor,
                            'red_heart.png',
                          ),
                          Meal(
                            './assets/images/rice.png',
                            'Rice',
                            '10.00',
                            Colors.grey.shade400,
                            '_favorite_icon.png',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Meal(
                            './assets/images/shawama.png',
                            'Shawama',
                            '15.00',
                            Colors.grey.shade400,
                            '_favorite_icon.png',
                          ),
                          Meal(
                            './assets/images/chicken.png',
                            'Chicken',
                            '40.00',
                            Colors.grey.shade400,
                            'red_heart.png',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          '2 Items',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '\$ 70.00',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.grey[100],
      ),
    );
  }
}
