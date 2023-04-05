import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../presentation/screen/home_screen.dart';
import '../../presentation/screen/medication_screen.dart';
import '../../presentation/screen/message_screen.dart';
import '../../presentation/screen/post_question_screen.dart';
import '../../presentation/screen/profile_screen.dart';
part 'primary_home_event.dart';
part 'primary_home_state.dart';

class PrimaryHomeBloc extends Bloc<PrimaryHomeEvent, PrimaryHomeState> {

  int? currentPage;
  List<Widget> listPage=[
    const HomeScreen(),
    const MessageScreen(),
    const MedicationScreen(),
    const PostQuestionScreen(),
    const ProfileScreen(),
  ];
  List <IconData> iconBottomBar = [
    Iconsax.home,
    Iconsax.message,
    Iconsax.glass,
    Iconsax.clipboard_text,
    Iconsax.profile_circle
  ];

  PrimaryHomeBloc() : super(PrimaryHomeInitial()) {
    on<PrimaryHomeEvent>((event, emit) {
      if(event is ChangePageEvent){
        currentPage = event.indexPage;
        emit(ChangePageState(currentPage!));
      }

    }
    );
  }
}
