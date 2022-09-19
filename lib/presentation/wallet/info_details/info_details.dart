import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubit/shop_cubit.dart';
import '../../../business_logic/cubit/shop_states.dart';
import '../../../data/model/Products_model.dart';
import '../../../data/model/info_model.dart';

class InfoDetails extends StatelessWidget {
  final DataInfo model;

  const InfoDetails(this.model, {Key? key}) : super(key: key);

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
              title:  Text(
               model.title,
                style: const TextStyle(fontSize: 18, color: Colors.white),
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

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(model.requirements.length,
                          (index) => buildList(model.requirements[index])),
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

  buildList(Requirement model) => Container(
    // height: 200,
margin: const EdgeInsets.symmetric(vertical: 5),
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color(0xFFE0E0E0),
      ),
      borderRadius: BorderRadius.circular(10),
        color: Colors.white

    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.title,
                style: const TextStyle(
                  fontSize: 12,
                ),
                textScaleFactor: 1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                model.subTitle,
                style: const TextStyle(
                    fontSize: 12, color: Colors.black),
                textScaleFactor: 1,
              ),
              // Spacer(),



            ],
          ),
          Spacer(),
          SizedBox(
            height: 110,
             width: 120,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // height: 110,
                  //  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.hardEdge,
                  child: Image(
                    image: NetworkImage("http://app.subayuaevisa.com/api/v1/img/${model.icon}"),

                     fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),



        ],
      ),
    ),
  );
}
