import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storedelivery/class/commission.dart';
import 'package:storedelivery/class/deliveryMethod.dart';
import 'package:storedelivery/class/orders.dart';
import 'package:storedelivery/class/staff.dart';
import 'package:storedelivery/class/store.dart';
import 'package:storedelivery/controllers/store_controllers.dart';
import 'package:storedelivery/screens/hom_page.dart';
import 'package:storedelivery/screens/langding_page.dart';
import 'package:storedelivery/screens/loading_page.dart';
import 'package:storedelivery/widget/button.dart';
import 'package:storedelivery/widget/contans.dart';
import 'package:storedelivery/widget/custom_input.dart';

class SignIn extends StatefulWidget {
  //const SignIn({Key? key}) : super(key: key);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  StoreControllers userStore =Get.find<StoreControllers>();
  Commission commission= Get.find<Commission>();
  Orders _orders=Get.find<Orders>();
  DeliveryMethod _deliveryMethod=Get.find<DeliveryMethod>();

  String email;
  String password;

  FocusNode Email;
  FocusNode Password;

  @override
  void initState() {
    Email = new FocusNode();
    Password = new FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    Email.dispose();
    Password.dispose();
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
                  email=value;
                },
                onSubmitted: (value) {
                  Password.requestFocus();
                },
                textInputAction: TextInputAction.next,
              ),
              CustomInput(
                title: "Password",
                hintText: "*********",
                iconImages: "assets/images/passIn.png",
                isPasswordField: true,
                onChange: (value) {
                  password=value;
                },
                onSubmitted: (value) {
                },
                focusNode: Password,
              ),
              GestureDetector(
                onTap: (){
                  showLoadingIndicator(context);
                  commission.getListCommission();
                  _deliveryMethod.getListDeliveryMethod().then((value) =>null);
                  userStore.loginStoreAccount(email, password).then((value) {if(value=="Logged in successfully"){
                  _orders.getListOrders(userStore.storeUser.id).then((value) {Get.offAll(HomePage());});
                  }
                  else {
                    Get.offAll(LandingPage());
                  }
                  });
                },
                child: Container(
                  child: Stack(
                    children: [
                      Visibility(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 265,
                              bottom: 40),
                          child: ButtonBtn(
                            title: "Sign in",
                          ),
                        ),
                      ),
                    ],
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
