import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import './dummy_data.dart';
import './models/meal.dart';

import './screens/splash_screen.dart';
import './screens/home_screen.dart';
import './screens/meal_details_screen.dart';
import '../screens/carts_screen.dart';
import '../screens/checkout_screen.dart';
import '../screens/userDetails_screen.dart';
import './screens/response_screen.dart';
import './screens/favoriteMeal_screen.dart';
import './screens/order_history.dart';
import './screens/about_screen.dart';
import './screens/search_screen.dart';
import '../screens/404_screen.dart';
import './test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double cartedAmount = 0;
  double cartedQauntity = 1;
  final List<Meal> _cartedMeals = [];
  final List<Meal> _favoriteMeals = [];

  late String id;
  late String title;
  late String qauntity;
  late String price;
  late String imageUrl;

  bool isLoading = false;
  bool isSucessful = false;
  // void _increamentButton() {
  //   setState(() {
  //     cartedQauntity += 1;
  //   });
  // }

  void _decreamentButton() {
    if (cartedQauntity > 1) {
      setState(() {
        cartedQauntity -= 1;
      });
    }
  }

  void _increamentButton(id) {
    setState(() {
      cartedQauntity += 1;
      meals_data.map(
        (meal) => {
          // if (meal.id == id) {print(meal.qauntity += 1)} else {print("id")}
        },
      );
      // print(cartedQauntity);
    });
  }

  double cartedMealPriceCalculator(index) {
    double loppedPrice = 0;
    for (index = 0; index < _cartedMeals.length; index++) {
      loppedPrice += _cartedMeals[index].price;
    }
    return cartedAmount = loppedPrice;
  }

  void _toggleCart(double mealId) {
    final existingIndex = _cartedMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        cartedAmount -= _cartedMeals[existingIndex].price;
        _cartedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _cartedMeals.add(meals_data.firstWhere((meal) => meal.id == mealId));
      });
    }
    cartedMealPriceCalculator(existingIndex);
  }

  bool _isMealCarted(id) {
    return _cartedMeals.any((meal) => meal.id == id);
  }

  void _toggleFavorite(double mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(meals_data.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  gettingCheckOutMeal() {
    return _cartedMeals.map((meal) => {
          id = '${meal.id}',
          title = meal.title,
          qauntity = '${meal.qauntity}',
          price = '${meal.price}',
          imageUrl = meal.imageUrl,
        });
  }

  Future<void> submitCheckOutHistory(email) async {
    var url = Uri.https('wedo-diary-default-rtdb.firebaseio.com',
        '/ordered-history/$email.json', {'q': '{http}'});
    var response = await http.post(
      url,
      body: json.encode(
        <String, String>{
          'id': id,
          'title': title,
          'qauntity': qauntity,
          'price': price,
          'imageUrl': imageUrl,
        },
      ),
    );
    if (response.statusCode == 200) {
      print('Response Okay id = $id .');
      setState(() {
        isLoading = false;
        isSucessful = true;
      });
    } else {
      print('Something went wrong ${response.statusCode}');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> submitHandler(
      userState,
      String customerAddress,
      String customerName,
      String customerPhone,
      String customerEmail,
      List orderItems,
      String orderStatus,
      String orderTotal) async {
    final orderSchema = {
      customerAddress,
      customerName,
      customerPhone,
      customerEmail,
      orderStatus,
      orderTotal,
      orderItems,
    };

    print(userState);
    // setState(() {
    //   isLoading = true;
    // });
    // var url = Uri.https('wedo-diary-default-rtdb.firebaseio.com', '/chops.json',
    //     {'q': '{http}'});
    // var response = await http.post(
    //   url,
    //   body: orderSchema,
    // );
    // if (response.statusCode == 200) {
    //   // var name = convert.jsonDecode(response.body) as Map<String, dynamic>;
    //   print('Response OK: ${response.body}');
    //   // await submitCheckOutHistory(customerEmail);
    // } else {
    //   print('Something went wrong: ${response.statusCode}');
    //   setState(() {
    //     isLoading = false;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Hour',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        SplashScreen.routeName: (ctx) => const SplashScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(
              _cartedMeals,
              _toggleCart,
              _isMealCarted,
              cartedAmount,
              _toggleFavorite,
              _isMealFavorite,
              _favoriteMeals,
            ),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(
            _toggleCart, _isMealCarted, _toggleFavorite, _isMealFavorite),
        CartsScreen.routeName: (ctx) => CartsScreen(
              _cartedMeals,
              _increamentButton,
              _decreamentButton,
            ),
        CheckOutScreen.routeName: (ctx) => CheckOutScreen(
            _cartedMeals, _toggleCart, cartedAmount, cartedQauntity),
        UserDetailsScreen.routeName: (ctx) =>
            UserDetailsScreen(cartedAmount, isLoading),
        ResponseScreen.routeName: (ctx) => const ResponseScreen(),
        FavoriteMealScreen.routeName: (ctx) => FavoriteMealScreen(
              _toggleFavorite,
              _isMealFavorite,
              _favoriteMeals,
            ),
        OrderHistory.routeName: (ctx) => OrderHistory(),
        AboutScreen.routeName: (ctx) => const AboutScreen(),
        SearchScreen.routeName: (ctx) => const SearchScreen(),
        MyPost.routeName: (ctx) => MyPost(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => const NotFoundScreen(),
        );
      },
    );
  }
}
