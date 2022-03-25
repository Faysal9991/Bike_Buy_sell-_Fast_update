
import 'package:bike_buy_sell_2/controller/auth_controller.dart';
import 'package:bike_buy_sell_2/login_screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';



void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => AuthController());
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Color _primaryColor = Colors.deepOrange;
    Color _secondaryHeaderColor = Colors.green;

    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: _primaryColor,
        secondaryHeaderColor: _secondaryHeaderColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home:  LoginPage(),
    );
  }
}

