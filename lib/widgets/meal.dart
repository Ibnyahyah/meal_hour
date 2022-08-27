import 'package:flutter/material.dart';

class Meal extends StatelessWidget {
  final imageUrl;
  final name;
  final price;
  Color _color;
  final _icon;

  Meal(this.imageUrl, this.name, this.price, this._color, this._icon,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      padding: const EdgeInsets.all(10),
      // height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey.shade400,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('./assets/icons/active_icon.png'),
              Image.asset('./assets/icons/$_icon'),
            ],
          ),
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$$price',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.add,
                  // color: Theme.of(context).primaryColor,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
