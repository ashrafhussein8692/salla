import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla/business_logic/cubit/shop_cubit.dart';
import 'package:salla/business_logic/cubit/shop_states.dart';
import 'package:salla/presentation/home/visa_details/widgets/pay_extend.dart';
import 'package:salla/presentation/home/visa_details/widgets/pay_new.dart';
import 'package:salla/presentation/shop_layout/lay_out.dart';
import '../../../data/model/Products_model.dart';
import '../../../data/model/banner_model.dart';
import '../../../shared/components.dart';

class VisaDetails extends StatelessWidget {
  Datum model;

  VisaDetails(this.model);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              elevation: 5,
              backgroundColor: Colors.deepPurpleAccent[700],
              title: const Text(
                'تفاصيل الحجز',
                style: TextStyle(fontSize: 18, color: Colors.white),
                textScaleFactor: 1,
              ),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(model.image.toString()),
                              fit: BoxFit.fill)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ShopCubit.get(context).sudValue
                        ? Text(
                            '${model.sudPrice} ج س ',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w900),
                            textScaleFactor: 1,
                          )
                        : Text(
                            '${model.uaePrice} د إ ',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w900),
                            textScaleFactor: 1,
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      model.title.toString(),
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w900),
                      textScaleFactor: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      model.subTitle.toString(),
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w900),
                      textScaleFactor: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      model.description.toString(),
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                      textScaleFactor: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'المتطلبات',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                      textScaleFactor: 1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          List.generate(model.requirements.length, (index) {
                        return Text(
                          model.requirements[index].toString(),
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                          textScaleFactor: 1,
                        );
                      }),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    Text(
                      'اولا قم برفع صورة جواز السفر',
                      style: TextStyle(fontSize: 12, color: Colors.grey[45]),
                      textScaleFactor: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        ShopCubit.get(context).pickPassport();
                      },
                      child: Center(
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: ShopCubit.get(context).passport != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    ShopCubit.get(context).passport!,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Center(
                                      child: Icon(CupertinoIcons.photo),
                                    ),
                                    Text(
                                      'صورة الجواز',
                                      style: TextStyle(fontSize: 11),
                                      textScaleFactor: 1,
                                    )
                                  ],
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'ثانيا قم برفع صورة شخصية',
                      style: TextStyle(fontSize: 12, color: Colors.grey[45]),
                      textScaleFactor: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        ShopCubit.get(context).pickPhoto();
                      },
                      child: Center(
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: ShopCubit.get(context).photo != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    ShopCubit.get(context).photo!,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Center(
                                      child: Icon(CupertinoIcons.photo),
                                    ),
                                    Text(
                                      'صورة شخصية',
                                      style: TextStyle(fontSize: 11),
                                      textScaleFactor: 1,
                                    )
                                  ],
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if(model.id == '2')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ثالثا قم برفع صورة الزيارة القديمة',
                          style: TextStyle(fontSize: 12, color: Colors.grey[45]),
                          textScaleFactor: 1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            ShopCubit.get(context).pickOldVisa();
                          },
                          child: Center(
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              child: ShopCubit.get(context).oldVisa != null
                                  ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  ShopCubit.get(context).oldVisa!,
                                  fit: BoxFit.fill,
                                ),
                              )
                                  : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Center(
                                    child: Icon(CupertinoIcons.photo),
                                  ),
                                  Text(
                                    'صورة الزياره القديمة',
                                    style: TextStyle(fontSize: 11),
                                    textScaleFactor: 1,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            persistentFooterButtons: [
              DefaultButton(
                text: 'الدفع',
                press: () {
                  // _dialog(context);
                  if(model.id =='1') {
                    if(
                    ShopCubit.get(context).passport == null ||
                        ShopCubit.get(context).photo == null
                    ){
                      toast(text: 'من فضلك ارفع الصور', color: Colors.red);
                    }else {
                      navigatorTo(
                      context,
                      PayNewVisaScreen(ShopCubit.get(context).passport!,
                          ShopCubit.get(context).photo!, model));
                    }
                  }
                  if(model.id =='2') {
                    if(
                    ShopCubit.get(context).passport == null ||
                        ShopCubit.get(context).photo == null ||
                        ShopCubit.get(context).oldVisa == null
                    ){
                      toast(text: 'من فضلك ارفع الصور', color: Colors.red);
                    }else {
                      navigatorTo(
                      context,
                      PayExtendVisaScreen(ShopCubit.get(context).passport!,
                          ShopCubit.get(context).photo!,ShopCubit.get(context).oldVisa!, model));
                    }
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}


