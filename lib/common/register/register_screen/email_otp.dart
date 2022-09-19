import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla/common/login/login_cubit/login_cubit.dart';
import 'package:salla/common/login/login_cubit/login_state.dart';
import 'package:salla/data/local/shared_preference.dart';
import 'package:salla/shared/constants.dart';

import '../../../data/repository.dart';
import '../../../presentation/shop_layout/lay_out.dart';
import '../../../shared/components.dart';


class EmailVerificationScreen extends StatelessWidget {

  var num1 = TextEditingController();
  var num2 = TextEditingController();
  var num3 = TextEditingController();
  var num4 = TextEditingController();
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> LoginCubit(Repository()),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){
          if(state is CodeVerificationLoadedStates){
            if(state.codeVerification.code == 200){
              CacheHelper.saveData(key: 'token1', value: state.codeVerification.data![0].token).then((value) {
                if(value){
                  token =state.codeVerification.data![0].token;

                  toast(
                      text: state.codeVerification.message.toString(),
                      color: Colors.green);
                  navigatorAndFinish(context, ShopLayOut());
                }else {
                  if(state.codeVerification.code == 400) {
                    toast(
                        text: state.codeVerification.data.toString(),
                        color: Colors.red);
                  }
                }

              });
            }
          }
        },
        builder: (context,state){
          String code = num1.value.text+num2.value.text+num3.value.text+num4.value.text;

          // var model = LoginCubit.get(context).optLogin!.data!.phone;

          return Scaffold(
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
                    const Image(image:
                    AssetImage('assets/images/otp.png',),
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
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          number,
                          style: const TextStyle(fontSize: 14, height: -0.5),
                          textScaleFactor: 1,
                        ),
                        TextButton(
                          style: ButtonStyle(),
                          child: const Text(
                            "Change phone number ?",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF6200EA), height: -0.5),
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
                                borderRadius: BorderRadius.all(Radius.circular(5)),
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
                                borderRadius: BorderRadius.all(Radius.circular(5)),
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
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          // height: 60,
                          width: 60,
                          child: TextFormField(
                            controller: num4,
                            onChanged: (val) {},
                            onSaved: (pin) {},
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            // controller: phoneController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(fontSize: 20),
                            onFieldSubmitted: (value){
                              LoginCubit.get(context).sendCodeVerification(
                                  number,
                                  code

                              );
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 15),
                              hintText: '0',
                              focusedBorder: OutlineInputBorder(
                                borderSide:  BorderSide.none,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
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
                              LoginCubit.get(context).loginWithOtp(number,
                              );
                            },
                            child:
                            state is LoginWithOtpLoadingStates
                                ?  CircularProgressIndicator(
                              color: Colors.deepPurpleAccent[700],
                            ):Text(
                              'Resend',
                              style: TextStyle(color: Colors.deepPurpleAccent[700]),
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


                          if(num1.text.isEmpty ||num2.text.isEmpty ||num3.text.isEmpty ||num4.text.isEmpty ) {
                            toast(text: 'Please enter the code', color: Colors.red);
                            // }
                          }else {
                            LoginCubit.get(context).sendCodeVerification(
                                number,
                                code

                            );
                            print( code);

                          }
                          // navigatorTo(context, VerificationScreen());
                        },
                        child:
                        state is CodeVerificationLoadingStates
                            ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                            :
                        const Text(
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
          );
        },


      ),
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

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 60,
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: '0',
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 2,
                        color: Color(0xFF6200EA),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: '0',
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 2,
                        color: Color(0xFF6200EA),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  onChanged: (value) => nextField(value, pin3FocusNode),
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: '0',
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 2,
                        color: Color(0xFF6200EA),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  onChanged: (value) => nextField(value, pin4FocusNode),
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: '0',
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 2,
                        color: Color(0xFF6200EA),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin4FocusNode!.unfocus();
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          DefaultButton(
            text: "Continue",
            press: () {},
          )
        ],
      ),
    );
  }
}
