import 'package:flutter/material.dart';

import '../../../core/constant/color_app.dart';

class CustomAuthButton extends StatelessWidget {

  final void Function() onTab;

  const CustomAuthButton({Key? key, required this.onTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsetsDirectional.only(top: 16.0),
      child: MaterialButton(
        onPressed: onTab,
        color: AppColor.darkGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        //minWidth:80.0,
        child: const Text(
          'تأكيد',
          style: TextStyle(
              color: Colors.white, fontFamily: 'cairo'),
        ),
      ),
    );
  }
}
