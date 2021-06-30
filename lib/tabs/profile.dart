import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storedelivery/class/district.dart';
import 'package:storedelivery/controllers/store_controllers.dart';
import 'package:storedelivery/screens/editProfile.dart';
import 'package:storedelivery/screens/loading_page.dart';
import 'package:storedelivery/widget/contans.dart';
import 'package:storedelivery/widget/showInformation.dart';

class Profile extends StatelessWidget {
  StoreControllers userStore = Get.find<StoreControllers>();
  District _district = Get.find<District>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6FA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180.0),
        child: AppBar(
          backgroundColor: Color(0xff1EC8C8),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Column(
              children: [
                Center(child: const Text("Profile",style: Contanst.titleAppBar,)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 24.0
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius:45.0,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(100.0),
                          child: Image.asset(
                            "assets/images/meowga.png",
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(child: Text ("Hello",style: Contanst.titleAppBar,)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 30.0,
                              ),
                              child: Text(userStore.storeUser.name,style: Contanst.inbuttonTextFB,),
                            ),
                          ],
                        ),
                      GestureDetector(
                        onTap: (){
                          _district.getListDistrict().then((value) => {print("success"),
                            Get.to(EditProfile()),
                          });

                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 35.0,
                          ),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white,
                                width: 1
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(200),
                            ),
                          ),
                          child: Image.asset("assets/images/pencil.png",
                            scale: 1.7,
                          ),
                        ),
                      )
                    ],
                  ),
                )
                ],
            ),
          ),
          automaticallyImplyLeading: false,
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
                    ShowInformation(
                      titleInfor: "Name Store",
                      information: userStore.storeUser.name,
                    ),
                    SizedBox(height: 15,),
                    ShowInformation(
                      titleInfor: "Email",
                      information: userStore.storeUser.email,
                    ),
                    SizedBox(height: 15,),
                    ShowInformation(
                      titleInfor: "Phone",
                      information: userStore.storeUser.phone,
                    ),
                    SizedBox(height: 15,),
                    ShowInformation(
                      titleInfor: "Password",
                      information: userStore.storeUser.password,
                    ),
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
                    ShowInformation(
                      titleInfor: "Dictrict",
                      information:userStore.storeUser.idAddress.idWard.idDistrict.name,
                    ),
                    SizedBox(height: 15,),
                    ShowInformation(
                      titleInfor: "Ward",
                      information: userStore.storeUser.idAddress.idWard.name,
                    ),
                    SizedBox(height: 15,),
                    ShowInformation(
                      titleInfor: "Full Address",
                      information: userStore.storeUser.idAddress.fullAddress,
                    ),
                    ShowInformation(
                      titleInfor: "Note Address",
                      information: userStore.storeUser.idAddress.noteAddress,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0,),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: [
                      Image.asset("assets/images/logoutStore.png",height: 35,width: 35,),
                      Text("Log Out",
                        style: TextStyle(
                          color: Color(0xffF40057),
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                          decoration: TextDecoration.none,
                          fontStyle: FontStyle.normal,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40,)

            ],
          ),
        ),
      ),
    );
  }
}
