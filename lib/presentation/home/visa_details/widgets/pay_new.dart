import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../business_logic/cubit/shop_cubit.dart';
import '../../../../business_logic/cubit/shop_states.dart';
import '../../../../data/model/Products_model.dart';
import '../../../../shared/components.dart';
import '../../../shop_layout/lay_out.dart';
import 'order_complete.dart';

class PayNewVisaScreen extends StatelessWidget {
  File passport;
  File photo;
  Datum model;

  PayNewVisaScreen(this.passport, this.photo, this.model);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopLoadedUploadFilesStates) {
          toast(text: state.orderModel.message.toString(), color: Colors.green);
           // Timer(const Duration(seconds: 2), () =>
               navigatorAndFinish(context, OrderComplete());
        }
      },
      builder: (context, state) {
       if( state is ShopLoadingUploadFilesStates) {
         return
         Container(
           color: Colors.white,
           child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.deepPurpleAccent[700],
                valueColor: const AlwaysStoppedAnimation(Colors.green),
                strokeWidth: 5,
              )),
         );
       }else {
         return Scaffold(
          appBar: AppBar(
            elevation: 5,
            backgroundColor: Colors.deepPurpleAccent[700],
            title: const Text(
              'الدفع',
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
          body:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'اولا قم بالدفع علي رقم الحساب التالي',
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[45]),
                          textScaleFactor: 1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300]),
                            child: const Center(
                              child: Text(
                                '4505 7700 7695 4552',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'ثانيا قم برفع صورة وصل الدفع',
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[45]),
                          textScaleFactor: 1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            ShopCubit.get(context).pickInvoice();
                          },
                          child: Center(
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              child: ShopCubit.get(context).invoice != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        ShopCubit.get(context).invoice!,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Center(
                                          child: Icon(CupertinoIcons.photo),
                                        ),
                                        Text(
                                          'صورة الوصل',
                                          style: TextStyle(fontSize: 11),
                                          textScaleFactor: 1,
                                        )
                                      ],
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          persistentFooterButtons: [
            // state is ShopLoadingUploadFilesStates ? Center(
            //   child: CircularProgressIndicator(
            //     backgroundColor: Colors.deepPurpleAccent[700],
            //     valueColor: const AlwaysStoppedAnimation(Colors.green),
            //     strokeWidth: 5,
            //   ),
            // ):
            DefaultButton(
              text: 'احجز الان',
              press: () {
                if (ShopCubit.get(context).invoice == null) {
                  toast(text: 'من فضلك ارفع الوصل', color: Colors.red);
                } else {
                  ShopCubit.get(context).uploadNewVisaFiles(
                    model.id,
                    model.filesNo,
                    passport,
                    photo,
                    ShopCubit.get(context).invoice!,
                  );
                }
                // _dialog(context);
                // navigatorTo(context, widget)
              },
            )
          ],
        );
       }
      },
    );
  }

  void _dialog(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Column(
            children: [
              const Text(
                'تم الحجز',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900),
                textScaleFactor: 1,
              ),
              const Center(
                  child: Text(
                'يمكنك متابعة طلبك من قائمة طلباتي',
                style: TextStyle(
                  fontSize: 13,
                ),
                textScaleFactor: 1,
              )),
              const SizedBox(
                height: 10,
              ),
              DefaultButton(
                text: 'اغلاق',
                press: () {
                  navigatorAndFinish(context, ShopLayOut());
                },
              )
            ],
          ));
        });
  }
}
