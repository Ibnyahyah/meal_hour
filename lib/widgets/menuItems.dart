import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  final dynamic data;
  const MenuItems(
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).popAndPushNamed(data['route']);
            },
            child: Row(
              children: [
                Icon(
                  data['icon'] as IconData,
                  color: Colors.black87,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    data['text'] as String,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black38,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
