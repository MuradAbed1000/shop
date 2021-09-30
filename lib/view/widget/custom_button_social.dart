
import 'package:flutter/material.dart';

class CustomButtonSocial extends StatelessWidget {
  final double? borderradius;
  final String? textassets;
  final String? text;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;

  const CustomButtonSocial({
    Key? key,
    this.borderradius,
    this.textassets,
    this.text,
    this.height,
    this.width,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          //color: Colors.grey.shade50,
          border: Border.all(color: const Color.fromRGBO(221, 221, 221, 1)),
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderradius!))),
          child: Row(
            children: [
              Image.asset(
                textassets!,
                height: height,
                width: width,
              ),
              const SizedBox(
                width: 90,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  text!,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ],
          ),
        ));
  }
}
