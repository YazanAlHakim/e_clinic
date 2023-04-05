import 'package:e_clinic/core/constant/link_api_app.dart';
import 'package:e_clinic/main.dart';

import '../core/class/crud.dart';

class LoginRepo{
  
  Crud crud;
  LoginRepo(this.crud);
  
  login(String email, String password) async {
    var response = await crud.postRequest(AppLink.login, {
      'email' : email,
      'password' : password,
      'fireBaseToken' : prefs.getString('fireBaseToken')!,
    });
    return response.fold((l) => l, (r) => r);
  }
}