import 'package:flutter/material.dart';

class TotalAmount extends StatelessWidget {
  const TotalAmount({
    Key? key,
    required this.deliveryFee,
    required this.vatAmount,
    required this.cartedAmount,
  }) : super(key: key);

  final int deliveryFee;
  final int vatAmount;
  final double cartedAmount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(color: Colors.grey),
        Container(
          margin: const EdgeInsets.only(top: 10.00),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Delivery Fee:',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.00,
                ),
              ),
              Text('₦$deliveryFee.00k'),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.00),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'VAT:',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.00,
                ),
              ),
              Text('₦$vatAmount.00k'),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.00),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total:',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.00,
                ),
              ),
              Text('₦${cartedAmount + vatAmount + deliveryFee}k'),
            ],
          ),
        ),
      ],
    );
  }
}
