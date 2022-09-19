import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla/common/register/register_cubit/register_state.dart';

import '../../../data/model/UserLogin.dart';
import '../../../data/repository.dart';
import '../../../shared/constants.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  Repository repository;
  RegisterCubit(this.repository) : super(RegisterInitialStates());
  static RegisterCubit get(context) => BlocProvider.of(context);
  Map<String,dynamic> resultData = {};
  UserModel? userModel;
  void userRegister(String name, String phone, String email, String password) {
    emit(RegisterLoadingStates());
    repository.userRegister(name, phone, email, password).then((value) {
      userModel = UserModel.fromJson(value.data);

      // userModel = userModelFromJson(value.data);
     // if(value.statusCode == 200){
     //   if(value.data != null){
     //     var results = json.decode(value.data);
     //     resultData = results['data']['name'];
     //
     //     print(resultData);
     //   }
     // }
      emit(RegisterLoadedStates(userModel!));
      // userModel!.data!.addAll(value.data);
      print(value.data);
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorStates(error.toString()));
    });
  }

  bool obscure = false;
  IconData suffix = Icons.visibility;

  void changePasswordVisibility() {
    obscure = !obscure;
    suffix = obscure ? Icons.visibility_off_outlined : Icons.visibility;
    emit(RegisterPasswordVisibility());
  }
}
