import 'package:flutter/material.dart';
import 'package:storedelivery/widget/contans.dart';

class ShowInformation extends StatelessWidget {
  //const ShowInformation({Key key}) : super(key: key);
  final String titleInfor;
  String information;

  ShowInformation ({this.information,this.titleInfor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 0.0),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(titleInfor,style: Contanst.titleInfor,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 6.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(information,style: Contanst.informationText,),
              ),
            ),
            Divider(
              color: Color(0xff808080),
              height: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}
