import 'package:bike_buy_sell_2/common/theme_helper.dart';
import 'package:bike_buy_sell_2/controller/auth_controller.dart';
import 'package:bike_buy_sell_2/controller/widgets/login_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
   final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                  child: Column(
                    children: [
                      Text(
                        'Hello',
                        style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Signin into your account',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextField(
                                  controller: emailController,
                                  decoration: ThemeHelper().textInputDecoration('User Name', 'Enter your user name'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration('Password', 'Enter your password'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                margin: EdgeInsets.fromLTRB(10,0,10,20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
                                  },
                                  child: Text( "Forgot your password?", style: TextStyle( color: Colors.grey, ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text('Sign In'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                  ),
                                  onPressed: (){
                                    AuthController.instance.register(emailController.text.trim(),passwordController.text.trim());
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10,20,10,20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(
                                    TextSpan(
                                        children: [
                                          TextSpan(text: "Don\'t have an account? "),
                                          TextSpan(
                                            text: 'Create',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = (){
                                                // Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                              },
                                            style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                                          ),
                                        ]
                                    )
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );

  }
}