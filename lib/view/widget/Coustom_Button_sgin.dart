import 'package:ecommerceend/constance.dart';
import 'package:flutter/material.dart';

class CoustomButtonSgin extends StatelessWidget {
  final String? text;
  final Alignment? alignment;
  final Color? color;
  final double? fontsize;
  final VoidCallback? onPressed;

  const CoustomButtonSgin({
    Key? key,
    this.text='Write text',
    this.alignment,
    this.color=primaryColor,
    this.fontsize, this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:onPressed,
      child: Container(
        alignment: alignment,
        child: Text(
          text!,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontsize,
          ),
        ),
      ),
      style: TextButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.all(18),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
