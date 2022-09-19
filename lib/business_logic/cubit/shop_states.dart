import 'package:salla/data/model/order_model.dart';

import '../../data/model/Country_model.dart';
import '../../data/model/Order.dart';
import '../../data/model/Products_model.dart';
import '../../data/model/info_model.dart';

abstract class ShopStates {}

class ShopInitialStates extends ShopStates {}

class ShopChangeNag extends ShopStates {}

class ShopChangeCurToSud extends ShopStates {}

class ShopChangeCurToUae extends ShopStates {}

class ShopLoadingUploadPassportStates extends ShopStates {}

class ShopLoadedUploadPassportStates extends ShopStates {}

class ShopErrorUploadPassportStates extends ShopStates {}

class ShopLoadingUploadPhotoStates extends ShopStates {}

class ShopLoadedUploadPhotoStates extends ShopStates {}

class ShopLoadedUploadInvoiceStates extends ShopStates {}

class ShopErrorUploadPhotoStates extends ShopStates {}

class ShopLoadingUploadOldVisaStates extends ShopStates {}

class ShopLoadedUploadOldVisaStates extends ShopStates {}

class ShopErrorUploadOldVisaStates extends ShopStates {}

class OnBoardingLoadingStates extends ShopStates {}

class OnBoardingLoadedStates extends ShopStates {
  CountryModel locationModel;

  OnBoardingLoadedStates(this.locationModel);
}

class OnBoardingErrorStates extends ShopStates {
  String error;

  OnBoardingErrorStates(this.error);
}

class OnBoardingPasswordVisibility extends ShopStates {}

class ShopProductLoadingStates extends ShopStates {}

class ShopProductLoadedStates extends ShopStates {
  ProductModel productModel;

  ShopProductLoadedStates(this.productModel);
}

class ShopProductErrorStates extends ShopStates {
  String error;

  ShopProductErrorStates(this.error);
}
class ShopInfoLoadingStates extends ShopStates {}

class ShopInfoLoadedStates extends ShopStates {
  InfoModel infoModel;

  ShopInfoLoadedStates(this.infoModel);
}

class ShopInfoErrorStates extends ShopStates {
  String error;

  ShopInfoErrorStates(this.error);
}

class ShopLoadingUploadFilesStates extends ShopStates {}

class ShopLoadedUploadFilesStates extends ShopStates {
  OrderModel orderModel;

  ShopLoadedUploadFilesStates(this.orderModel);
}

class ShopErrorUploadFilesStates extends ShopStates {
  String error;

  ShopErrorUploadFilesStates(this.error);
}
