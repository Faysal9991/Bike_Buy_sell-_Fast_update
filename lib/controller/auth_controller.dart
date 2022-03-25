
import 'package:bike_buy_sell_2/home_page.dart';
import 'package:bike_buy_sell_2/login_screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  //AuthController.instance...
   static AuthController instance = Get.find();
   late Rx<User?> _user;
  //name,email,password
   FirebaseAuth auth = FirebaseAuth.instance;
@override
  void onReady() {
    super.onReady();
    _user= Rx<User?>(auth.currentUser);
    // our user would be notified for bindstrem. login.logout
    _user.bindStream(auth.userChanges());
    ever(_user, initialScreen);
  }
  initialScreen(User? user) {
    if (user == null) {
      print("login page");
      Get.offAll(() => LoginPage());
    }
    else {
      Get.offAll(() => HomePage());
    }
  }
  void register(String email,password)async
  {
    try{
     await auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
Get.snackbar("about user", "user massage",
backgroundColor: Colors.redAccent,
snackPosition: SnackPosition.BOTTOM,
  titleText: Text("Account Crearion Failed",
  style: TextStyle(color: Colors.red),),
    messageText: Text
      (e.toString(),
      style: TextStyle(
          color: Colors.white),)
       );
    }
  }
 }
