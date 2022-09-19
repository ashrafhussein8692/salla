import 'package:flutter/material.dart';
import 'package:salla/presentation/shop_layout/lay_out.dart';
import 'package:salla/shared/components.dart';


class OrderComplete extends StatelessWidget {
  const OrderComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'تم حجز طلبك بنجاح',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                    textScaleFactor: 1,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'يمكنك متابعة طلبك من قائمة طلباتي',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                    textScaleFactor: 1,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.greenAccent),
                      child: const Image(
                        image: AssetImage('assets/images/check.png'),
                        height: 100,
                      )),
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                      navigatorAndFinish(context, ShopLayOut());
                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          width: 200,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepPurpleAccent[700]),
                          child: Center(
                            child:Text(
                              'الرئيسية',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                              textScaleFactor: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
