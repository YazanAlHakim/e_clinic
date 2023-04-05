import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../bloc/auth_bloc/auth_bloc.dart';
import '../../../core/constant/routes_app.dart';

class CustomFabAuth extends StatelessWidget {
  const CustomFabAuth({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(
          context,

          AppRoutes.patientScreen,

              (route) => true,
          arguments: {
            'email' : BlocProvider.of<AuthBloc>(context).email.text,
            'password' : BlocProvider.of<AuthBloc>(context).password.text,
            'cityId' : BlocProvider.of<AuthBloc>(context).selectedCityId,
          }
        );
      },
      child: const Icon(Iconsax.arrow_left),
    );
  }
}
