
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';

class OrderFollow extends StatefulWidget {
  @override
  State<OrderFollow> createState() => _OrderFollowState();
}

class _OrderFollowState extends State<OrderFollow> {
  int currentStep = 2;

  StepperType stepperType = StepperType.horizontal;

  bool isComplete = false;

  bool value1 = false;
  bool value2 = false;
  saveImage(String url) async {

    var response = await Dio()
        .get(url, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data),
      quality: 100,
    );
    if(response.data != null){
      Fluttertoast.showToast(
          msg: 'تم التحميل بنجاح',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.deepPurpleAccent[700],
          textColor: Colors.white,
          fontSize: 16.0
      );

    }
  }
  var now =  DateTime.now();
  var formatter =  DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.deepPurpleAccent[700],
        title: const Text(
          'متابعة الطلب',
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
      body:isComplete ?const buildCompleted():
      Row(
        children: [
          Expanded(
            child: Theme(
              data: ThemeData(
                fontFamily: 'Cairo',
                  colorScheme: const ColorScheme.light(
                      primary: Color(0xFF6200EA),
                  )
              ),
              child: Stepper(
                  controlsBuilder: (context, control) {
                    // final isLastStep = currentStep == getStep().length - 1;
                    return Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: Row(
                        children: [
                          // Expanded(
                          //     child: ElevatedButton(
                          //         onPressed: control.onStepContinue,
                          //         child: Text(
                          //           isLastStep ? 'CONFIRM' : 'NEXT',
                          //           style: const TextStyle(fontSize: 13),
                          //         ))),
                          // const SizedBox(
                          //   width: 12,
                          // ),
                          // if (currentStep != 0)
                          //   Expanded(
                          //       child: ElevatedButton(
                          //           onPressed: control.onStepCancel,
                          //           child: const Text(
                          //             'BACK',
                          //             style: TextStyle(fontSize: 13),
                          //           ))),
                        ],
                      ),
                    );
                  },
                  type: stepperType,
                  physics: const ScrollPhysics(),
                  currentStep: currentStep,
                  // onStepTapped: (step) => setState(() {
                  //       currentStep = step;
                  //     }),
                  // onStepContinue: () {
                  //   final isLastStep = currentStep == getStep().length - 1;
                  //   if (isLastStep) {
                  //     setState(() {
                  //       isCompelete = true;
                  //     });
                  //   } else {
                  //     setState(() {
                  //       currentStep += 1;
                  //     });
                  //   }
                  // },
                  // onStepCancel: () {
                  //   currentStep == 0
                  //       ? null
                  //       : setState(() {
                  //           currentStep -= 1;
                  //         });
                  // },
                  steps: getStep(),

              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Step> getStep() => [
        Step(

          title: const Text(
            'الطلب',
            style: TextStyle(fontSize: 15),textScaleFactor: 1,
          ),
           content: buildStep1(),
          isActive: currentStep >= 0,
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: const Text('قيد المراجعة', style: TextStyle(fontSize: 15),textScaleFactor: 1,),
          content: buildStep2(),
          isActive: currentStep >= 1,
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: const Text('نجاح الطلب', style: TextStyle(fontSize: 15),textScaleFactor: 1,),
          content: buildStep3(),
          isActive: currentStep >= 2,
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
        ),
      ];
  buildStep1() =>
      Column(
        children: [

        ],
      );

  buildStep2() =>
      Column(
        children: <Widget>[
          // Row(
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Row(
          //           children:  [
          //             const Text('اسم العميل :   ',style: TextStyle(fontSize: 12),),
          //             // Text(widget.model.client,style: const TextStyle(fontSize: 12),),
          //           ],
          //         ),
          //
          //       ],
          //     ),
          //
          //   ],
          // ),

        ],
      );

  buildStep3() =>
      Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 2,
                  spreadRadius: 2,
                  color: Colors.black26,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children:  [
                  FullScreenWidget(
                    child: Hero(
                      tag: "customTag",
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          "https://www.ivisa.com/images/blog/compress-image.jpg",
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(formatter.format(now)),
                      InkWell(
                        onTap: (){
                          saveImage('https://www.ivisa.com/images/blog/compress-image.jpg');
                        },
                        child: Container(
                          height: 30,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.deepPurpleAccent[700],

                          ),
                          child: Center(child: Text('تحميل',style: TextStyle(fontSize: 15,color: Colors.white),)),
                        ),
                      )
                    ],
                  )

                ],
              ),
            ),
          )
          // Row(
          //   children: [
          //     const Text('طريقة الدفع :  ',style: TextStyle(fontSize: 12),textScaleFactor: 1,),
          //
          //   ],
          // )
        ],
      );

}
class buildCompleted extends StatelessWidget {
  const buildCompleted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(50),
                color: Colors.greenAccent),
            child: const Image(
              image: AssetImage(
                  'assets/images/check.png'),
              height: 100,
            ),
          ),
          const Text(
            'SUCCESS',
            style: TextStyle(fontSize: 12),
            textScaleFactor: 1.5,
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: const Text(
              'Continue My Orders',
              style: TextStyle(fontSize: 12),
              textScaleFactor: 1.5,
            ),
          ),
        ],
      ),
    );

  }
}
