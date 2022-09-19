import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salla/shared/components.dart';

import '../../../data/local/shared_preference.dart';
import '../../../shared/constants.dart';

class AccountEdit extends StatefulWidget {
  const AccountEdit({Key? key}) : super(key: key);

  @override
  State<AccountEdit> createState() => _AccountEditState();
}

class _AccountEditState extends State<AccountEdit> {
  XFile? imageFile;
var nameController = TextEditingController();
var emailController = TextEditingController();
var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(name == null) {
      nameController.text=  '';
    }else{
      nameController.text = name!;
    }
    if(phone != null) {
      phoneController.text =phone!;
    }else {
      phoneController.text = '';
    }
    if(email != null) {
      emailController.text =email!;
    }else {
      emailController.text = '';
    }
    // emailController.text = email ;
    // name = nameController as String?;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            elevation: 5,
            backgroundColor: Colors.deepPurpleAccent[700],
            title: const Text(
              'تعديل الحساب',
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [

                Center(
                  child: InkWell(

                    onTap: (){
                      pickImageCamera();
                    },
                    child: Container(
                      color: Colors.white,
                      // width: 120,
                      height: 150,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            bottom: 20,
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  color: Colors.grey[300]),
                              child: const Icon(
                                Icons.person,
                                color: Colors.grey,
                                size: 100,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            child: CircleAvatar(
                                backgroundColor: Colors.deepPurpleAccent[700],
                                child: const Icon(
                                  Icons.photo_camera,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                formField(context,
                    controller: nameController,
                    onChanged: (String val){
                  name = val;

                    },
                    submit: (String val){
                      print(nameController.text);
                    },
                    prefix: Icons.person,
                    keyBoard: TextInputType.name,
                    label: "الاسم", validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'الاسم مطلوب';
                  } else {
                    return null;
                  }
                }),
                SizedBox(
                  height: 15,
                ),
                formField(context,
                    controller: emailController,
                    onChanged: ( String val){
                  email = val;
                    },
                    prefix: Icons.email_outlined,
                    keyBoard: TextInputType.emailAddress,
                    label: "الايميل", validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'الايميل مطلوب';
                  } else {
                    return null;
                  }
                }),
                SizedBox(
                  height: 15,
                ),
                formField(context,
                    controller: phoneController,
                    onChanged: (val){
                  phone = val;
                    },
                    prefix: Icons.phone_android_outlined,
                    keyBoard: TextInputType.phone,
                    label: "رقم التليفن", validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'رقم التليفون مطلوب';
                  } else {
                    return null;
                  }
                }),
                const SizedBox(
                  height: 15,
                ),
                formField(context,
                    prefix: Icons.date_range_outlined,
                    keyBoard: TextInputType.datetime,
                    label: "تاريخ الميلاد", validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'تاريخ المتيلاد مطلوب';
                  } else {
                    return null;
                  }
                }),
                SizedBox(
                  height: 30,
                ),
                DefaultButton(
                  text: 'تأكيد البيانات',
                  press: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pickImageCamera() async {
    final picker = ImagePicker();
    final pickFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickFile != null) {
      setState(() {
        imageFile = XFile(pickFile.path);
      });
    }
  }
}
