import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla/business_logic/cubit/shop_cubit.dart';
import 'package:salla/common/login/login_cubit/login_cubit.dart';
import 'package:salla/common/register/register_cubit/register_cubit.dart';
import 'package:salla/data/local/shared_preference.dart';
import 'package:salla/data/remote/dio_helper.dart';
import 'package:salla/data/repository.dart';
import 'package:salla/presentation/shop_layout/lay_out.dart';
import 'package:salla/shared/constants.dart';
import 'common/on_boarding/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  Widget? widget;
  dynamic onBoarding = CacheHelper.getData(key: 'onBoarding');
  print(onBoarding);
  token = CacheHelper.getData(key: 'token');

  if (onBoarding != null) {
    if (token != null) {
      widget = ShopLayOut();
    } else {
      widget = OnBoardingScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }
  print("token =>>>>>>>>>>>>>>  $token");
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp(this.startWidget);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create:(context) => RegisterCubit(Repository())
          )  ,
        BlocProvider(create:(context) =>LoginCubit(Repository())
           ),
        BlocProvider(create:(context) => ShopCubit(Repository())
          ..getLocation()
          )

      ],
      child: MaterialApp(
          builder: (BuildContext context, Widget? child) {
            return  Directionality(
              textDirection: TextDirection.rtl,
              child:  Builder(
                builder: (BuildContext context) {
                  return  MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaleFactor: 1.0,
                    ),
                    child: child!,
                  );
                },
              ),
            );
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    systemStatusBarContrastEnforced: true,
                    statusBarColor: Colors.deepPurpleAccent[700],
                    statusBarBrightness: Brightness.light,
                    statusBarIconBrightness: Brightness.light,
                  ),
                  elevation: 0,
                  backgroundColor: Colors.white,
                  titleTextStyle: const TextStyle(
                      fontSize: 15, color: Colors.black, fontFamily: 'Cairo'),
                  iconTheme: IconThemeData(
                      color: Colors.deepPurpleAccent[700], size: 30)),
              scaffoldBackgroundColor: Colors.white,
              fontFamily: 'Cairo'),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: startWidget,
          )),
    );
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}
