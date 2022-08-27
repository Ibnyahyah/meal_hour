import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[100],
      child: Container(
        child: Column(
          children: [
            Text('Meal Hour'),
            Divider(),
            Column(),
          ],
        ),
      ),
    );
  }
}
