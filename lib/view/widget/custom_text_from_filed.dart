import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFromFiled extends StatelessWidget {
  final String? text;
  final String? hit;
  final Color? color;
  final FormFieldSetter? onSaved;
  final FormFieldValidator? validator;
  final bool ObscureText;

  CustomTextFromFiled(
      {Key? key,
      this.text,
      this.color,
      this.onSaved,
      this.validator,
      this.ObscureText = false,
      this.hit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            fontsize: 18,
            color: Colors.grey[900],
          ),
          TextFormField(
            obscureText: ObscureText,
            validator: validator,
            onSaved: onSaved,
            decoration: InputDecoration(
                hintText: hit,
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.white),
          )
        ],
      ),
    );
  }
}
