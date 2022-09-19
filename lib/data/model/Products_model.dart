// // import 'Data.dart';
// //
// // class ProductsModel {
// //   ProductsModel({
// //       this.message,
// //       this.data,
// //       this.error,
// //       this.code,});
// //
// //   ProductsModel.fromJson(dynamic json) {
// //     message = json['message'];
// //     if (json['data'] != null) {
// //       data = [];
// //       json['data'].forEach((v) {
// //         data?.add(DataModel.fromJson(v));
// //       });
// //     }
// //     error = json['error'];
// //     code = json['code'];
// //   }
// //   String? message;
// //   List<List<DataModel>>? data;
// //   String? error;
// //   int? code;
// //
// //   Map<String, dynamic> toJson() {
// //     final map = <String, dynamic>{};
// //     map['message'] = message;
// //     if (data != null) {
// //       map['data'] = data?.map((v) => v.toJson());
// //     }
// //     map['error'] = error;
// //     map['code'] = code;
// //     return map;
// //   }
// //
// // }
// // class DataModel {
// //   DataModel({
// //     this.id,
// //     this.title,
// //     this.subTitle,
// //     this.description,
// //     this.uaePrice,
// //     this.image,
// //     this.icon,
// //     this.requirements,});
// //
// //   DataModel.fromJson(dynamic json) {
// //     id = json['id'];
// //     title = json['title'];
// //     subTitle = json['sub_title'];
// //     description = json['description'];
// //     uaePrice = json['uae_price'];
// //     image = json['image'];
// //     icon = json['icon'];
// //     requirements = json['requirements'] != null ? json['requirements'].cast<String>() : [];
// //   }
// //   String? id;
// //   String? title;
// //   String? subTitle;
// //   String? description;
// //   String? uaePrice;
// //   String? image;
// //   String? icon;
// //   List<String>? requirements;
// //
// //   Map<String, dynamic> toJson() {
// //     final map = <String, dynamic>{};
// //     map['id'] = id;
// //     map['title'] = title;
// //     map['sub_title'] = subTitle;
// //     map['description'] = description;
// //     map['uae_price'] = uaePrice;
// //     map['image'] = image;
// //     map['icon'] = icon;
// //     map['requirements'] = requirements;
// //     return map;
// //   }
// //
// // }
// // To parse this JSON data, do
// //
// //     final ProductModel = ProductModelFromJson(jsonString);
//
// import 'dart:convert';
//
// ProductModel ProductModelFromJson(String str) => ProductModel.fromJson(json.decode(str));
//
// String ProductModelToJson(ProductModel data) => json.encode(data.toJson());
//
// class ProductModel {
//   ProductModel({
//     required this.message,
//     required this.data,
//     required this.error,
//     required this.code,
//   });
//
//   String message;
//   List<List<Datum>> data;
//   String error;
//   int code;
//
//   factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//     message: json["message"],
//     data: List<List<Datum>>.from(json["data"].map((x) => List<Datum>.from(x.map((x) => Datum.fromJson(x))))),
//     error: json["error"],
//     code: json["code"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "message": message,
//     "data": List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
//     "error": error,
//     "code": code,
//   };
// }
//
// class Datum {
//   Datum({
//     required this.id,
//     required this.title,
//     required this.subTitle,
//     required this.description,
//     required this.uaePrice,
//     required this.image,
//     required this.icon,
//     required this.requirements,
//   });
//
//   String id;
//   String title;
//   String subTitle;
//   String description;
//   String uaePrice;
//   String image;
//   String icon;
//   List<String> requirements;
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     id: json["id"],
//     title: json["title"],
//     subTitle: json["sub_title"],
//     description: json["description"],
//     uaePrice: json["uae_price"],
//     image: json["image"],
//     icon: json["icon"],
//     requirements: List<String>.from(json["requirements"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "sub_title": subTitle,
//     "description": description,
//     "uae_price": uaePrice,
//     "image": image,
//     "icon": icon,
//     "requirements": List<dynamic>.from(requirements.map((x) => x)),
//   };
// }
// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.message,
    required this.data,
    required this.error,
    required this.code,
  });

  String message;
  List<List<Datum>> data;
  String error;
  int code;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    message: json["message"],
    data: List<List<Datum>>.from(json["data"].map((x) => List<Datum>.from(x.map((x) => Datum.fromJson(x))))),
    error: json["error"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
    "error": error,
    "code": code,
  };
}

class Datum {
  Datum({
    required this.id,
    required this.filesNo,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.uaePrice,
    required this.sudPrice,
    required this.image,
    required this.icon,
    required this.requirements,
  });

  String id;
  String filesNo;
  String title;
  String subTitle;
  String description;
  String uaePrice;
  String sudPrice;
  String image;
  String icon;
  List<String> requirements;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    filesNo: json["files_no"],
    title: json["title"],
    subTitle: json["sub_title"],
    description: json["description"],
    uaePrice: json["uae_price"],
    sudPrice: json["sud_price"],
    image: json["image"],
    icon: json["icon"],
    requirements: List<String>.from(json["requirements"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "files_no": filesNo,
    "title": title,
    "sub_title": subTitle,
    "description": description,
    "uae_price": uaePrice,
    "sud_price": sudPrice,
    "image": image,
    "icon": icon,
    "requirements": List<dynamic>.from(requirements.map((x) => x)),
  };
}
