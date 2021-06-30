import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storedelivery/class/district.dart';
import 'package:storedelivery/class/orders.dart';
import 'package:storedelivery/class/ward.dart';
import 'package:storedelivery/controllers/store_controllers.dart';
import 'package:storedelivery/screens/hom_page.dart';
import 'package:storedelivery/widget/button.dart';
import 'package:storedelivery/widget/contans.dart';
import 'package:storedelivery/widget/editInfo.dart';

class EditOrder extends StatefulWidget {
  final Orders order;

  EditOrder({this.order});

  @override
  _EditOrderState createState() => _EditOrderState();
}

class _EditOrderState extends State<EditOrder> {
  StoreControllers userStore =Get.find<StoreControllers>();
  District _district = Get.find<District>();
  Orders _orders=Get.find<Orders>();
  Ward _ward = Get.find<Ward>();

  District dropdownValueDistrict;

  Ward dropdownValueWard;

  List<Ward> listWard=[];

  Future<List<Ward>> _getWardList(String idDistrict) async {
    List<Ward> wardlist=[];
    final String apiUrl = "http://52.142.43.138:3000/districts/$idDistrict/wards";
    await http.get(apiUrl).then((response) {
      setState(() {
        var data=jsonDecode(response.body);
        //print(data);
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
              child: const Text("Edit Order",
                  style: Contanst.titleAppBar, textAlign: TextAlign.center)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 24.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "General",
                    style: Contanst.titleInforProfile,
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    EditInfo(titleInfor: "Name Order",
                      infomation:widget.order.orderName,
                      onChange: (value){
                        widget.order.orderName=value;
                      },
                    ),
                    EditInfo(titleInfor: "Weight",
                      infomation:widget.order.totalWeight,
                      onChange: (value){
                        widget.order.totalWeight=value;
                      },
                    ),
                    EditInfo(titleInfor: "Money",
                      infomation:widget.order.orderMoney,
                      onChange: (value){
                        widget.order.orderMoney=value;
                      },
                    ),
                    EditInfo(titleInfor: "Note",
                      infomation:widget.order.note,
                      onChange: (value){
                        widget.order.note=value;
                      },
                    ),
                    SizedBox(height: 12,),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "Information Receiver",
                    style: Contanst.titleInforProfile,
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Column(
                      children: [
                        EditInfo(titleInfor: "Receiver Name",
                          infomation:widget.order.receiverName,
                          onChange: (value){
                            widget.order.receiverName=value;
                          },
                        ),
                        EditInfo(titleInfor: "Receiver Email",
                          infomation:widget.order.receiverEmail,
                          onChange: (value){
                            widget.order.receiverEmail=value;
                          },
                        ),
                        EditInfo(titleInfor: "Receiver Phone",
                          infomation:widget.order.receiverPhone,
                          onChange: (value){
                            widget.order.receiverPhone=value;
                          },
                        ),
                        EditInfo(titleInfor: "Note",
                          infomation:widget.order.note,
                          onChange: (value){
                            widget.order.note=value;
                          },
                        ),
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
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
                                    child:Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 6),
                                      child: DropdownButton<District>(
                                        value: dropdownValueDistrict,
                                        icon: const Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
                                        iconSize: 24,
                                        elevation: 16,
                                        style: Contanst.headingText,
                                        underline: Container(
                                          margin: const EdgeInsets.only(top: 18),
                                          height: 2,
                                          color: Colors.grey,
                                        ),
                                        onChanged: (District newValue) {
                                          setState(() {
                                            dropdownValueWard=null;
                                            dropdownValueDistrict = newValue;
                                            _getWardList(newValue.id).then((value) {print("done"); print(listWard.length);
                                            });
                                            _ward.idDistrict=newValue;
                                          });
                                        },
                                        hint: Container(
                                          width: 280,
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
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 24.0),
                                    child: Align(
                                      child: Text("Ward",style: Contanst.titleCustomInput,),
                                      alignment: Alignment.topLeft,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 18),
                                    child:Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 6),
                                      child: DropdownButton<Ward>(
                                        value: dropdownValueWard,
                                        icon: const Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
                                        iconSize: 24,
                                        elevation: 16,
                                        style: Contanst.headingText,
                                        underline: Container(
                                          margin: const EdgeInsets.only(top: 18),
                                          height: 2,
                                          color: Colors.grey,
                                        ),
                                        onChanged: (Ward newValue) {
                                          setState(() {
                                            dropdownValueWard = newValue;
                                            widget.order.receiverIDAddress.idWard.id=newValue.id;
                                          });
                                        },
                                        hint: Container(
                                          width: 280,
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
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0,),
              GestureDetector(
                onTap: (){
                  //print(widget.order.receiverIDAddress.fullAddress);
                 // print(widget.order.receiverIDAddress.noteAddress);
                  //print(widget.order.receiverIDAddress.idWard.name);
                 // print(widget.order.receiverIDAddress.idWard.idDistrict.name);
                    widget.order.updateOrder(widget.order, widget.order.id).then((value)
                    {
                    _orders.getListOrders(userStore.storeUser.id).then((value) {Get.offAll(HomePage());});

                    });
                },
                  child: ButtonBtn(title: "Update",)),
            ],
          ),
        ),
      ),
    );
  }
}
