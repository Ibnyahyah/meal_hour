import 'package:flutter/material.dart';
import './menuItems.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  final menusItem = const [
    {
      'icon': Icons.shopping_cart,
      'text': 'Cart',
      'route': './carts_screen',
    },
    {
      'icon': Icons.shopping_bag,
      'text': 'Orders',
      'route': './order__history',
    },
    {
      'icon': Icons.list_alt,
      'text': 'History',
      'route': './test_screen',
    },
    {
      'icon': Icons.star,
      'text': 'Favorite',
      'route': './favorites__screen',
    },
    {
      'icon': Icons.info_outline,
      'text': 'About',
      'route': './about__247chops',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[100],
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: const Text('Chops Hour',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  const Divider(),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    height: MediaQuery.of(context).size.height * .75,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...menusItem
                              .map(
                                (data) => MenuItems(data),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: const [
                  Divider(),
                  Text(
                    'Version 1.0',
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                  Text('Created By: whitecoode')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
