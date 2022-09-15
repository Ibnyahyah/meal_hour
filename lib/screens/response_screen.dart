import 'package:flutter/material.dart';

class ResponseScreen extends StatelessWidget {
  static const routeName = './response_screen';
  const ResponseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = ModalRoute.of(context)?.settings.arguments;
    print(content);
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Column(
            children: [
              const Text(
                'Message',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Your Have successful\n place order',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
