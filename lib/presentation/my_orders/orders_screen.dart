import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salla/presentation/my_orders/follow_order/follow_order.dart';
import 'package:salla/shared/components.dart';

class MyOrdersScreen extends StatelessWidget {

  var now =  DateTime.now();
  var formatter =  DateFormat('yyyy-MM-dd');
  // String formattedDate = formatter.format(now);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'طلباتي',
          style: TextStyle(fontSize: 18),
          textScaleFactor: 1,
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_rounded))
        ],
        leading: Icon(Icons.category),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                navigatorTo(context, OrderFollow());
              },
              child: Container(
                // height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300]),
                child: Column(
                  children: [
                    const Text(
                      'استخراج فيزا زيارة 3 شهور',
                      style: TextStyle(fontSize: 15),
                      textScaleFactor: 1,
                    ),
                    Text(formatter.format(now))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
