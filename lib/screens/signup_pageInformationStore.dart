import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storedelivery/class/address.dart';
import 'package:storedelivery/class/district.dart';
import 'package:storedelivery/class/store.dart';
import 'package:storedelivery/class/ward.dart';
import 'package:storedelivery/screens/signUp_pageBankInformation.dart';
import 'package:storedelivery/widget/button.dart';
import 'package:storedelivery/widget/contans.dart';
import 'package:storedelivery/widget/custom_input.dart';
import 'package:http/http.dart' as http;

class SignUpStoreInformation extends StatefulWidget {
  //const SignUpStoreInformation({Key key}) : super(key: key);

  @override
  _SignUpStoreInformationState createState() => _SignUpStoreInformationState();
}

class _SignUpStoreInformationState extends State<SignUpStoreInformation> {

  Store store =Get.find<Store>();
  District _district = Get.find<District>();
  Ward _ward = Get.find<Ward>();
  Address _address = Get.find<Address>();
  District dropdownValueDistrict;
  Ward dropdownValueWard;
  List<Ward> listWard=[];


  FocusNode nameStore;
  FocusNode phoneNumber;
  FocusNode district;
  FocusNode ward;
  FocusNode street;

  /*List<Bank> listallBank=[];
  Widget _build(){
    _bank.listAllBank.forEach((element) { 
      listallBank.add(Bank(name: element.name,id: element.id));
    });
  }*/

  /*setBankItems(List<Bank> listallBank) {
    List<DropdownMenuItem<String>> bankListDropDown = [];
      for (Bank bank in listallBank){
        setState(() {
          bankListDropDown.add(new DropdownMenuItem(
              value: bank.name,
              child: Text(bank.name,style: Contanst.headingText,),
          )
          );
        });
      }
  }*/


  Future<List<Ward>> _getWardList(String idDistrict) async {
    List<Ward> wardlist=[];
    final String apiUrl = "http://52.142.43.138:3000/districts/$idDistrict/wards";
    await http.get(apiUrl).then((response) {
      var data = jsonDecode(response.body);

      setState(() {
        var data=jsonDecode(response.body);
        print(data[0]);
        for (var _policy in data){
          print(Ward.fromJson(_policy).id);
          wardlist.add(Ward.fromJson(_policy));
        }
        listWard=wardlist;
      });
    });
    return listWard;
  }



  @override
  void initState() {
    nameStore = new FocusNode();
    phoneNumber = new FocusNode();
    district = new FocusNode();
    ward = new FocusNode();
    street = new FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    nameStore.dispose();
    phoneNumber.dispose();
    district.dispose();
    ward.dispose();
    street.dispose();
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
              SizedBox(height: 20,),
              CustomInput(
                title: "Name Store",
                hintText: "Pro Store",
                iconImages: "assets/images/storeIn.png",
                onChange: (value) {
                  store.name=value;
                },
                onSubmitted: (value) {
                  phoneNumber.requestFocus();
                },
                textInputAction: TextInputAction.next,
              ),
              CustomInput(
                title: "Phone Number",
                hintText: "09090909",
                iconImages: "assets/images/phonIn.png",
                onChange: (value) {
                  store.phone=value;
                },
                onSubmitted: (value) {
                  district.requestFocus();
                },
                textInputAction: TextInputAction.next,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 28.0),
                    child: Align(
                      child: Text("District",style: Contanst.titleCustomInput,),
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
                        ]
                    ),
                    child:Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 6),
                      child: Row(
                        children: [
                          Image.asset("assets/images/addressIn.png",width: 40,height: 40,),
                          SizedBox(width: 12,),
                          DropdownButton<District>(
                            value: dropdownValueDistrict,
                            icon: const Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
                            iconSize: 24,
                            elevation: 16,
                            style: Contanst.headingText,
                            underline: Container(
                              margin: const EdgeInsets.only(top: 18),
                              height: 2,
                              color: Colors.transparent,
                            ),
                            onChanged: (District newValue) {
                              setState(() {
                                dropdownValueWard=null;
                                dropdownValueDistrict = newValue;
                               // _ward.getListWard(newValue.id).then((value) => print(_ward.listAllWard.length));
                                _getWardList(newValue.id);
                                _ward.idDistrict=newValue;
                              });
                            },
                            hint: Container(
                              width: 250,
                              height: 48,
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                "District",
                                style: Contanst.hintText,
                              ),
                            ),
                            items: _district.listAllDistrict.map((District district) {
                              return DropdownMenuItem<District>(
                                value: district,
                                child: Text(
                                  district.name,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 28.0),
                    child: Align(
                      child: Text("Ward",style: Contanst.titleCustomInput,),
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
                        ]
                    ),
                    child:Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 6),
                      child: Row(
                        children: [
                          Image.asset("assets/images/addressIn.png",width: 40,height: 40,),
                          SizedBox(width: 12,),
                          DropdownButton<Ward>(
                            value: dropdownValueWard,
                            icon: const Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
                            iconSize: 24,
                            elevation: 16,
                            style: Contanst.headingText,
                            underline: Container(
                              margin: const EdgeInsets.only(top: 18),
                              height: 2,
                              color: Colors.transparent,
                            ),
                            onChanged: (Ward newValue) {
                              setState(() {
                                dropdownValueWard = newValue;
                                _address.idWard=newValue;
                              });
                            },
                            hint: Container(
                              width: 250,
                              height: 48,
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                "Ward",
                                style: Contanst.hintText,
                              ),
                            ),
                            items: listWard.map((Ward ward) {
                              return DropdownMenuItem<Ward>(
                                value: ward,
                                child: Text(
                                  ward.name,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),

                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CustomInput(
                title: "Note Address",
                hintText: "Note Address",
                iconImages: "assets/images/addressIn.png",
                onChange: (value) {
                  _address.noteAddress=value;
                  _address.fullAddress="None";
                  store.idAddress=_address;
                },
                onSubmitted: (value) {
                  street.requestFocus();
                },
                textInputAction: TextInputAction.next,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StoreBankInformation()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 60,
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

