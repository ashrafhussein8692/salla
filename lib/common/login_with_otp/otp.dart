import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla/common/login/login_cubit/login_cubit.dart';
import 'package:salla/common/login/login_cubit/login_state.dart';
import 'package:salla/data/local/shared_preference.dart';
import 'package:salla/shared/constants.dart';
import '../../data/repository.dart';
import '../../presentation/shop_layout/lay_out.dart';
import '../../shared/components.dart';

class VerificationScreen extends StatelessWidget {
  var num1 = TextEditingController();
  var num2 = TextEditingController();
  var num3 = TextEditingController();
  var num4 = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // String code = num1.text +
  //     num2.text +
  //     num3.text +
  //     num4.text;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is CodeVerificationLoadedStates) {
          if (state.codeVerification.code == 200) {

            // CacheHelper.saveData(
            //     key: 'name', value: state.codeVerification.data![0].name)
            //     .then((value) {
            //   if (value) {
            //     name = state.codeVerification.data![0].name;
            //   }
            // });
            CacheHelper.saveData(
                key: 'phone', value: state.codeVerification.data![0].phone)
                .then((value) {
              if (value) {
                phone = state.codeVerification.data![0].phone;
              }
            });
            // CacheHelper.saveData(
            //     key: 'email', value: state.codeVerification.data![0].email)
            //     .then((value) {
            //   if (value) {
            //     email = state.codeVerification.data![0].email;
            //   }
            // });

            CacheHelper.saveData(
                    key: 'token', value: state.codeVerification.data![0].token)
                .then((value) {
              if (value) {
                token = state.codeVerification.data![0].token;
                toast(
                    text: state.codeVerification.message.toString(),
                    color: Colors.green);
                navigatorAndFinish(context, ShopLayOut());
              }
            });
          }
          else {
            toast(
                text: state.codeVerification.message.toString(),
                color: Colors.red);
          }
        }
      },
      builder: (context, state) {
        // print(phone);


        // var model = LoginCubit.get(context).optLogin!.data!.phone;

        return Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                  color: Color(0xFF6200EA),
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage(
                        'assets/images/otp.png',
                      ),
                      height: 150,
                    ),
                    SizedBox(height: 10),
                    const Text(
                      "Verification Code",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                      textScaleFactor: 1,
                    ),
                    Text(
                      "We have sent the code  verification to",
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),textScaleFactor: 1,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          phone!,
                          style: const TextStyle(fontSize: 14, height: -0.5),
                          textScaleFactor: 1,
                        ),
                        TextButton(
                          style: ButtonStyle(),
                          child: const Text(
                            "Change phone number ?",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF6200EA),
                                height: -0.5),
                            textScaleFactor: 1,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          // height: 60,
                          width: 60,
                          child: TextFormField(
                            controller: num1,
                            onChanged: (val) {
                              if (val.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },

                            textAlign: TextAlign.center,
                            // inputFormatters: [
                            //   LengthLimitingTextInputFormatter(1),
                            //   FilteringTextInputFormatter.digitsOnly
                            // ],
                            // controller: phoneController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 15),
                              hintText: '0',
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Color(0xFF6200EA),
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          // height: 60,
                          width: 60,
                          child: TextFormField(
                            controller: num2,
                            onChanged: (val) {
                              if (val.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },

                            textAlign: TextAlign.center,
                            // inputFormatters: [
                            //   LengthLimitingTextInputFormatter(1),
                            //   FilteringTextInputFormatter.digitsOnly
                            // ],
                            // controller: phoneController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 15),
                              hintText: '0',
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Color(0xFF6200EA),
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          // height: 60,
                          width: 60,
                          child: TextFormField(
                            controller: num3,
                            onChanged: (val) {
                              if (val.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            onSaved: (pin) {},
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            // controller: phoneController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 15),
                              hintText: '0',
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Color(0xFF6200EA),
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          // height: 60,
                          width: 60,
                          child: TextFormField(
                            controller: num4,
                            onChanged: (val) {
                              // if (val.length == 1) {
                              //   FocusScope.of(context).nextFocus();
                              // }
                            },

                             onFieldSubmitted: (val){
                               if (num1.text.isEmpty ||
                                   num2.text.isEmpty ||
                                   num3.text.isEmpty ||
                                   num4.text.isEmpty) {
                                 toast(
                                     text: 'Please enter the code', color: Colors.red);
                                 // }
                               } else {
                                 LoginCubit.get(context)
                                     .sendCodeVerification(phone!, num1.text+num2.text+num3.text+num4.text);

                               }
                             },
                            textAlign: TextAlign.center,
                            // inputFormatters: [
                            //   LengthLimitingTextInputFormatter(1),
                            //   FilteringTextInputFormatter.digitsOnly
                            // ],
                            // controller: phoneController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 15),
                              hintText: '0',
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Color(0xFF6200EA),
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildTimer(),
                    // OtpForm()
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Didn\'t receive the code?",
                          style: TextStyle(color: Colors.black),
                          textScaleFactor: 1,
                        ),
                        TextButton(
                            onPressed: () {
                              LoginCubit.get(context).loginWithOtp(
                                number,
                              );

                            },
                            child: state is LoginWithOtpLoadingStates
                                ? CircularProgressIndicator(
                                    color: Colors.deepPurpleAccent[700],
                                  )
                                : Text(
                                    'Resend',
                                    style: TextStyle(
                                        color: Colors.deepPurpleAccent[700]),
                                    textScaleFactor: 1,
                                  ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.deepPurpleAccent[700],
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (num1.text.isEmpty ||
                              num2.text.isEmpty ||
                              num3.text.isEmpty ||
                              num4.text.isEmpty) {
                            toast(
                                text: 'Please enter the code', color: Colors.red);
                            // }
                          } else {
                            LoginCubit.get(context)
                                .sendCodeVerification(phone!, num1.text+num2.text+num3.text+num4.text);

                          }
                          // navigatorTo(context, VerificationScreen());
                        },
                        child: state is CodeVerificationLoadingStates
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'VERIFY',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                                textScaleFactor: 1,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 60.0, end: 0),
          duration: const Duration(seconds: 60),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: const TextStyle(
              color: Color(0xFF6200EA),
            ),
          ),
        ),
      ],
    );
  }
}


