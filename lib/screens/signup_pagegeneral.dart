import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storedelivery/class/store.dart';
import 'package:storedelivery/screens/signup_pageInformationStore.dart';
import 'package:storedelivery/widget/button.dart';
import 'package:storedelivery/widget/contans.dart';
import 'package:storedelivery/widget/custom_input.dart';

class SignUp extends StatefulWidget {
  //const SignUp({Key key}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  Store store = Get.find<Store>();

  FocusNode email;
  FocusNode password;

  @override
  void initState() {
    email = new FocusNode();
    password = new FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6FA),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 100.0,
                ),
                child: Text("Let's Get Start!",style: Contanst.headingTextSignUp,),
              ),
              Text("Sign up and we will continue",style: Contanst.regularTextLandingPage,),
              SizedBox(height: 70,),
              CustomInput(
                title: "E-mail",
                hintText: "mail@gmail.com",
                iconImages: "assets/images/gmailIn.png",
                onChange: (value) {
                  store.email=value;
                },
                onSubmitted: (value) {
                  password.requestFocus();
                },
                textInputAction: TextInputAction.next,
              ),
              CustomInput(
                title: "Password",
                hintText: "*********",
                iconImages: "assets/images/passIn.png",
                onChange: (value) {
                  store.password=value;
                },
                onSubmitted: (value) {
                },
                focusNode: password,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpStoreInformation()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 280,
                      bottom: 40),
                  child: ButtonBtn(
                    title: "Continue",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
