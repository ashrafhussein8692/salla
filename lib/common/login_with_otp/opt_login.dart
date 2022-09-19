import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla/data/local/shared_preference.dart';
import 'package:salla/data/repository.dart';
import '../../shared/components.dart';
import '../../shared/constants.dart';
import '../login/login_cubit/login_cubit.dart';
import '../login/login_cubit/login_state.dart';
import '../login_with_otp/otp.dart';

class LoginWithOtpScreen extends StatelessWidget {
  LoginWithOtpScreen({Key? key}) : super(key: key);

  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if(state is LoginWithOtpLoadedStates){
          if(state.optLogin.code ==200){
            CacheHelper.saveData(key: 'phone', value: state.optLogin.data![0].phone).then((value) {
              if(value){
                phone = state.optLogin.data![0].phone;
                toast(text: state.optLogin.message.toString(), color: Colors.green);
                navigatorTo(context, VerificationScreen());
              }
            });


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
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.black),
                              textScaleFactor: 1,
                            ),
                            // const SizedBox(
                            //   height: 30,
                            // ),
                            Text(
                              'سوف نقوم بارسال رمز تأكيد مكون من اربعة ارقام علي الرقم الذي ستقوم بادخاله',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[700]),
                              textScaleFactor: 1,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('رقم الموبايل', style: TextStyle(fontSize: 12,),
                              textScaleFactor: 1,),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[200]
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      child: TextFormField(

                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(9),
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        controller: phoneController,
                                        keyboardType: TextInputType.phone,
                                        textAlignVertical: TextAlignVertical.bottom,
                                        textDirection: TextDirection.ltr,
                                        style: const TextStyle(fontSize: 13,letterSpacing: 2),
                                        // validator: (String? value){
                                        //   if(value!.isEmpty) {
                                        //     return 'من فضلك ادخل رقم التليفون';
                                        //   }else{
                                        //     return null ;
                                        //   }
                                        // },
                                        decoration: InputDecoration(
                                          hintText: 'الرقم بدون صفر',
                                          hintStyle: TextStyle(
                                            fontSize: 15,
                                            letterSpacing: 0
                                            ,
                                            color: Colors.deepPurple[200],
                                          ),
                                          hintTextDirection: TextDirection.ltr,

                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                        ),

                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                    // width: 50,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: const [
                                          Text(
                                            '249+', style: TextStyle(fontSize: 13),
                                            textScaleFactor: 1,),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Image(image: AssetImage(
                                              'assets/images/sudan.png')),

                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // buildLoginInfo(context),
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
                                  // if (formKey.currentState!.validate()) {
                                  //   LoginCubit.get(context).loginWithOtp(
                                  //       phoneController.text,
                                  //       );
                                  // }else {
                                    if(phoneController.text.isEmpty) {
                                      toast(text: 'من فضلك ادخل رقم التليفون', color: Colors.red);
                                    // }
                                  }else {
                                    LoginCubit.get(context).loginWithOtp(
                                       phoneController.text,
                                       );
                                    }
                                  // navigatorTo(context, VerificationScreen());
                                },
                                child:
                                state is LoginWithOtpLoadingStates
                                    ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                    :
                                const Text(
                                  'تسجيل الدخول',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                  textScaleFactor: 1,
                                ),
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
    );
  }

}
