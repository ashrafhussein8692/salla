import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla/business_logic/cubit/shop_cubit.dart';
import 'package:salla/business_logic/cubit/shop_states.dart';
import '../../data/local/shared_preference.dart';
import '../../shared/components.dart';
import '../login/normal_login/login.dart';
import '../login_with_otp/opt_login.dart';
class OnBoardingScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is OnBoardingLoadedStates) {
          if (state.locationModel.code == 200) {
            CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
              if (value) {
                if (state.locationModel.data[0].status == true) {
                  navigatorAndFinish(context, LoginWithOtpScreen());
                } else {
                  navigatorAndFinish(context, LoginScreen());
                }
              }
            }
            );
          }
        }
      },
      builder: (context, state) {
        return
          Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
              ),
              body:  Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.deepPurpleAccent[700],
                  valueColor: const AlwaysStoppedAnimation(Colors.green),
                  strokeWidth: 5,
                ),
              )

          );
      },

    );
  }


}
