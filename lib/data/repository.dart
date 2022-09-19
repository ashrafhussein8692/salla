import 'dart:io';

import 'package:dio/dio.dart';
import 'package:salla/data/remote/dio_helper.dart';
import 'package:salla/data/remote/end_point.dart';
import 'package:salla/shared/constants.dart';
import 'package:http_parser/http_parser.dart';


class Repository {
  Future<Response> getLocation() async {
    return await DioHelper.getData(url: LOCATION);
  }

  Future<Response> userLogin(String email, String password) async {
    dynamic data = {'email': email, 'password': password};
    return await DioHelper.postData(url: LOGIN, data: data, token: token);
  }

  Future<Response> loginWithOtp(
    String phone,
  ) async {
    dynamic data = {
      'phone': phone,
    };
    return await DioHelper.postData(
      url: SEND_OTP,
      data: data,
    );
  }

  Future<Response> sendCode(String phone, String code) async {
    dynamic data = {'phone': phone, 'code': code};
    return await DioHelper.postData(url: CODE, data: data, token: token);
  }

  Future<Response> userRegister(
    String name,
    String phone,
    String email,
    String password,
  ) async {
    dynamic data = {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password
    };
    return await DioHelper.postData(url: SINGUP, data: data, token: token);
  }

  Future<Response> getProduct() async {
    return await DioHelper.getData(url: PRODUCT, token: token);
  }

  Future<Response> uploadNewVisaFiles(String visaId,File passport,File photo,File receipt,String fileNo) async {
 String passFile = passport.path.split("/").last;
 String photoFile = photo.path.split("/").last;
 String receiptFile = receipt.path.split("/").last;
 // String oldVisaFile = oldVisa.path.split("/").last;
 FormData formData = FormData.fromMap({
   'visa_id' :visaId,
   'passport' :await MultipartFile.fromFile(
     passport.path,
     filename: passFile,
     contentType: MediaType(
       "image",
       "jpeg",
     ),
   ),
   'picture' :await MultipartFile.fromFile(
     photo.path,
     filename: photoFile,
     contentType: MediaType(
       "image",
       "jpeg",
     ),
   ),
   'receipt' :await MultipartFile.fromFile(
     receipt.path,
     filename: receiptFile,
     contentType: MediaType(
       "image",
       "jpeg",
     ),
   ),
   // 'old_visa' :await MultipartFile.fromFile(
   //   oldVisa.path,
   //   filename: oldVisaFile,
   //   contentType: MediaType(
   //     "image",
   //     "jpeg",
   //   ),
   // ),
   'files_no' :fileNo,

 });
 
    return await DioHelper.postFormData(url: ORDER, data: formData, token: token);
  }
  Future<Response> uploadExtendVisaFiles(String visaId,File passport,File photo,File receipt,File oldVisa,String fileNo) async {
    String passFile = passport.path.split("/").last;
    String photoFile = photo.path.split("/").last;
    String receiptFile = receipt.path.split("/").last;
     String oldVisaFile = oldVisa.path.split("/").last;
    FormData formData = FormData.fromMap({
      'visa_id' :visaId,
      'passport' :await MultipartFile.fromFile(
        passport.path,
        filename: passFile,
        contentType: MediaType(
          "image",
          "jpeg",
        ),
      ),
      'picture' :await MultipartFile.fromFile(
        photo.path,
        filename: photoFile,
        contentType: MediaType(
          "image",
          "jpeg",
        ),
      ),
      'receipt' :await MultipartFile.fromFile(
        receipt.path,
        filename: receiptFile,
        contentType: MediaType(
          "image",
          "jpeg",
        ),
      ),
      'old_visa' :await MultipartFile.fromFile(
        oldVisa.path,
        filename: oldVisaFile,
        contentType: MediaType(
          "image",
          "jpeg",
        ),
      ),
      'files_no' :fileNo,

    });

    return await DioHelper.postFormData(url: ORDER, data: formData, token: token);
  }

  Future<Response> getInfo() async {
    return await DioHelper.getData(url: INFO, token: token);
  }
}
