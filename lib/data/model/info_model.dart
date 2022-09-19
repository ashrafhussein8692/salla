// To parse this JSON data, do
//
//     final infoModel = infoModelFromJson(jsonString);

import 'dart:convert';

InfoModel infoModelFromJson(String str) => InfoModel.fromJson(json.decode(str));

String infoModelToJson(InfoModel data) => json.encode(data.toJson());

class InfoModel {
  InfoModel({
    required this.message,
    required this.data,
    required this.error,
    required this.code,
  });

  String message;
  List<List<DataInfo>> data;
  String error;
  int code;

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
    message: json["message"],
    data: List<List<DataInfo>>.from(json["data"].map((x) => List<DataInfo>.from(x.map((x) => DataInfo.fromJson(x))))),
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

class DataInfo {
  DataInfo({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.image,
    required this.icon,
    required this.requirements,
  });

  String id;
  String title;
  String subTitle;
  String description;
  String image;
  String icon;
  List<Requirement> requirements;

  factory DataInfo.fromJson(Map<String, dynamic> json) => DataInfo(
    id: json["id"],
    title: json["title"],
    subTitle: json["sub_title"],
    description: json["description"],
    image: json["image"],
    icon: json["icon"],
    requirements: List<Requirement>.from(json["requirements"].map((x) => Requirement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "sub_title": subTitle,
    "description": description,
    "image": image,
    "icon": icon,
    "requirements": List<dynamic>.from(requirements.map((x) => x.toJson())),
  };
}

class Requirement {
  Requirement({
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  String title;
  String subTitle;
  String icon;

  factory Requirement.fromJson(Map<String, dynamic> json) => Requirement(
    title: json["title"],
    subTitle: json["sub_title"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "sub_title": subTitle,
    "icon": icon,
  };
}
