import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storedelivery/class/district.dart';
import 'package:storedelivery/class/ward.dart';
import 'package:storedelivery/controllers/store_controllers.dart';
import 'package:storedelivery/screens/hom_page.dart';
import 'package:storedelivery/tabs/profile.dart';
import 'package:storedelivery/widget/contans.dart';
import 'package:storedelivery/widget/editInfo.dart';

class EditProfile extends StatefulWidget {
  //const EditProfile({Key key}) : super(key: key);
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  StoreControllers userStore= Get.find<StoreControllers>();
  District _district = Get.find<District>();
  Ward _ward = Get.find<Ward>();
  District dropdownValueDistrict;
  Ward dropdownValueWard;
  List<Ward> listWard=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<List<Ward>> _getWardList(String idDistrict) async {
    List<Ward> wardlist=[];
    wardlist.clear();
    final String apiUrl = "http://52.142.43.138:3000/districts/$idDistrict/wards";
    await http.get(apiUrl).then((response) {
      setState(() {
        print(listWard.length);
        var data=jsonDecode(response.body);
        //print(data);
        for (var _policy in data){
          //print(Ward.fromJson(_policy).id);
          //print("dyyyyy");
          wardlist.add(Ward.fromJson(_policy));
        }
        //print("aaaaaaaaaaaaaaaaa");
        listWard=wardlist;
      });
    });
    return listWard;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6FA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(230.0),
        child: AppBar(
          backgroundColor: Color(0xff1EC8C8),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Column(
              children: [
                Center(child: const Text("Edit Profile",style: Contanst.titleAppBar,)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 24.0
                  ),
                  child: CircleAvatar(
                    radius:70.0,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(100.0),
                      child: Image.asset(
                        "assets/images/meowga.png",
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: [
            Container(
              child:Row(
                children:[
                Padding(
                  padding: const EdgeInsets.only(top: 0.0,),
                  child: Text("Save",style: Contanst.inbuttonTextFB,),
                ),
                IconButton(
                    icon: Icon(Icons.save),
                    tooltip: "Save",
                    onPressed:(){
                      userStore.updateStore(userStore.storeUser.id).then((value) {if(value=="Update successfully")
                      {
                        Get.off(HomePage());
                      }
                      });
                    } )
              ],
            )
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
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
                    EditInfo(titleInfor: "Name",
                      infomation:userStore.storeUser.name,
                      onChange: (value){
                      userStore.storeUser.name=value;
                      },
                    ),
                    EditInfo(titleInfor: "Email",
                      infomation:userStore.storeUser.email,
                      onChange: (value){
                        userStore.storeUser.email=value;
                      },
                    ),
                    EditInfo(titleInfor: "Phone",
                      infomation:userStore.storeUser.phone,
                      onChange: (value){
                        userStore.storeUser.phone=value;
                      },
                    ),
                    EditInfo(titleInfor: "Name",
                      infomation:userStore.storeUser.password,
                      onChange: (value){
                        userStore.storeUser.password=value;
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
                    "Information addresss",
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 24.0),
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
                              key: UniqueKey(),
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
                                  //listWard.clear();
                                  //_getWardList(newValue.id).hashCode;
                                  _ward.listAllWard.clear();
                                  dropdownValueWard=null;
                                  dropdownValueDistrict = newValue;
                                  // _ward.getListWard(newValue.id).then((value) => print(_ward.listAllWard.length));
                                  _getWardList(newValue.id);
                                  _ward.idDistrict=newValue;
                                });
                              },
                              hint: Container(
                                width: 287,
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
                                  value: dropdownValueWard ,//== null ? dropdownValueWard : userStore.storeUser.idAddress.idWard,
                                  key: UniqueKey(),
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
                                      userStore.storeUser.idAddress.idWard=newValue;
                                      //print(userStore.storeUser.idAddress.id);
                                      //print(userStore.storeUser.idAddress.noteAddress);
                                      //print(userStore.storeUser.idAddress.idWard.name);
                                      //_address.idWard=newValue;
                                    });
                                  },
                                  hint: Container(
                                    width: 290,
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
                    EditInfo(
                      titleInfor: "Note Address",
                      infomation:userStore.storeUser.idAddress.noteAddress,
                      onChange: (value){
                        userStore.storeUser.idAddress.noteAddress=value;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0,)


            ],
          ),
        ),
      ),
    );
  }
}
