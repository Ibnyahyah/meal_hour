import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:flutter_paystack_client/flutter_paystack_client.dart';

import 'package:meal_hour/test.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import './dummy_data.dart';
import './models/meal.dart';
import './models/user_order_checkout.dart';

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

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await PaystackClient.initialize(
  //     'pk_test_65b833b39eb2a25a6a0e3a818b71ef147d760f4e');

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> _mail;
  late BuildContext mContext;

  String _email = '';

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
  bool isSuccessful = false;

  @override
  void initState() {
    getMail();
    super.initState();
  }

  Future<void> getMail() async {
    final SharedPreferences prefs = await _prefs;
    final String userEmail = (prefs.getString('userEmail') ?? '');
    setState(() {
      _email = userEmail;
    });
  }

  void _decrementButton(id) {
    setState(() {
      meals_data.map((meal) {
        if (meal.id == id && meal.qauntity > 1) {
          meal.qauntity -= 1;
        } else {
          return meal;
        }
      }).toList();
    });
  }

  void _incrementButton(id) {
    setState(() {
      meals_data.map((meal) {
        if (meal.id == id) {
          meal.qauntity += 1;
        } else {
          return meal;
        }
      }).toList();
    });
  }

  double cartedMealPriceCalculator(index) {
    double loppedPrice = 0;
    for (index = 0; index < _cartedMeals.length; index++) {
      loppedPrice += _cartedMeals[index].price * _cartedMeals[index].qauntity;
    }
    return cartedAmount = loppedPrice;
  }

  void _toggleCart(double mealId) {
    final existingIndex = _cartedMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        cartedAmount -= _cartedMeals[existingIndex].price;
        _cartedMeals[existingIndex].qauntity = 1;
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
    return _cartedMeals.forEach((meal) => {
          id = '${meal.id}',
          title = meal.title,
          qauntity = '${meal.qauntity}',
          price = '${meal.price}',
          imageUrl = meal.imageUrl,
        });
  }

  void _showToast(String message, context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'CLOSE',
          onPressed: scaffold.hideCurrentSnackBar,
        ),
      ),
    );
  }

  Future<void> submitHandler(
    String customerAddress,
    String customerName,
    String customerPhone,
    String customerEmail,
    List orderItems,
    String orderStatus,
    num orderTotal,
    ctx,
  ) async {
    await gettingCheckOutMeal();
    if (customerAddress.isEmpty ||
        customerEmail.isEmpty ||
        customerPhone.isEmpty ||
        customerName.isEmpty ||
        orderItems.length < 1) return;
    var data = Order(
      customerName: customerName,
      customerEmail: customerEmail,
      customerPhone: customerPhone,
      customerAddress: customerAddress,
      orderItems: [
        OrderItem(
          id: id,
          title: title,
          qauntity: qauntity,
          price: price,
          imageUrl: imageUrl,
        )
      ],
      orderStatus: "pending",
      orderTotal: orderTotal,
    );
    setState(() {
      isLoading = true;
    });
    var url = Uri.https('dead-rose-elk-wig.cyclic.app', '/order');
    var response = await http.post(url, body: json.encode(data), headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 201) {
      final SharedPreferences prefs = await _prefs;
      final String userEmail = prefs.getString('userEmail') ?? "";
      _showToast('Order created successfully', ctx);
      setState(() {
        _mail =
            prefs.setString('userEmail', customerEmail).then((bool success) {
          return userEmail;
        });
        _cartedMeals.clear();
      });
      getMail();
    } else {
      setState(() {
        isLoading = false;
      });
      _showToast('Something went wrong: ${response.statusCode}', ctx);
    }
    setState(() {
      isLoading = false;
    });
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
              _toggleCart,
              _isMealCarted,
              _toggleFavorite,
              _isMealFavorite,
            ),
        CartsScreen.routeName: (ctx) => CartsScreen(
              _cartedMeals,
              _incrementButton,
              _decrementButton,
            ),
        CheckOutScreen.routeName: (ctx) => CheckOutScreen(
              _cartedMeals,
              _toggleCart,
              cartedAmount,
              cartedQauntity,
            ),
        UserDetailsScreen.routeName: (ctx) => UserDetailsScreen(
              submitHandler,
              cartedAmount,
              isLoading,
              _cartedMeals,
              gettingCheckOutMeal,
            ),
        ResponseScreen.routeName: (ctx) => const ResponseScreen(),
        FavoriteMealScreen.routeName: (ctx) => FavoriteMealScreen(
              _toggleFavorite,
              _isMealFavorite,
              _favoriteMeals,
            ),
        OrderHistory.routeName: (ctx) => OrderHistory(_email),
        AboutScreen.routeName: (ctx) => const AboutScreen(),
        SearchScreen.routeName: (ctx) => const SearchScreen(),
        // '/test': (ctx) => TestScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => const NotFoundScreen(),
        );
      },
    );
  }
}
