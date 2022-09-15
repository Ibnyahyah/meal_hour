import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final image;
  Color color;
  final Function navigator;
  final route;
  final availableItem;

  MyIconButton(
      this.image, this.color, this.navigator, this.route, this.availableItem,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.00,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          OutlinedButton(
            onPressed: () => navigator(context, route),
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: color,
              ),
            ),
            child: Image.asset(image),
          ),
          availableItem != 0
              ? Positioned(
                  top: .4,
                  right: 0,
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '$availableItem',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              : const Text(''),
        ],
      ),
    );
  }
}
