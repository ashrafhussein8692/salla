import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salla/business_logic/cubit/shop_states.dart';
import 'package:salla/data/model/info_model.dart';
import 'package:salla/data/model/order_model.dart';

import '../../data/model/Country_model.dart';
import '../../data/model/Order.dart';
import '../../data/model/Products_model.dart';
import '../../data/model/UserLogin.dart';
import '../../data/repository.dart';
import '../../presentation/account/account_screen.dart';
import '../../presentation/home/home_screen.dart';
import '../../presentation/my_orders/orders_screen.dart';
import '../../presentation/search/search_screen.dart';
import '../../presentation/wallet/info_screen.dart';


class ShopCubit extends Cubit<ShopStates> {
  Repository repository;

  ShopCubit(this.repository) : super(ShopInitialStates());

  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  bool sudValue = true;
  bool uaeValue = false;

  void changeCurrencyToSud(bool value) {
    sudValue = value;
    sudValue = true;
    uaeValue = false;

    emit(ShopChangeCurToUae());
  }

  void changeCurrencyToUae(bool value) {
    uaeValue = value;
    uaeValue = true;
    sudValue = false;

    emit(ShopChangeCurToUae());
  }

  List<Widget> bottomScreens = [
     HomeScreen(),
    const SearchScreen(),
    MyOrdersScreen(),

    InfoScreen(),
     MyAccountScreen(),
  ];
  CountryModel? locationModel;

  void getLocation() {
    emit(OnBoardingLoadingStates());
    repository.getLocation().then((value) {
      locationModel = CountryModel.fromJson(value.data);
      print(value.data);
      emit(OnBoardingLoadedStates(locationModel!));
    }).catchError((error) {
      print(error.toString());
      emit(OnBoardingErrorStates(error.toString()));
    });
  }

  ProductModel? productModel;

  void getProduct() {
    emit(ShopProductLoadingStates());
    repository.getProduct().then((value) {
      productModel = ProductModel.fromJson(value.data);
      // print(value.data);
      emit(ShopProductLoadedStates(productModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopProductErrorStates(error.toString()));
    });
  }
  InfoModel? infoModel;
  void getInfo() {
    emit(ShopInfoLoadingStates());
    repository.getInfo().then((value) {
      infoModel = InfoModel.fromJson(value.data);
      // print(value.data);
      emit(ShopInfoLoadedStates(infoModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopInfoErrorStates(error.toString()));
    });
  }

  void changeNav(int index) {
    currentIndex = index;
    if(index == 3){
      getInfo();
    }
    emit(ShopChangeNag());
  }

  final _picker = ImagePicker();
  File? passport;
  File? photo;
  File? invoice;
  File? oldVisa;

  Future<void> pickPassport() async {
    final pickFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickFile != null) {
      passport = File(pickFile.path);
      emit(ShopLoadedUploadPassportStates());
    }
  }

  Future<void> pickPhoto() async {
    final pickFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickFile != null) {
      photo = File(pickFile.path);
      emit(ShopLoadedUploadPhotoStates());
    }
  }

  Future<void> pickInvoice() async {
    final pickFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickFile != null) {
      invoice = File(pickFile.path);
      emit(ShopLoadedUploadInvoiceStates());
    }
  }

  Future<void> pickOldVisa() async {
    final pickFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickFile != null) {
      oldVisa = File(pickFile.path);
      emit(ShopLoadedUploadOldVisaStates());
    }
  }

  OrderModel? orderModel;

  void uploadNewVisaFiles(
    String visaId,
    String fileNo,
    File passport,
    File photo,
    File invoice,
  ) {
    emit(ShopLoadingUploadFilesStates());
    repository
        .uploadNewVisaFiles(visaId, passport, photo, invoice, fileNo)
        .then((value) {
      print("success");
      orderModel = OrderModel.fromJson(value.data);
      print(value.data);
      emit(ShopLoadedUploadFilesStates(orderModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUploadFilesStates(error.toString()));
    });
  }

  void uploadExtendVisaFiles(
    String visaId,
    String fileNo,
    File passport,
    File photo,
    File invoice,
    File oldVisa,
  ) {
    emit(ShopLoadingUploadFilesStates());
    repository
        .uploadExtendVisaFiles(
            visaId, passport, photo, invoice, oldVisa, fileNo)
        .then((value) {
      print("success");
      orderModel = OrderModel.fromJson(value.data);
      print(value.data);
      emit(ShopLoadedUploadFilesStates(orderModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUploadFilesStates(error.toString()));
    });
  }
}
