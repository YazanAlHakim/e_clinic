import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth_bloc/auth_bloc.dart';
import '../../../core/constant/color_app.dart';

class CustomHaveAccount extends StatelessWidget {
  const CustomHaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'لا يوجد لديك حساب؟',
            style: TextStyle(color: Colors.grey),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 4.0),
            child: InkWell(
              onTap: () {
                BlocProvider.of<AuthBloc>(context).add(const ClickRegisterEvent());
              },
              child: const Text(
                'تسجيل',
                style: TextStyle(
                    color: AppColor.darkGreen,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
