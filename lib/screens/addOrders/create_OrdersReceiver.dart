import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storedelivery/class/address.dart';
import 'package:storedelivery/class/district.dart';
import 'package:storedelivery/class/orders.dart';
import 'package:storedelivery/class/ward.dart';
import 'package:storedelivery/screens/addOrders/create_OrdersTranferMethod.dart';
import 'package:storedelivery/widget/button.dart';
import 'package:storedelivery/widget/contans.dart';
import 'package:storedelivery/widget/custom_input.dart';

class CreateOrderRecevier extends StatefulWidget {
  //const HomePage({Key key}) : super(key: key);
  @override
  _CreateOrderRecevierState createState() => _CreateOrderRecevierState();
}

class _CreateOrderRecevierState extends State<CreateOrderRecevier> {
  //const CreateOrderRecevier({Key key}) : super(key: key);
  Orders order = Get.find<Orders>();
  District _district = Get.find<District>();
  Ward _ward = Get.find<Ward>();
  Address _address = Get.find<Address>();
  District dropdownValueDistrict;
  Ward dropdownValueWard;
  List<Ward> listWard=[];

  FocusNode receiverName;
  FocusNode receiverPhone;
  FocusNode receiverDictrict;
  FocusNode recieverFullAddress;
  FocusNode recieverNoteAddress;

  @override
  void initState() {
    receiverName = new FocusNode();
    receiverPhone = new FocusNode();
    receiverDictrict = new FocusNode();
    recieverFullAddress = new FocusNode();
    recieverNoteAddress = new FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    receiverName.dispose();
    receiverPhone.dispose();
    receiverDictrict.dispose();
    recieverFullAddress.dispose();
    recieverNoteAddress.dispose();
    super.dispose();
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF5F6FA),
        appBar: AppBar(
          backgroundColor: Color(0xff1EC8C8),
          title: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Center(
                child: const Text("Create Order",
                    style: Contanst.titleAppBar, textAlign: TextAlign.center)),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Information of receiver",
                  style: Contanst.titleInnforOrders,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomInput(
                  title: "Receiver Name",
                  hintText: "HN123",
                  iconImages: "assets/images/nameperson.png",
                  onChange: (value) {
                    order.receiverName = value;
                  },
                  onSubmitted: (value) {
                    receiverPhone.requestFocus();
                  },
                  textInputAction: TextInputAction.next,
                ),
                CustomInput(
                  title: "Receiver Email",
                  hintText: "HN123",
                  iconImages: "assets/images/nameperson.png",
                  onChange: (value) {
                    order.receiverEmail = value;
                    order.isUseCommission=false;
                  },
                  onSubmitted: (value) {
                    receiverPhone.requestFocus();
                  },
                  textInputAction: TextInputAction.next,
                ),
                CustomInput(
                  title: "Receiver Phone Number",
                  hintText: "09090909",
                  iconImages: "assets/images/phonIn.png",
                  onChange: (value) {
                    order.receiverPhone = value;
                  },
                  onSubmitted: (value) {
                    receiverDictrict.requestFocus();
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
                              icon:  const Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
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
                                margin: const EdgeInsets.symmetric(vertical: 12),
                                width: 240,
                                height: 48,
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
                                    style: Contanst.headingText,
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
                                margin: const EdgeInsets.symmetric(vertical: 12),
                                width: 240,
                                height: 48,
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
                                    style: Contanst.headingText,
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
                    _address.fullAddress="NO";
                    order.receiverIDAddress=_address;

                  },
                 focusNode: recieverNoteAddress,
                  textInputAction: TextInputAction.next,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateOrdersTranferMethod()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 40),
                    child: ButtonBtn(
                      title: "Continue",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
