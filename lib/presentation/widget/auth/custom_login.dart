import 'package:e_clinic/bloc/auth_bloc/auth_bloc.dart';
import 'package:e_clinic/core/constant/image_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import 'custom_auth_button.dart';
import 'custom_auth_text_field.dart';
import 'custom_subtitle_auth.dart';

class CustomLogin extends StatelessWidget {
  const CustomLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      //shrinkWrap: true,
      //padding: const EdgeInsets.all(14.0),
      children:  [
        Image.asset(
          AppImage.login,
        ),
        const SizedBox(height: 18.0,),
        ListView(
          shrinkWrap: true,
          physics:  NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          children: [
            const CustomSubTitleAuth(
              title: 'اهلا بعودتك',
            ),
            CustomAuthTextField(
              textFieldController: BlocProvider.of<AuthBloc>(context).emailLogin,
              hint: 'البريد الالكتروني',
              keyboardType: TextInputType.emailAddress,
              icon: Icons.email_outlined,
              password: false,
            ),
            CustomAuthTextField(
              textFieldController: BlocProvider.of<AuthBloc>(context).passwordLogin,
              hint: 'كلمة السر',
              keyboardType: TextInputType.visiblePassword,
              icon: Iconsax.lock,
              password: true,
            ),
            CustomAuthButton(
              onTab: (){
                BlocProvider.of<AuthBloc>(context).add(LoginEvent());
              },
            ),
          ],
        ),
      ],
    );
  }
}
