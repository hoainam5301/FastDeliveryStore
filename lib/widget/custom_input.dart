import 'package:flutter/material.dart';
import 'package:storedelivery/widget/contans.dart';

class CustomInput extends StatelessWidget {
  //const CustomInput({Key key}) : super(key: key);
  final String title;
  final String hintText;
  final Function(String) onChange;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final bool isPasswordField;
  final String iconImages;
  final bool isAddress;

  CustomInput({this.isAddress,this.title,this.hintText,this.onChange,this.onSubmitted,this.focusNode,this.textInputAction,this.isPasswordField,this.iconImages});


  @override
  Widget build(BuildContext context) {
    bool _isPasswordField = isPasswordField ?? false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 6.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 5.0),
              child: Align(
                child: Text(title,style: Contanst.titleCustomInput,),
                alignment: Alignment.topLeft,
              ),
            ),
            Container(
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
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 6.0),
                child:
                    TextField(
                      obscureText: _isPasswordField,
                      focusNode: focusNode,
                      onChanged: onChange,
                      onSubmitted: onSubmitted,
                      textInputAction: textInputAction,
                      style: Contanst.headingText,
                      readOnly: isAddress==true ? true : false,
                      decoration: InputDecoration(
                          icon: Image.asset(iconImages,width: 40,height: 40,),
                          border:InputBorder.none,
                          hintText: hintText ?? "Hint Text",
                          hintStyle:Contanst.hintText,
                          suffixIcon: isAddress == true ? Icon(
                            Icons.arrow_drop_down_sharp
                          ) : null
                      ),
                    ),
                ),
              ),
          ],
        ),
    );
  }
}
