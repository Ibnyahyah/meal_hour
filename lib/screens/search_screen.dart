import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search__screen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width > 800
        ? MediaQuery.of(context).size.width * .4
        : MediaQuery.of(context).size.width < 560
            ? MediaQuery.of(context).size.width * .99
            : MediaQuery.of(context).size.width < 768
                ? MediaQuery.of(context).size.width * .6
                : double.infinity;
    return SafeArea(
      top: false,
      child: Center(
        child: Container(
          width: width,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Search'),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop('/home_screen');
                  },
                  icon: const Icon(
                    Icons.cancel_outlined,
                  ),
                )
              ],
              elevation: 0,
            ),
            body: Wrap(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      labelText: 'Shawarma...',
                      // errorText: 'Kindly write a meal',
                      // errorStyle: TextStyle(
                      //   color: Colors.red[400],
                      // ),
                      // errorBorder: const OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //     width: 1,
                      //     color: Colors.red,
                      //   ),
                      // ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: const [
                      SearchItem(),
                      SearchItem(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchItem extends StatelessWidget {
  const SearchItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 3.0),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 5.0,
        ),
        margin: const EdgeInsets.only(top: 5.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.shade300,
        ),
        child: const Text(
          'Shawarma',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
