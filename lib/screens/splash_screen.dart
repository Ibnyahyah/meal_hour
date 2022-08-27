import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('./assets/images/food.png'),
              const Text(
                'Food Ordering App',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30.00,
                    color: Colors.white),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 80.00,
                ),
                margin: const EdgeInsets.only(top: 50.00),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.00),
                  color: Colors.white,
                ),
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/home_screen');
                  },
                  color: Colors.white,
                  height: 50.00,
                  child: const Text(
                    'Get a Meal',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.00,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.green[400],
    );
  }
}
