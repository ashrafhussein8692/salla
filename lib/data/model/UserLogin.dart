class UserModel {
  UserModel({
      this.message,
      this.data,
      this.code,this.error});

  UserModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    code = json['code'];
    error = json['error'];
  }
  String? message;
  List<Data>? data;
  int? code;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['code'] = code;
    map['error'] = error;
    return map;
  }

}
class Data {
  Data({
    this.name,
    this.phone,
    this.email,
    this.token,});

  Data.fromJson(dynamic json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    token = json['token'];
  }
  String? name;
  String? phone;
  String? email;
  String? token;
  Data copyWith({  String? name,
    String? phone,
    String? email,
    String? token,
  }) => Data(  name: name ?? this.name,
    phone: phone ?? this.phone,
    email: email ?? this.email,
    token: token ?? this.token,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['token'] = token;
    return map;
  }}
//
// }
// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

// import 'dart:convert';
//
// UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
//
// String userModelToJson(UserModel data) => json.encode(data.toJson());
//
// class UserModel {
//   UserModel({
//     required this.message,
//     required this.data,
//     required this.error,
//     required this.code,
//   });
//
//   String message;
//   List<Data> data;
//   String error;
//   int code;
//
//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//     message: json["message"],
//     data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
//     error: json["error"],
//     code: json["code"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "message": message,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     "error": error,
//     "code": code,
//   };
// }
//
// class Data {
//   Data({
//     required this.name,
//     required this.phone,
//     required this.email,
//     required this.token,
//   });
//
//   String name;
//   String phone;
//   String email;
//   String token;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     name: json["name"],
//     phone: json["phone"],
//     email: json["email"],
//     token: json["token"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "phone": phone,
//     "email": email,
//     "token": token,
//   };
// }
