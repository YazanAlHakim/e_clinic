import 'package:e_clinic/presentation/screen/add_question_screen.dart';
import 'package:e_clinic/presentation/screen/consultation_screen.dart';
import 'package:e_clinic/presentation/screen/doctor_details_screen.dart';
import 'package:e_clinic/presentation/screen/doctors_screen.dart';
import 'package:e_clinic/presentation/screen/finished_consultation_screen.dart';
import 'package:e_clinic/presentation/screen/map_screen.dart';
import 'package:e_clinic/presentation/screen/patient_screen.dart';
import 'package:e_clinic/presentation/screen/home_screen.dart';
import 'package:e_clinic/presentation/screen/auth_screen.dart';
import 'package:e_clinic/presentation/screen/medication_details_screen.dart';
import 'package:e_clinic/presentation/screen/message_room_screen.dart';
import 'package:e_clinic/presentation/screen/primary_screen.dart';
import 'package:e_clinic/presentation/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'core/constant/routes_app.dart';

Map<String, Widget Function(BuildContext)> myRoutes =
{
  AppRoutes.welcomeScreen : (context) => const WelcomeScreen(),
  AppRoutes.primaryScreen : (context) => const PrimaryScreen(),
  AppRoutes.homeScreen : (context) => const HomeScreen(),
  AppRoutes.addQuestionScreen : (context) => const AddQuestionScreen(),
  AppRoutes.doctors : (context) => const DoctorsScreen(),
  AppRoutes.doctorDetails : (context) =>  DoctorDetailsScreen(),
  AppRoutes.medicationDetails : (context) => const MedicationDetailsScreen(),
  AppRoutes.patientScreen : (context) =>   const PatientScreen(),
  AppRoutes.finishedConsultation : (context) => const FinishedConsultationScreen(),
  AppRoutes.loginScreen : (context) =>  const LoginScreen(),
  AppRoutes.consultationScreen : (context) => const ConsultationScreen(),
  AppRoutes.messageRoomScreen : (context) => const MessageRoomScreen(),
  AppRoutes.mapScreen : (context) =>   MapScreen(),

};