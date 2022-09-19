import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla/common/register/register_cubit/register_cubit.dart';
import 'package:salla/common/register/register_cubit/register_state.dart';
import 'package:salla/data/local/shared_preference.dart';
import 'package:salla/data/repository.dart';
import 'package:salla/presentation/shop_layout/lay_out.dart';

import '../../../shared/components.dart';
import '../../../shared/constants.dart';
import '../../login/normal_login/login.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => RegisterCubit(Repository()),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterLoadedStates) {
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
                      key: 'token', value: state.userModel.data![0].token)
                  .then((value) {
                token = state.userModel.data![0].token;
                toast(
                    text: state.userModel.message.toString(),
                    color: Colors.green);

                navigatorAndFinish(context, ShopLayOut());
              });
            } else {
              toast(
                  text: state.userModel.message.toString(), color: Colors.red);
            }
          }
        },
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.white,
              // appBar: AppBar(
              //   backgroundColor: Colors.white,
              //   elevation: 0,
              //   leading: IconButton(
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //     icon: Icon(
              //       Icons.arrow_back_ios_rounded,
              //       color: Colors.deepPurpleAccent[700],
              //       size: 30,
              //     ),
              //   ),
              // ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.deepPurpleAccent[700],
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'التسجيل',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.black,
                                  ),
                          textScaleFactor: 1,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        formField(context,
                            controller: nameController,
                            keyBoard: TextInputType.name,
                            prefix: Icons.person,
                            label: 'الاسم', validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'الاسم مطلوب';
                          } else {
                            return null;
                          }
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        formField(context,
                            controller: phoneController,
                            keyBoard: TextInputType.phone,
                            prefix: Icons.phone_android_outlined,
                            label: 'رقم الهاتف', validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'رقم الهاتف مطلوب';
                          } else {
                            return null;
                          }
                        }),
                        SizedBox(
                          height: 20,
                        ),
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
                          height: 20,
                        ),
                        formField(context,
                            keyBoard: TextInputType.text,
                            prefix: Icons.lock_outline,
                            suffix: RegisterCubit.get(context).suffix,
                            label: 'الباسورد',
                            controller: passwordController,
                            validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'الباسورد مطلوب';
                          } else {
                            return null;
                          }
                        }, onTap: () {
                          RegisterCubit.get(context).changePasswordVisibility();
                        }, obscure: RegisterCubit.get(context).obscure),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: state is RegisterLoadingStates
                                ? CircularProgressIndicator(
                                    color: Colors.deepPurpleAccent[700],
                                  )
                                : DefaultButton(
                                    text: 'سجل الان',
                                    press: () {
                                      if (formKey.currentState!.validate()) {
                                        RegisterCubit.get(context).userRegister(
                                            nameController.text,
                                            phoneController.text,
                                            emailController.text,
                                            passwordController.text);
                                      }
                                    })
                            // Container(
                            //   width: double.infinity,
                            //   height: 50,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(6),
                            //     color: Color(0xFF6200EA),
                            //   ),
                            //   child: TextButton(
                            //     onPressed: () {
                            //       if (formKey.currentState!.validate()) {
                            //         RegisterCubit.get(context).userRegister(
                            //             nameController.text,
                            //             phoneController.text,
                            //             emailController.text,
                            //             passwordController.text);
                            //       }
                            //     },
                            //     child: state is RegisterLoadingStates
                            //         ? const CircularProgressIndicator(
                            //             color: Colors.white,
                            //           )
                            //         : const Text(
                            //             'سجل الان',
                            //             style: TextStyle(
                            //               fontSize: 15,
                            //               color: Colors.white,
                            //             ),
                            //             textScaleFactor: 1,
                            //           ),
                            //   ),
                            // ),
                            ),
                      ],
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
}
