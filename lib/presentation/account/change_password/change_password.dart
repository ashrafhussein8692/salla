import 'package:flutter/material.dart';
import 'package:salla/presentation/shop_layout/lay_out.dart';
import 'package:salla/shared/components.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            elevation: 5,
            backgroundColor: Colors.deepPurpleAccent[700],
            title: const Text(
              'تغيير كلمة السر',
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
            )),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              formField(
                  prefix: Icons.lock_outline_rounded,
                  context,
                  keyBoard: TextInputType.visiblePassword,
                  label: 'كلمة السر القديمة',
                  validate: (String? value){
                    if(value!.isEmpty){
                      return 'كلمة السر القديمة مطلوبلا';
                    }
                  }
              ),
              const SizedBox(
                height: 20,
              ),
              formField(
                  context,
                  prefix: Icons.lock_outline_rounded,
                  keyBoard: TextInputType.visiblePassword,
                  label: 'كلمة السر الجديدة',
                  validate: (String? value){
                    if(value!.isEmpty){
                      return 'كلمة السر الجديدة مطلوبلا';
                    }
                  }
              ),
              const SizedBox(
                height: 20,
              ),
              formField(
                  prefix: Icons.lock_outline_rounded,
                  context,
                  keyBoard: TextInputType.visiblePassword,
                  label: 'اعد ادخال كلمة السر الجديدة',
                  validate: (String? value){
                    if(value!.isEmpty){
                      return 'كلمة السر الجديدة مطلوبلا';
                    }
                  }
              ),
              const SizedBox(
                height: 50,
              ),
              DefaultButton(
                press: (){
                  navigatorAndFinish(context, ShopLayOut());
                },
                text: 'تأكيد',
              ),


            ],
          ),
        ),
      ),
    );
  }
}


class NewPassword extends StatelessWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            elevation: 5,
            backgroundColor: Colors.deepPurpleAccent[700],
            title: const Text(
              'كلمة السر الجديدة',
              style: TextStyle(fontSize: 18, color: Colors.white),
              textScaleFactor: 1,
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              formField(
                  context,
                  prefix: Icons.lock_outline_rounded,
                  keyBoard: TextInputType.visiblePassword,
                  label: 'كلمة السر الجديدة',
                  validate: (String? value){
                    if(value!.isEmpty){
                      return 'كلمة السر الجديدة مطلوبلا';
                    }
                  }
              ),
              const SizedBox(

                height: 20,
              ),
              formField(
                prefix: Icons.lock_outline_rounded,
                  context,
                  keyBoard: TextInputType.visiblePassword,
                  label: 'اعد ادخال كلمة السر الجديدة',
                  validate: (String? value){
                    if(value!.isEmpty){
                      return 'كلمة السر الجديدة مطلوبلا';
                    }
                  }
              ),
              const SizedBox(
                height: 50,
              ),
              DefaultButton(
                press: (){
                  navigatorAndFinish(context, ShopLayOut());
                },
                text: 'تأكيد',
              )
            ],
          ),
        ),
      ),
    );
  }
}
