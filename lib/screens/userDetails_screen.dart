import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/total_amount.dart';

class UserDetailsScreen extends StatefulWidget {
  static const routeName = '/userdetails_screen';

  final Function submitHandler;
  final double cartedAmount;
  final bool isLoading;
  final List<Meal> cartedMeals;
  final Function gettingCheckOutMeal;
  // final state;
  UserDetailsScreen(this.submitHandler, this.cartedAmount, this.isLoading,
      this.cartedMeals, this.gettingCheckOutMeal,
      {Key? key})
      : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  void initState() {
    super.initState();
    widget.gettingCheckOutMeal();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final customerAddress = TextEditingController();

  final customerName = TextEditingController();

  final customerPhone = TextEditingController();

  final customerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var deliveryFee = (widget.cartedAmount / 4).ceil();
    var vatAmount = (widget.cartedAmount / 9).ceil();
    var total = (widget.cartedAmount + vatAmount + deliveryFee);

    final width = MediaQuery.of(context).size.width > 800
        ? MediaQuery.of(context).size.width * .4
        : MediaQuery.of(context).size.width < 560
            ? MediaQuery.of(context).size.width * .99
            : MediaQuery.of(context).size.width < 768
                ? MediaQuery.of(context).size.width * .6
                : double.infinity;
    return Center(
      child: SizedBox(
        width: width,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Delivery Details'),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.00),
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).size.height * .15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    children: [
                      Card(
                        color: Colors.white,
                        elevation: 0,
                        child: Container(
                          padding: const EdgeInsets.all(10.00),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Contact Information',
                                style: TextStyle(
                                  fontSize: 17.00,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextField(
                                decoration: const InputDecoration(
                                  labelText: 'Full Name',
                                  labelStyle: TextStyle(
                                    fontSize: 17.00,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                  hintText: 'White coode',
                                ),
                                controller: customerName,
                              ),
                              TextField(
                                decoration: const InputDecoration(
                                  labelText: 'Phone',
                                  labelStyle: TextStyle(
                                    fontSize: 17.00,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                  hintText: '+234 812 941 8741',
                                ),
                                keyboardType: TextInputType.phone,
                                controller: customerPhone,
                              ),
                              TextField(
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                    fontSize: 17.00,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                  hintText: 'whitecoode@whitecoode.com',
                                ),
                                controller: customerEmail,
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        elevation: 0,
                        child: Container(
                          padding: const EdgeInsets.all(10.00),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // const Text(
                              //   'Address',
                              //   style: TextStyle(
                              //     fontSize: 17.00,
                              //     fontWeight: FontWeight.w500,
                              //   ),
                              // ),
                              TextField(
                                decoration: const InputDecoration(
                                  labelText: 'Address',
                                  hintText: 'Street Address, P.O box etc.',
                                ),
                                controller: customerAddress,
                                keyboardType: TextInputType.streetAddress,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TotalAmount(
                        deliveryFee: deliveryFee,
                        vatAmount: vatAmount,
                        cartedAmount: widget.cartedAmount,
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total ₦$total.00k',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            TextButton(
                              onPressed: () => widget.submitHandler(
                                customerAddress.text,
                                customerName.text,
                                customerPhone.text,
                                customerEmail.text,
                                widget.cartedMeals,
                                'Pending',
                                total,
                                context,
                              ),
                              child: widget.isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      'Continue to Pay',
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.grey[200],
        ),
      ),
    );
  }
}
