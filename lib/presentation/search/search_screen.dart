import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'طلباتي',
            style: TextStyle(fontSize: 18),
            textScaleFactor: 1,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_rounded),
            )
          ],
          leading: const Icon(Icons.category),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 50,
                      lineWidth: 10.0,
                      animation: true,
                      percent: 0.05,
                      center: const Text(
                        "5%",
                        style: TextStyle(fontSize: 15.0),
                        textScaleFactor: 1,
                      ),
                      // footer: const Text(
                      //   "1 طلب",
                      //   style: TextStyle(fontSize: 15.0),
                      //   textScaleFactor: 1,
                      // ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.purple,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 50,
                      lineWidth: 10.0,
                      animation: true,
                      percent: 0.10,
                      center: const Text(
                        "10%",
                        style: TextStyle(fontSize: 15.0),
                        textScaleFactor: 1,
                      ),
                      // footer: const Text(
                      //   "1 طلب",
                      //   style: TextStyle(fontSize: 15.0),
                      //   textScaleFactor: 1,
                      // ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 50,
                      lineWidth: 10.0,
                      animation: true,
                      percent: 0.15,
                      center: const Text(
                        "15%",
                        style: TextStyle(fontSize: 15.0),
                        textScaleFactor: 1,
                      ),
                      // footer: const Text(
                      //   "1 طلب",
                      //   style: TextStyle(fontSize: 15.0),
                      //   textScaleFactor: 1,
                      // ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.green,
                    ),
                  ),
                ],
              ),
              Spacer(
                flex: 5,
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        CupertinoIcons.minus_square_fill,color: Colors.deepPurple,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          'ستحصل علي خصم بقيمة 5% اذا قمت بحجز 5 طلبات',
                          style: TextStyle(fontSize: 12),
                          textScaleFactor: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                          CupertinoIcons.minus_square_fill,color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          'ستحصل علي خصم بقيمة 10% اذا قمت بحجز 10 طلبات',
                          style: TextStyle(fontSize: 12),
                          textScaleFactor: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                          CupertinoIcons.minus_square_fill,color: Colors.green,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          'ستحصل علي خصم بقيمة 15% اذا قمت بحجز 15 طلبات',
                          style: TextStyle(fontSize: 12),
                          textScaleFactor: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(
                flex: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
