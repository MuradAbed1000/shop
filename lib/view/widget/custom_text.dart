import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? height;
  final double? fontsize;
  final Color? color;
  final Alignment? alignment;
  final FontWeight? fontWeight;
  final GestureTapCallback? onTap;
  final TextOverflow? overflow;
  final int? maxLine;
  final double? spaceLine;
  CustomText({
    Key? key,
    this.text,
    this.fontsize,
    this.color,
    this.alignment = Alignment.topLeft,
    this.fontWeight,
    this.onTap,
    this.height,
    this.overflow = TextOverflow.clip,
    this.maxLine,
   this.spaceLine=1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        alignment: alignment,
        child: Text(
          text!,
          style: TextStyle(
        
              height:spaceLine,
              fontWeight: fontWeight,
              fontSize: fontsize,
              color: color),
          overflow: overflow,
          maxLines: maxLine,
        ),
      ),
    );
  }
}
