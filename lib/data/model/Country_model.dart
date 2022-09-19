//
//
// class CountryModel {
//   CountryModel({
//       this.message,
//       this.data,
//       this.error,
//       this.code,});
//
//   CountryModel.fromJson(dynamic json) {
//     message = json['message'];
//     if (json['data'] != null) {
//       data = [];
//       json['data'].forEach((v) {
//         data?.add(DataCountry.fromJson(v));
//       });
//     }
//     error = json['error'];
//     code = json['code'];
//   }
//   String? message;
//   List<DataCountry>? data;
//   String? error;
//   int? code;
// CountryModel copyWith({  String? message,
//   List<DataCountry>? data,
//   String? error,
//   int? code,
// }) => CountryModel(  message: message ?? this.message,
//   data: data ?? this.data,
//   error: error ?? this.error,
//   code: code ?? this.code,
// );
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['message'] = message;
//     if (data != null) {
//       map['data'] = data?.map((v) => v.toJson()).toList();
//     }
//     map['error'] = error;
//     map['code'] = code;
//     return map;
//   }
//
// }
// class DataCountry {
//   DataCountry({
//     this.status,});
//
//   DataCountry.fromJson(dynamic json) {
//     status = json['status'];
//   }
//   bool? status;
//   DataCountry copyWith({  bool? status,
//   }) => DataCountry(  status: status ?? this.status,
//   );
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = status;
//     return map;
//   }
//
// }
// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  CountryModel({
    required this.message,
    required this.data,
    required this.error,
    required this.code,
  });

  String message;
  List<Datum> data;
  String error;
  int code;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    error: json["error"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "error": error,
    "code": code,
  };
}

class Datum {
  Datum({
    required this.status,
  });

  bool status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}
