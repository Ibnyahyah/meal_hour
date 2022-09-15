// To parse this JSON data, do
//
//     final Order = OrderFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Order> orderFromMap(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromMap(x)));

String orderToMap(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Order {
  Order({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });

  String id;
  String title;
  String price;
  String imageUrl;
  String quantity;

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        imageUrl: json["imageUrl"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "price": price,
        "imageUrl": imageUrl,
        "quantity": quantity,
      };
}
