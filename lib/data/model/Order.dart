class OrderModel {
  OrderModel({
      this.message,
      this.data,
      this.error,
      this.code,});

  OrderModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(v.fromJson(v));
      });
    }
    error = json['error'];
    code = json['code'];
  }
  String? message;
  dynamic data;
  String? error;
  int? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['error'] = error;
    map['code'] = code;
    return map;
  }

}

