import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla/business_logic/cubit/shop_cubit.dart';
import 'package:salla/business_logic/cubit/shop_states.dart';
import 'package:salla/common/login/normal_login/login.dart';
import 'package:salla/data/local/shared_preference.dart';
import 'package:salla/presentation/account/account_edit/acount_edit.dart';
import 'package:salla/shared/components.dart';
import '../../common/login_with_otp/opt_login.dart';
import '../../shared/constants.dart';
import 'change_password/change_password.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {


    name = CacheHelper.getData(key: 'name');
    phone = CacheHelper.getData(key: 'phone');
    email = CacheHelper.getData(key: 'email');
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (ShopCubit.get(context).productModel == null) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.deepPurpleAccent[700],
              valueColor: const AlwaysStoppedAnimation(Colors.green),
              strokeWidth: 5,
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'حسابى',
                style: TextStyle(fontSize: 18),
                textScaleFactor: 1,
              ),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_rounded))
              ],
              leading: const Icon(Icons.category),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    getInfo(),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      onTap: () {
                        navigatorTo(context, const AccountEdit());
                      },
                      title: const Text(
                        'تعديل الحساب',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        textScaleFactor: 1,
                      ),
                      leading: const Icon(Icons.person),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                    if (ShopCubit.get(context).locationModel!.data[0].status ==
                        true )
                      Container(),
                    if (ShopCubit.get(context).locationModel!.data[0].status ==
                        false )
                      ListTile(
                        onTap: () {
                          navigatorTo(context, const ChangePassword());
                        },
                        title: const Text(
                          'تغيير كلمة السر',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          textScaleFactor: 1,
                        ),
                        leading: const Icon(Icons.lock),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ListTile(
                      onTap: () {},
                      title: const Text(
                        'احكام الخصوصية',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        textScaleFactor: 1,
                      ),
                      leading: const Icon(Icons.shield_rounded),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                    ListTile(
                      onTap: () {},
                      title: const Text(
                        'تواصل معنا',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        textScaleFactor: 1,
                      ),
                      leading: const Icon(Icons.whatsapp_rounded),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                    ListTile(
                      onTap: () {
                        CacheHelper.removeData(key: 'name');
                        CacheHelper.removeData(key: 'phone');
                        CacheHelper.removeData(key: 'email');
                        CacheHelper.removeData(key: 'token').then((value) {
                          if (value) {
                            if (ShopCubit.get(context)
                                    .locationModel!
                                    .data[0]
                                    .status ==
                                true) {
                              navigatorAndFinish(context, LoginWithOtpScreen());
                            } else {
                              navigatorAndFinish(context, LoginScreen());
                            }
                          }
                        });
                      },
                      title: const Text(
                        'تسجيل الخروج',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        textScaleFactor: 1,
                      ),
                      leading: const Icon(
                        Icons.output_rounded,
                        color: Colors.red,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.red,
                      ),
                      textColor: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
  getInfo()=>
      Column(
        children: [
          const Center(
            child: Icon(
              Icons.account_circle_rounded,
              size: 100,
              color: Colors.grey,
            ),
          ),
          name == null
              ? const Text('')
              : Text(
            name.toString(),
            style: const TextStyle(fontSize: 15),
            textScaleFactor: 1,
          ),
          Text(
            phone.toString(),
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            textScaleFactor: 1,
          ),
        ],
      );
}

