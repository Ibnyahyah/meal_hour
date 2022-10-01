import 'package:flutter/material.dart';

import '../widgets/meals.dart';
import '../widgets/drawer.dart';
import '../widgets/_icon_button.dart';
import '../models/meal.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  final List<Meal> cartedMeals;
  final Function toggleCart;
  final Function isMealCarted;
  final double cartedAmount;
  final Function toggleFavorite;
  final Function isMealFavorite;
  final List<Meal> favoriteMeals;

  const HomeScreen(
      this.cartedMeals,
      this.toggleCart,
      this.isMealCarted,
      this.cartedAmount,
      this.toggleFavorite,
      this.isMealFavorite,
      this.favoriteMeals,
      {Key? key})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _navigator(context, route) {
    Navigator.of(context).pushNamed(route);
  }

  // getting the state of scaffoldKey. its can be use to switch drawer()
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width > 800
        ? MediaQuery.of(context).size.width * .4
        : MediaQuery.of(context).size.width < 560
            ? MediaQuery.of(context).size.width * .98
            : MediaQuery.of(context).size.width < 768
                ? MediaQuery.of(context).size.width * .6
                : double.infinity;
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: width,
            height: MediaQuery.of(context).size.height,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.grey[200],
                iconTheme: const IconThemeData(
                  color: Colors.black,
                  size: 30.00,
                ),
                // leading: GestureDetector(
                //   child: Image.asset('./assets/icons/hambuger_icon.png'),
                //   onTap: () {
                //     if (scaffoldKey.currentState!.isDrawerOpen) {
                //       scaffoldKey.currentState!.closeDrawer();
                //     } else {
                //       scaffoldKey.currentState!.openDrawer();
                //     }
                //   },
                // ),

                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/search__screen');
                    },
                    child: Image.asset('./assets/icons/search_icon.png'),
                  ),
                ],
              ),
              drawer: const MenuDrawer(),
              body: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    // margin: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '247Chops',
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
                                _navigator,
                                '/home_screen',
                                0,
                              ),
                              MyIconButton(
                                './assets/icons/_favorite_icon.png',
                                Colors.grey.shade400,
                                _navigator,
                                '/favorites__screen',
                                widget.favoriteMeals.length,
                              ),
                              MyIconButton(
                                './assets/icons/filter_icon.png',
                                Colors.grey.shade400,
                                _navigator,
                                '/filter',
                                0,
                              ),
                              MyIconButton(
                                './assets/icons/cart_icon.png',
                                Colors.grey.shade400,
                                _navigator,
                                '/carts_screen',
                                widget.cartedMeals.length,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(top: 20.00, bottom: 50.0),
                          height: MediaQuery.of(context).size.height > 800
                              ? MediaQuery.of(context).size.height * 0.72
                              : MediaQuery.of(context).size.height * 0.59,
                          child: MyMeals(
                            widget.toggleCart,
                            widget.isMealCarted,
                            widget.toggleFavorite,
                            widget.isMealFavorite,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 5.0,
                    left: 5.0,
                    right: 5.0,
                    child: Container(
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
                        onPressed: () {
                          Navigator.of(context).pushNamed('/checkout_screen');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.cartedMeals.length} Items',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '₦ ${widget.cartedAmount}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.grey[200],
            ),
          ),
        ),
      ),
    );
  }
}
