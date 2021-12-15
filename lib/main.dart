import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/BlocObserver.dart';
import 'package:socialapp/modules/login_screen/login_screen.dart';
import 'package:socialapp/modules/social_layout/social_layout.dart';
import 'package:socialapp/shared/network/local/cache_helper.dart';
import 'package:socialapp/shared/style/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();

  Bloc.observer = MyBlocObserver();
  Widget widget;
  var uid = CacheHelper.getData(key: 'uId');
  if (uid != null){
    widget = SocialLayout();
  }
  else{
    widget = LoginScreen();
  }
  runApp(MyApp(
      startWidget : widget,
  ));
}

class MyApp extends StatelessWidget {
  final  Widget startWidget;
  MyApp({this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: startWidget,
    theme:ThemeData(
    primarySwatch: defaultColor,
    appBarTheme: AppBarTheme(
    elevation: 0,
    color: Colors.white,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    ),
    ),
    )
    );
  }
}


