import 'package:flutter/material.dart';
import 'package:meal_hour/widgets/total_amount.dart';

class UserDetailsScreen extends StatelessWidget {
  static const routeName = './userdetails_screen';

  // final Function submitHandler;
  final double cartedAmount;
  final bool isLoading;
  // final state;
  UserDetailsScreen(this.cartedAmount, this.isLoading, {Key? key})
      : super(key: key);

  final customerAddress = TextEditingController();
  final customerName = TextEditingController();
  final customerPhone = TextEditingController();
  final customerEmail = TextEditingController();
  final orderItems = TextEditingController();

// final orderSchema = {
//       "customerAddress"=customerAddress,
//       "customerName"=customerName,
//       "customerPhone"=customerPhone,
//       "customerEmail"=customerEmail,
//       "orderStatus"=orderStatus,
//       "orderTotal"=orderTotal,
//       "orderItems"=orderItems,
//     };

  void submitHandler(num orderTotal, String orderStatus) {
    print({
      customerAddress.text,
      customerName.text,
      customerPhone.text,
      customerEmail.text,
      orderTotal,
      orderItems.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    var deliveryFee = (cartedAmount / 4).ceil();
    var vatAmount = (cartedAmount / 9).ceil();
    var total = (cartedAmount + vatAmount + deliveryFee);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Delivery Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.00),
          height: MediaQuery.of(context).size.height * .8,
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
                            'Address',
                            style: TextStyle(
                              fontSize: 17.00,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              labelText: 'Address',
                              hintText: 'Street Address, P.O box etc.',
                            ),
                            controller: customerAddress,
                            keyboardType: TextInputType.streetAddress,
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
                ],
              ),
              Column(
                children: [
                  TotalAmount(
                    deliveryFee: deliveryFee,
                    vatAmount: vatAmount,
                    cartedAmount: cartedAmount,
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
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                          onPressed: () => submitHandler(
                            total,
                            'pending',
                          ),
                          child: isLoading
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
    );
  }
}
