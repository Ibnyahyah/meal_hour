import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final image;
  Color color;

  MyIconButton(this.image, this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.00,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: color,
          ),
        ),
        child: Image.asset(image),
      ),
    );
  }
}
