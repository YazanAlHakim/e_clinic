import 'package:e_clinic/main.dart';
import 'package:e_clinic/model/cities_model.dart';
import 'package:e_clinic/repository/cities_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/class/crud.dart';
import '../../core/function/handling_failure.dart';
import '../../repository/login_repo.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {


  ImagePicker imagePicker = ImagePicker();

  CityRepository cityRepository =CityRepository(Crud());
  LoginRepo loginRepo = LoginRepo(Crud());
  List cities = [];
  List <CitiesModel> citiesValue = [];

  String? selectedCityId ;


  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  int currentIndex =0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async{
      if(event is ClickRegisterEvent){
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if(pageController.hasClients){
            pageController.animateToPage(currentIndex+1, duration: const Duration(milliseconds: 800), curve: Curves.ease);
          }
        });
        emit(GoToSignUp(currentIndex));
      }
      else if(event is ChangePageAuthEvent){
        currentIndex = event.index;
        emit(ChangePageState(currentIndex));
      }
      else if(event is GetCitiesEvent){
        dynamic response;
        emit(LoadingState());
        try{
          response = await cityRepository.getCities();
          cities.addAll(response);
          citiesValue = cities.map((item) => CitiesModel.fromJson(item)).toList();
          emit(CitiesSuccessState(citiesValue));
        }catch(_){
          emit(CitiesErrorState(handlingFailure(response)));
        }
      }
      else if (event is LoginEvent){
        dynamic response;
        emit(LoadingState());
        try{
          response = await loginRepo.login(emailLogin.text, passwordLogin.text);
           await prefs.setString('token', response['token']);
           await prefs.setInt('id', response['patient']['id']);
           await prefs.setString('name', response['patient']['name']);
           await prefs.setString('image', response['patient']['image']);
           await prefs.setBool('login', true);

          emit(LoginDoneState());
        }catch(_){
          emit(LoginErrorState(handlingFailure(response)));
        }
      }

      else if (event is UploadImage){
        await imagePicker.pickImage(source: ImageSource.gallery);
      }

    });
  }
}
