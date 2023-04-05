import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../core/constant/routes_app.dart';
import '../widget/global_widget/custom_button.dart';
import '../widget/welcome_widget/custom_container.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomContainer(),
          Text(
              'مرحبا بك في تطبيق\n العيادة الالكترونية',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'cairo'
              ),
          ),
            CustomButton(
               text: 'التالي',
             onTab: (){
               Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
             },
           ),
        ],
      ),
    );
  }
}
