import 'package:flutter/material.dart';

import '../widgets/home_button.dart';

class NothingHere extends StatelessWidget {
  const NothingHere({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red[400],
            ),
            alignment: Alignment.center,
            child: const Text(
              'Oopps!!!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 250,
            margin: const EdgeInsets.only(
              top: 10,
            ),
            child: const Text(
              'This Place is Empty, kindly add a meal.',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const HomeButton(),
        ],
      ),
    );
  }
}
