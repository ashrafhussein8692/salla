// // To parse this JSON data, do
// //
// //     final orderModel = orderModelFromJson(jsonString);
//
// import 'dart:convert';
//
// OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));
//
// String orderModelToJson(OrderModel data) => json.encode(data.toJson());
//
// class OrderModel {
//   OrderModel({
//     required this.message,
//     required this.data,
//     required this.error,
//     required this.code,
//   });
//
//   String message;
//   List data;
//   String error;
//   int code;
//
//   factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
//     message: json["message"],
//     data: List<dynamic>.from(json["data"].map((x) => x)),
//     error: json["error"],
//     code: json["code"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "message": message,
//     "data": List<dynamic>.from(data.map((x) => x)),
//     "error": error,
//     "code": code,
//   };
// }
