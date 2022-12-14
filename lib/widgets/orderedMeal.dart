import 'package:flutter/material.dart';
import '../models/user_order_checkout.dart';
import 'package:intl/intl.dart';

class OrderedItem extends StatelessWidget {
  OrderItem data;
  String status;
  DateTime date;
  OrderedItem(this.data, this.status, this.date, {Key? key})
      : super(
          key: key,
        );

  void selectedMeal(BuildContext context) {
    Navigator.of(context).pushNamed('/meal_details', arguments: data.id).then(
      (result) {
        // print('result');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.00,
      padding: const EdgeInsets.all(10.00),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60.00,
                height: 60.00,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.00),
                ),
                child: ClipOval(
                  child: Image.asset(data.imageUrl),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '₦${data.price}',
                    ),
                    Text(
                      DateFormat.yMMMMEEEEd().format(date),
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Qty: ${data.qauntity}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: Text(
                  'Status: ${status.toUpperCase()}',
                  style: TextStyle(
                    color: Colors.red.shade400,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
