import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla/business_logic/cubit/shop_cubit.dart';
import 'package:salla/business_logic/cubit/shop_states.dart';

import 'package:salla/data/model/banner_model.dart';

import 'package:salla/presentation/home/visa_details/visa_details.dart';
import 'package:salla/shared/components.dart';
import 'package:salla/shared/constants.dart';

import '../../common/login/normal_login/login.dart';
import '../../common/login_with_otp/opt_login.dart';
import '../../data/local/shared_preference.dart';
import '../../data/model/Products_model.dart';
import '../my_orders/orders_screen.dart';
import '../shop_layout/lay_out.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ShopCubit.get(context).getProduct();
  }

  bool sudValue = true;
  bool uaeValue = false;

  @override
  Widget build(BuildContext context) {
    var cubit = ShopCubit.get(context);

    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if(state is ShopProductErrorStates){
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
        }
      },
      builder: (context, state) {
        // print(token);
        // if(state is ShopProductLoadedStates) {
        if (cubit.productModel != null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'الرئيسية',
                style: TextStyle(fontSize: 18),
                textScaleFactor: 1,
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    cubit.changeNav(2);
                  },
                  icon: const Icon(Icons.circle_notifications_rounded),
                ),
              ],
              leading: IconButton(
                  onPressed: () {
                    dialog(context);
                  },
                  icon: const Icon(Icons.category)),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: const [
                        Text(
                          'الأكثر مبيعا',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          textScaleFactor: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.grey[200],
                    height: 150,
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          buildBanner(BannerModel.banner[index]),
                      itemCount: BannerModel.banner.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: const [
                        Text(
                          'أطلب الان',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          textScaleFactor: 1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GridView.count(
                        childAspectRatio: 1 / 1.4,
                        shrinkWrap: true,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        children: List.generate(
                            cubit.productModel!.data[0].length,
                            (index) => buildGridProduct(
                                cubit.productModel!.data[0][index], context)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.deepPurpleAccent[700],
              valueColor: const AlwaysStoppedAnimation(Colors.green),
              strokeWidth: 5,
            ),
          );
        }
      },
    );
  }

  buildBanner(BannerModel model) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(model.urlImg), fit: BoxFit.fill)),
        height: 150,
        width: 150,
        clipBehavior: Clip.antiAliasWithSaveLayer,
      );

  buildGridProduct(Datum model, context) => InkWell(
        onTap: () {
          navigatorTo(context, VisaDetails(model));
        },
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image(
                    image: NetworkImage(model.image.toString()),
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  model.title.toString(),
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w900),
                  textScaleFactor: 1,
                ),
                ShopCubit.get(context).sudValue
                    ? Text(
                        '${model.sudPrice} ج س ',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        textScaleFactor: 1,
                      )
                    : Text(
                        '${model.uaePrice} د إ ',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        textScaleFactor: 1,
                      ),
                const Spacer(),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.deepPurpleAccent[700]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        'احجز الان',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                        textScaleFactor: 1,
                      ),
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );

  dialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: [
              const Text(
                'العملة',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900),
                textScaleFactor: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'جنيه سوداني',
                    style: TextStyle(fontSize: 13),
                    textScaleFactor: 1,
                  ),
                  Checkbox(
                    value: ShopCubit.get(context).sudValue,
                    onChanged: (bool? val) {
                      ShopCubit.get(context).changeCurrencyToSud(val!);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'درهم اماراتي',
                    style: TextStyle(fontSize: 13),
                    textScaleFactor: 1,
                  ),
                  Checkbox(
                    value: ShopCubit.get(context).uaeValue,
                    onChanged: (bool? val) {
                      ShopCubit.get(context).changeCurrencyToUae(val!);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
