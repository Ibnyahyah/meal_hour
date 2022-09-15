import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/orderedMeal.dart';

import '../models/order__history.dart';

Future<List<Order>> getHistory() async {
  print({'Starting'});
  final url = Uri.https(
      'wedo-diary-default-rtdb.firebaseio.com', '/ordered-history/hi.json');
  final response = await http.get(url);
  // print({response.statusCode, 'Success', response.body});
  if (response.statusCode == 200) {
    print({response.statusCode, 'Success', response.body});
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    print({response.statusCode, 'Ending'});
    return parsed.map<Order>((json) => Order.fromMap(json)).toList();
  } else {
    throw Exception('Failed to Load Order History');
  }
}

class OrderHistory extends StatefulWidget {
  static const routeName = './order__history';

  OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  late Future<List<Order>> futureOrderHistory;
  @override
  void initState() {
    super.initState();
    futureOrderHistory = getHistory();
    print(futureOrderHistory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Order'),
        elevation: 0,
      ),
      body: FutureBuilder<List<Order>>(
        future: futureOrderHistory,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => OrderedItem(
                snapshot.data![index].id,
                snapshot.data![index].imageUrl,
                snapshot.data![index].title,
                snapshot.data![index].quantity,
                snapshot.data![index].price,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
