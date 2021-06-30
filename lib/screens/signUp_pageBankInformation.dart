import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storedelivery/class/bank.dart';
import 'package:storedelivery/class/store.dart';
import 'package:storedelivery/screens/langding_page.dart';
import 'package:storedelivery/widget/button.dart';
import 'package:storedelivery/widget/contans.dart';
import 'package:storedelivery/widget/custom_input.dart';

class StoreBankInformation extends StatefulWidget {
  //const StoreBankInformation({Key key}) : super(key: key);

  @override
  _StoreBankInformationState createState() => _StoreBankInformationState();
}

class _StoreBankInformationState extends State<StoreBankInformation> {
  Bank _bank = Get.find<Bank>();
  Bank dropdownValue;
  Store store = Get.find<Store>();

  FocusNode bankAccountName;
  FocusNode accountNumber;
  FocusNode bankName;
  FocusNode branchBank;

  @override
  void initState() {
    bankAccountName = new FocusNode();
    accountNumber = new FocusNode();
    bankName = new FocusNode();
    branchBank = new FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    bankAccountName.dispose();
    accountNumber.dispose();
    bankName.dispose();
    branchBank.dispose();
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
                child: Text(
                  "Let's Get Start!",
                  style: Contanst.headingTextSignUp,
                ),
              ),
              Text(
                "Sign up and we will continue",
                style: Contanst.regularTextLandingPage,
              ),
              SizedBox(
                height: 20,
              ),
              CustomInput(
                title: "Bank Account Name",
                hintText: "HN123",
                iconImages: "assets/images/bankIn.png",
                onChange: (value) {
                  store.accountName=value;
                },
                onSubmitted: (value) {
                  accountNumber.requestFocus();
                },
                textInputAction: TextInputAction.next,
              ),
              CustomInput(
                title: "Bank Account Number",
                hintText: "09090909",
                iconImages: "assets/images/bankIn.png",
                onChange: (value) {
                  store.accountNumber = value;
                },
                onSubmitted: (value) {
                  bankName.requestFocus();
                },
                textInputAction: TextInputAction.next,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 28.0),
                    child: Align(
                      child: Text(
                        "Bank Name",
                        style: Contanst.titleCustomInput,
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(1),
                            blurRadius: 7,
                            offset: Offset(0, 7),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 6),
                      child: Row(children: [
                        Image.asset("assets/images/addressIn.png",width: 40,height: 40,),
                        SizedBox(
                          width: 12,
                        ),
                        DropdownButton<Bank>(
                          value: dropdownValue,
                          icon: const Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
                          iconSize: 24,
                          elevation: 16,
                          style: Contanst.headingText,
                          underline: Container(
                            margin: const EdgeInsets.only(top: 18),
                            height: 2,
                            color: Colors.transparent,
                          ),
                          onChanged: (Bank newValue) {
                            setState(() {
                              dropdownValue = newValue;
                              store.idBank = newValue;
                            });
                          },
                          hint: Container(
                            width: 250,
                            height: 48,
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              "Bank Name",
                              style: Contanst.hintText,
                            ),
                          ),
                          items: _bank.listAllBank.map((Bank bank) {
                            return DropdownMenuItem<Bank>(
                              value: bank,
                              child: Container(
                                width: 250,
                                child: Text(
                                  bank.name,
                                  style: Contanst.headingText,
                                  maxLines: 100,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
              CustomInput(
                title: "BranchBank",
                hintText: "HCM",
                iconImages: "assets/images/bankIn.png",
                onChange: (value) {
                  store.branchBank = value;
                },
                onSubmitted: (value) {},
                focusNode: branchBank,
              ),
              GestureDetector(
                onTap: () {
                  if (store.email != null &&
                      store.password != null &&
                      store.accountNumber != null &&
                      store.branchBank != null &&
                      store.name != null &&
                      store.phone != null) {
                    store.createStore(store/*store.email,store.password,store.name,store.phone,store.accountNumber,store.accountName,store.idBank.id,store.branchBank,store.idAddress*/);
                    print(store.idAddress);
                    _bank.listNameAllBank.clear();
                    Get.offAll(LandingPage());
                  } else {
                    print("null cmnr");
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 130, bottom: 40),
                  child: ButtonBtn(
                    title: "Create",
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
