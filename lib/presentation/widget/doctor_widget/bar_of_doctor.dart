import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'item_in_bar.dart';

class BarOfDoctor extends StatelessWidget {

  final double height;
  final double paddingHorizontal;
  final Color color;
  final Color textColor;
  final int rate;
  final int posts;
  final int consulting;
  const BarOfDoctor({
    Key? key,
    required this.height,
    required this.paddingHorizontal,
    required this.color, required this.textColor,
    required this.rate,
    required this.posts,
    required this.consulting
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding:  EdgeInsets.symmetric(horizontal:paddingHorizontal,vertical: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ItemInBar(
            value: consulting.toString(),
            icon: Iconsax.eye,
            color: textColor,
          ),
          ItemInBar(
            value: rate.toString(),
            icon: Iconsax.star,
            color: textColor,
          ),
          ItemInBar(
            value: posts.toString(),
            icon: Iconsax.clipboard_text,
            color: textColor,
          ),


        ],
      ),

    );
  }
}
