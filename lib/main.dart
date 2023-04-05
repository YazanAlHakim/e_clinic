import 'package:e_clinic/bloc/post_question_bloc/post_question_bloc.dart';
import 'package:e_clinic/core/constant/color_app.dart';
import 'package:e_clinic/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'bloc/Patient_bloc/patient_bloc.dart';
import 'bloc/auth_bloc/auth_bloc.dart';
import 'bloc/doctor_details_bloc/doctor_details_bloc.dart';
import 'bloc/finished_consultation_bloc/finished_consultation_bloc.dart';
import 'bloc/message_bloc/message_bloc.dart';
import 'bloc/primary_home_bloc/primary_home_bloc.dart';
import 'bloc/profile_bloc/profile_bloc.dart';
import 'core/constant/routes_app.dart';

late SharedPreferences prefs ;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  prefs= await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  FirebaseMessaging.instance.getToken().then((token) {
    print('tokeeeeeeeeeeeeen : $token');
   prefs.setString('fireBaseToken', token!);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => PrimaryHomeBloc()..add(const ChangePageEvent(0))
              ),
              BlocProvider(
                create: (context) => PostQuestionBloc()..add(GetPostsEvent()),
              ),
              BlocProvider(
                  create: (context) => AuthBloc()..add(GetCitiesEvent()),),
              BlocProvider(
                  create: (context) => MessageBloc()..add(GetWaitingConsultation()),
              ),
              BlocProvider(
                  create: (context) => PatientBloc(),
              ),
              BlocProvider(
                  create: (context) => FinishedConsultationBloc(),
              ),
              BlocProvider(
                  create: (context) => ProfileBloc(),
              ),
              BlocProvider(
                  create: (context) => DoctorDetailsBloc(),
              ),

            ],
            child: MaterialApp(
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('ar', ''),
              ],
              theme: ThemeData(
                primarySwatch: AppColor.colorCustom,
              ),
              locale: const Locale('ar'),
              initialRoute: prefs.getBool('login') == null ? AppRoutes.welcomeScreen :
              prefs.getBool('login')! ? AppRoutes.primaryScreen :
              AppRoutes.welcomeScreen ,
              routes: myRoutes,
              debugShowCheckedModeBanner: false,
            ),
          );
        }
    );
  }
}
