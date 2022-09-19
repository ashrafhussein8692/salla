import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:salla/business_logic/cubit/shop_cubit.dart';
import 'package:salla/business_logic/cubit/shop_states.dart';
import 'package:salla/shared/components.dart';

import '../../data/model/info_model.dart';
import 'info_details/info_details.dart';

class InfoScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var cubit = ShopCubit.get(context);
    return  BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        if(cubit.infoModel !=null) {
          return Scaffold(
          appBar: AppBar(
            title: const Text(
              'المعالم السياحية',
              style: TextStyle(fontSize: 18),
              textScaleFactor: 1,
            ),
            centerTitle: true,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_rounded))
            ],
            leading: const Icon(Icons.category),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.count(
              // childAspectRatio: 1 / 1.17,
              shrinkWrap: true,
              // crossAxisSpacing: 1,
              // mainAxisSpacing: 1,
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 3,
              children: List.generate(
                  cubit.infoModel!.data[0].length,
                      (index) => buildGridInfo(
                      cubit.infoModel!.data[0][index], context)),
            ),
          ),
        );
        }else{
          return  Center(
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
Widget  buildGridInfo(DataInfo model, context) => InkWell(
  onTap: () {
     navigatorTo(context, InfoDetails(model));
  },
  child: Container(
    margin: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
              // height: 100,
             // width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
              image: NetworkImage(model.image.toString()),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          model.title.toString(),
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w900),
          textScaleFactor: 1,
        ),

      ],
    ),
  ),
);

  // saveImage(String url) async {
  //
  //   var response = await Dio()
  //       .get(url, options: Options(responseType: ResponseType.bytes));
  //   final result = await ImageGallerySaver.saveImage(
  //       Uint8List.fromList(response.data),
  //       quality: 100,
  //       );
  //   if(response.data != null){
  //     Fluttertoast.showToast(
  //         msg: 'تم التحميل بنجاح',
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.deepPurpleAccent[700],
  //         textColor: Colors.white,
  //         fontSize: 16.0
  //     );
  //
  //   }
  // }

}
