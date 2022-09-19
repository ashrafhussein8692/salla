import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/UserLogin.dart';
import '../../../data/repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  Repository repository;

  LoginCubit(this.repository) : super(LoginInitialStates());

  static LoginCubit get(context) => BlocProvider.of(context);
  UserModel? userlogin;

  void userLogin(String email, String password) {
    emit(LoginLoadingStates());
    repository.userLogin(email, password).then((value) {
      userlogin = UserModel.fromJson(value.data);
      // if (userModel!.code == 200) {
      emit(LoginLoadedStates(userlogin!));
      // } else {
      //   emit(LoginErrorStates(userModel!.message.toString()));
      // }
      print(value.data);
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorStates(error.toString()));
    });
  }

  UserModel? optLogin;

  void loginWithOtp(
    String phone,
  ) {
    emit(LoginWithOtpLoadingStates());
    repository.loginWithOtp(phone).then((value) {
      optLogin = UserModel.fromJson(value.data);
      emit(LoginWithOtpLoadedStates(optLogin!));
      print(value.data);
    }).catchError((error) {
      // print(error.toString());
      emit(LoginWithOtpErrorStates(error.toString()));
    });
  }

  UserModel? codeVerification;
  void sendCodeVerification(
      String phone,
      String code,
      ) {
    emit(CodeVerificationLoadingStates());
    repository.sendCode(phone,code).then((value) {
      userlogin = UserModel.fromJson(value.data);
      emit(CodeVerificationLoadedStates(userlogin!));
      print(value.data);
    }).catchError((error) {
      print(error.toString());
      emit(CodeVerificationErrorStates(error.toString()));
    });
  }

  bool obscure = false;
  IconData suffix = Icons.visibility;

  void changePasswordVisibility() {
    obscure = !obscure;
    suffix = obscure ? Icons.visibility_off_outlined : Icons.visibility;
    emit(LoginPasswordVisibility());
  }
  // UserModel? userModel;
  //
  // void userRegister(String name, String phone, String email, String password) {
  //   emit(RegisterLoadingStates());
  //   repository.userRegister(name, phone, email, password).then((value) {
  //     userModel = UserModel.fromJson(value.data);
  //
  //     emit(RegisterLoadedStates(userModel!));
  //
  //     print(value.data);
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(RegisterErrorStates(error.toString()));
  //   });
  // }
  //
  // bool obscure1 = false;
  // IconData suffix1 = Icons.visibility;
  //
  // void changePasswordVisibilityRegister() {
  //   obscure = !obscure;
  //   suffix = obscure ? Icons.visibility_off_outlined : Icons.visibility;
  //   emit(RegisterPasswordVisibility());
  // }
}
