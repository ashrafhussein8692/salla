
import '../../../data/model/UserLogin.dart';

abstract class LoginStates{}
class LoginInitialStates extends LoginStates{}
class LoginLoadingStates extends LoginStates{
}
class LoginLoadedStates extends LoginStates{
  UserModel userModel;

  LoginLoadedStates(this.userModel);
}
class LoginErrorStates extends LoginStates{
 final String error;

  LoginErrorStates(this.error);
}class LoginPasswordVisibility extends LoginStates{

}
class LoginWithOtpLoadingStates extends LoginStates{}

class LoginWithOtpLoadedStates extends LoginStates{
  UserModel optLogin;

  LoginWithOtpLoadedStates(this.optLogin);
}
class LoginWithOtpErrorStates extends LoginStates {
  String error;

  LoginWithOtpErrorStates(this.error);
}

class CodeVerificationLoadingStates extends LoginStates{}

class CodeVerificationLoadedStates extends LoginStates{
  UserModel codeVerification;

  CodeVerificationLoadedStates(this.codeVerification);
}
class CodeVerificationErrorStates extends LoginStates {
  String error;

  CodeVerificationErrorStates(this.error);
}
class RegisterInitialStates extends LoginStates{}
class RegisterLoadingStates extends LoginStates{
}
class RegisterLoadedStates extends LoginStates{
  UserModel userModel;

  RegisterLoadedStates(this.userModel);
}
class RegisterErrorStates extends LoginStates{
  String error;

  RegisterErrorStates(this.error);
}class RegisterPasswordVisibility extends LoginStates{

}