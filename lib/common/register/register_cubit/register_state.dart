

import '../../../data/model/UserLogin.dart';

abstract class RegisterStates{}
class RegisterInitialStates extends RegisterStates{}
class RegisterLoadingStates extends RegisterStates{
}
class RegisterLoadedStates extends RegisterStates{
  UserModel userModel;

  RegisterLoadedStates(this.userModel);
}
class RegisterErrorStates extends RegisterStates{
  String error;

  RegisterErrorStates(this.error);
}class RegisterPasswordVisibility extends RegisterStates{

}