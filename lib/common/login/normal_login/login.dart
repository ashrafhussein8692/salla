import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla/data/local/shared_preference.dart';
import 'package:salla/data/repository.dart';

import 'package:salla/presentation/shop_layout/lay_out.dart';

import '../../../data/model/UserLogin.dart';
import '../../../shared/components.dart';
import '../../../shared/constants.dart';
import '../../register/register_screen/register.dart';
import '../../login_with_otp/otp.dart';
import '../login_cubit/login_cubit.dart';
import '../login_cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(Repository()),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginLoadedStates) {
            if (state.userModel.code == 200) {
              CacheHelper.saveData(
                  key: 'name', value: state.userModel.data![0].name)
                  .then((value) {
                if (value) {
                  name = state.userModel.data![0].name;
                }
              });
              CacheHelper.saveData(
                  key: 'phone', value: state.userModel.data![0].phone)
                  .then((value) {
                if (value) {
                  phone = state.userModel.data![0].phone;
                }
              });
              CacheHelper.saveData(
                  key: 'email', value: state.userModel.data![0].email)
                  .then((value) {
                if (value) {
                  email = state.userModel.data![0].email;
                }
              });
              CacheHelper.saveData(
                key: 'token',
                value: state.userModel.data![0].token,
              ).then((value) {
                token = state.userModel.data![0].token;

                toast(
                    text: state.userModel.message.toString(),
                    color: Colors.green);
                navigatorAndFinish(context, ShopLayOut());
              });
            } else {
              toast(
                text: state.userModel.message.toString(),
                color: Colors.red,
              );
            }
          }
        },
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              // appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Center(
                            child: Image(
                              image: AssetImage('assets/images/img.png'),
                              height: 150,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'تسجيل الدخول',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.black),
                                textScaleFactor: 1,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              buildLoginInfo(context),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.deepPurpleAccent[700],
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        LoginCubit.get(context).userLogin(
                                            emailController.text,
                                            passwordController.text);
                                      }
                                      // navigatorTo(context, VerificationScreen());
                                    },
                                    child: state is LoginLoadingStates
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : const Text(
                                            'تسجيل الدخول',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                            textScaleFactor: 1,
                                          ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextButton(
                                  onPressed: () {
                                    navigatorTo(context, ForgetPassword());
                                  },
                                  child: Text(
                                    'هل نسيت كلمة السر؟',
                                    style: TextStyle(
                                      color: Colors.deepPurpleAccent[700],
                                    ),
                                    textScaleFactor: 1,
                                  )),
                              // SizedBox(
                              //   height: 15,
                              // ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "ليس لديك حساب؟",
                                      style: TextStyle(color: Colors.black),
                                      textScaleFactor: 1,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          navigatorTo(
                                              context, RegisterScreen());
                                        },
                                        child: Text(
                                          'سجل الان',
                                          style: TextStyle(
                                              color:
                                                  Colors.deepPurpleAccent[700],
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationThickness: 1.5),
                                          textScaleFactor: 1,
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  buildLoginInfo(context) => Column(
        children: [
          formField(context,
              controller: emailController,
              keyBoard: TextInputType.emailAddress,
              prefix: Icons.email_outlined,
              label: 'الايميل', validate: (String? value) {
            if (value!.isEmpty) {
              return 'الايميل مطلوب';
            } else {
              return null;
            }
          }),
          const SizedBox(
            height: 15,
          ),
          formField(context,
              keyBoard: TextInputType.text,
              prefix: Icons.lock_outline,
              suffix: LoginCubit.get(context).suffix,
              label: 'الباسورد',
              controller: passwordController, validate: (String? value) {
            if (value!.isEmpty) {
              return 'الباسورد مطلوب';
            } else {
              return null;
            }
          }, onTap: () {
            LoginCubit.get(context).changePasswordVisibility();
          }, obscure: LoginCubit.get(context).obscure),
        ],
      );
}

class ForgetPassword extends StatelessWidget {
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   leading:
        //   IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(
        //       Icons.close_rounded,
        //       color: Colors.deepPurpleAccent[700],
        //       size: 30,
        //     ),
        //   ),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close_rounded,
                  color: Colors.deepPurpleAccent[700],
                  size: 30,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    'هل نسيت كلمة السر؟',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black,
                        ),
                    textScaleFactor: 1,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'أدخل البريد الالكتروني الخاص بك وسوف نرسل لك كلمة السر الجديدة',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF303030),
                ),
                textScaleFactor: 1,
              ),
              const SizedBox(
                height: 30,
              ),
              formField(
                context,
                controller: emailController,
                keyBoard: TextInputType.emailAddress,
                prefix: Icons.email_outlined,
                label: 'الايميل',
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'الايميل مطلوب';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.deepPurpleAccent[700],
                  ),
                  child: TextButton(
                    onPressed: () {

                      // navigatorTo(context, VerificationScreen());
                    },
                    child:
                    const Text(
                      'اعادة تعيين كلمة السر',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      textScaleFactor: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "ليس لديك حساب؟",
                      style: TextStyle(color: Colors.black),
                      textScaleFactor: 1,
                    ),
                    TextButton(
                        onPressed: () {
                          navigatorTo(
                              context, RegisterScreen());
                        },
                        child: Text(
                          'سجل الان',
                          style: TextStyle(
                              color:
                              Colors.deepPurpleAccent[700],
                              decoration:
                              TextDecoration.underline,
                              decorationThickness: 1.5),
                          textScaleFactor: 1,
                        ))
                  ],
                ),
              ),

            ],

          ),
        ),
      ),
    );
  }
}
