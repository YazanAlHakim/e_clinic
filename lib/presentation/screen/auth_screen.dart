import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_clinic/core/constant/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';
import '../widget/auth/custom_have_account.dart';
import '../widget/auth/custom_login.dart';
import '../widget/auth/custom_register.dart';
import '../widget/auth/custom_fab_auth.dart';
import '../widget/global_widget/costum_loading.dart';
import '../widget/global_widget/custom_error.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
            if(state is CitiesSuccessState ){
              return Scaffold(
                backgroundColor: Colors.white,
                floatingActionButton: BlocProvider.of<AuthBloc>(context).currentIndex == 1
                    ? const CustomFabAuth()
                    : null,
                bottomNavigationBar: BlocProvider.of<AuthBloc>(context).currentIndex == 0
                    ? const CustomHaveAccount()
                    : null,

                body: PageView(
                  controller: BlocProvider.of<AuthBloc>(context).pageController,
                  onPageChanged: (index) {
                    BlocProvider.of<AuthBloc>(context).add(ChangePageAuthEvent(index));
                  },
                  children:  [
                    const CustomLogin(),
                    CustomRegister(cities: state.citiesValues),
                  ],
                ),
              );
            }
            else if (state is LoadingState){
              return  const CustomLoading();
            }
            else if (state is CitiesErrorState){
              return CustomError(error: state.error);
            }
            else{
              print('tttttttttt');
              return Scaffold(
                floatingActionButton: BlocProvider.of<AuthBloc>(context).currentIndex == 1
                    ? const CustomFabAuth()
                    : null,
                bottomNavigationBar: BlocProvider.of<AuthBloc>(context).currentIndex == 0
                    ? const CustomHaveAccount()
                    : null,

                body: PageView(
                  controller: BlocProvider.of<AuthBloc>(context).pageController,
                  onPageChanged: (index) {
                    BlocProvider.of<AuthBloc>(context).add(ChangePageAuthEvent(index));
                  },
                  children:  [
                    const CustomLogin(),
                    CustomRegister(cities: BlocProvider.of<AuthBloc>(context).citiesValue),
                  ],
                ),
              );

            }
        },
      listener:  (context, state){
        if (state is LoginDoneState){
          AnimatedSnackBar.material(
            'تم تسجيل الدخول بنجاح',
            type: AnimatedSnackBarType.success,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
            duration: const Duration(seconds: 5),
          ).show(context);
          Navigator.pushNamedAndRemoveUntil(context, AppRoutes.primaryScreen, (route) => false);
        }
      },
      );
  }
}
