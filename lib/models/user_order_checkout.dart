// To parse this JSON data, do
//
//     final userOrderDetails = userOrderDetailsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserOrderDetails userOrderDetailsFromJson(String str) =>
    UserOrderDetails.fromJson(json.decode(str));

String userOrderDetailsToJson(UserOrderDetails data) =>
    json.encode(data.toJson());

class UserOrderDetails {
  UserOrderDetails({
    required this.message,
    required this.orders,
  });

  String message;
  List<Order> orders;

  factory UserOrderDetails.fromJson(Map<String, dynamic> json) =>
      UserOrderDetails(
        message: json["message"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    this.id,
    required this.customerName,
    required this.customerEmail,
    required this.customerPhone,
    required this.customerAddress,
    required this.orderItems,
    required this.orderTotal,
    required this.orderStatus,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String customerName;
  String customerEmail;
  String customerPhone;
  String customerAddress;
  List<OrderItem> orderItems;
  num orderTotal;
  String orderStatus;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["_id"],
        customerName: json["customerName"],
        customerEmail: json["customerEmail"],
        customerPhone: json["customerPhone"],
        customerAddress: json["customerAddress"],
        orderItems: List<OrderItem>.from(
            json["orderItems"].map((x) => OrderItem.fromJson(x))),
        orderTotal: json["orderTotal"],
        orderStatus: json["orderStatus"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "customerName": customerName,
        "customerEmail": customerEmail,
        "customerPhone": customerPhone,
        "customerAddress": customerAddress,
        "orderItems": List<dynamic>.from(orderItems.map((x) => x.toJson())),
        "orderTotal": orderTotal,
        "orderStatus": orderStatus,
      };
}

class OrderItem {
  OrderItem({
    required this.id,
    required this.title,
    required this.qauntity,
    required this.price,
    required this.imageUrl,
  });

  String id;
  String title;
  String qauntity;
  String price;
  String imageUrl;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        title: json["title"],
        qauntity: json["qauntity"],
        price: json["price"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "qauntity": qauntity,
        "price": price,
        "imageUrl": imageUrl,
      };
}
