import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../apis/base_clients.dart';

import '../models/user_order_checkout.dart';

import '../widgets/orderedMeal.dart';

class OrderHistory extends StatefulWidget {
  static const routeName = '/order__history';

  final String mail;
  OrderHistory(this.mail, {Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  late Future<List<Order>> orderHistory;
  bool isLoading = false;

  void _showToast(String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'CLOSE',
          onPressed: scaffold.hideCurrentSnackBar,
        ),
      ),
    );
  }

  Future<List<Order>> getOrder() async {
    setState(() {
      isLoading = true;
    });
    var response = await BaseClients()
        .get('/orders/${widget.mail}')
        .catchError((err) => debugPrint(err));
    if (response != null) {
      var userOrder = userOrderDetailsFromJson(response);
      setState(() {
        isLoading = false;
      });
      return userOrder.orders;
    } else {
      setState(() {
        isLoading = false;
      });
      var userOrder = userOrderDetailsFromJson(response);
      _showToast('Failed to load order ${userOrder.message}');
      throw Exception('Failed to load order');
    }
  }

  @override
  void initState() {
    orderHistory = getOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width > 800
        ? MediaQuery.of(context).size.width * .4
        : MediaQuery.of(context).size.width < 560
            ? MediaQuery.of(context).size.width * .99
            : MediaQuery.of(context).size.width < 768
                ? MediaQuery.of(context).size.width * .6
                : double.infinity;
    return Center(
      child: Container(
        width: width,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Your Order'),
            elevation: 0,
          ),
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : FutureBuilder<List<Order>>(
                  future: orderHistory,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(
                            children: [
                              ...snapshot.data![index].orderItems
                                  .map(
                                    (data) => OrderedItem(
                                      data,
                                      snapshot.data![index].orderStatus,
                                      snapshot.data![index].createdAt
                                          as DateTime,
                                    ),
                                  )
                                  .toList()
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'Order History',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      );
                    }
                  },
                ),
          backgroundColor: Colors.grey[200],
        ),
      ),
    );
  }
}
