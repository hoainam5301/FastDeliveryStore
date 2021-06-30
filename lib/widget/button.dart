import 'package:flutter/material.dart';
import 'package:storedelivery/widget/contans.dart';

class ButtonBtn extends StatelessWidget {
  //const ButtonBtn({Key key}) : super(key: key);
  final String title;
  ButtonBtn({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0,
          horizontal: 24.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff1EC8C8),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              blurRadius: 7,
              offset: Offset(0, 7), // changes position of shadow
            ),
          ],
        ),
        child:
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0,
                    horizontal: 45),
                child: Text(title,
                  style: Contanst.inbuttonTextFB,),
              ),
            ),
      ),
    );
  }
}
