import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_login_app_module/screens/forgot_password_screen.dart';
import 'package:flutter_login_app_module/screens/signup_screen.dart';
import 'package:flutter_login_app_module/utils/app_config.dart';
import 'package:flutter_login_app_module/utils/app_text_styles.dart';
import 'package:flutter_login_app_module/utils/reusable_widgets.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  bool isEmailErrorVisible = false;
  bool isPasswordErrorVisible = false;
  late AppConfig appC;
  @override
  Widget build(BuildContext context) {
    appC = AppConfig(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formGlobalKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: appC.rH(26),
                    width: appC.rW(60),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/header.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  buildSizedBoxWidget(10),
                  Align(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Login",
                        style: AppTextStyles.blackTextStyle,
                        textAlign: TextAlign.left,
                      )),
                  //buildSizedBoxWidget(13),
                  buildSizedBoxWidget(15),
                  buildEmailTextField(),
                  buildSizedBoxWidget(20),
                  buildPasswordTextField(),
                  buildSizedBoxWidget(15),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgotPasswordScreen()));
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                        child: Text(
                          "Forgot Password?",
                          style: AppTextStyles.boldColoredTextStyle,
                        ),
                      ),
                    ),
                  ),
                  buildSizedBoxWidget(15),
                  buildButtonWidget(context, "Login", () {
                    if (formGlobalKey.currentState!.validate()) {
                      if (_emailController.text.toString().trim().length != 0 &&
                          _passwordController.text.toString().trim().length !=
                              0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }
                    }
                  }),
                  _buildSignInWithText(),
                  buildGoogleButtonWidget(context, "Login with Google", () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }),
                  navigationTextWidget(
                      context, "New to Logistics?", SignupScreen(), "Register"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Row(children: <Widget>[
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: const Divider(
                  color: Colors.grey,
                  height: 20,
                )),
          ),
          const Text("OR", style: AppTextStyles.lightTextStyle),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: const Divider(
                  color: Colors.grey,
                  height: 20,
                )),
          ),
        ]),
        // const SizedBox(height: 20.0),
        // const Text(
        //   'Continue with Social Media',
        //   style: AppTextStyles.lightTextStyle,
        // ),
        //_buildSocialBtnRow(),
        _buildSignupBtn(),
      ],
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () {
              // Provider.of<FacebookSignInProvider>(context, listen: false)
              //     .login()
              //     .then((value) {
              //   if (value != null) {
              //     StoreDetails.createLinkedInLoginSession();
              //     Navigator.pushAndRemoveUntil(
              //       context,
              //       MaterialPageRoute(builder: (context) => const HomeScreen()),
              //           (route) => false,
              //     );
              //   }
              // });
            },
            const AssetImage(
              'assets/images/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
            () async {
              //           User? user =
              //               await Authentication.signInWithGoogle(context: context);
              //
              // if (user != null) {
              // print("user is $user");}

              // Provider.of<GoogleSignInProvider>(context, listen: false)
              //     .login()
              //     .then((value) {
              //   print("value is $value");
              //   if (value != null) {
              //     EasyLoading.showSuccess('Logged in Successfully...');
              //     EasyLoading.dismiss();
              //     Navigator.pushAndRemoveUntil(
              //       context,
              //       MaterialPageRoute(builder: (context) => const HomeScreen()),
              //           (route) => false,
              //     );
              //   }
              // });
            },
            const AssetImage(
              'assets/images/google.png',
            ),
          ),
          _buildSocialBtn(
            () {
              print('Login with LinkedIn');
            },
            const AssetImage(
              'assets/images/linkedIn.png',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 45.0,
        width: 45.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => print('Sign Up Button Pressed'),
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEmailTextField() {
    return Row(
      children: [
        Icon(
          Icons.alternate_email,
          color: Colors.grey,
        ),
        SizedBox(
          width: 3,
        ),
        Expanded(
          child: TextFormField(
            controller: _emailController,
            cursorColor: Colors.black,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black.withOpacity(0.9)),
            decoration: InputDecoration(
              labelText: "Email ID",
              labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
              contentPadding: EdgeInsets.fromLTRB(0,0,0,4),
              isDense: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: Colors.grey.withOpacity(0.3),
            ),
          ),
        )
      ],
    );
  }

  Widget buildPasswordTextField() {
    return Row(
      children: [
        Icon(
          Icons.lock_outline,
          color: Colors.grey,
        ),
        SizedBox(
          width: 3,
        ),
        Expanded(
          child: TextFormField(
            controller: _passwordController,
            cursorColor: Colors.black,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black.withOpacity(0.9)),
            decoration: InputDecoration(
              labelText: "Password",
              contentPadding: EdgeInsets.fromLTRB(0,0,0,4),
              isDense: true,
              labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
              //filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: Colors.grey.withOpacity(0.3),
            ),
          ),
        )
      ],
    );
  }
}
