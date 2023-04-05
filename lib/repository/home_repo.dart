import 'package:e_clinic/core/class/crud.dart';
import 'package:e_clinic/core/constant/link_api_app.dart';

import '../main.dart';

class HomeRepo{
  Crud crud;
  HomeRepo(this.crud);
  String token = prefs.getString('token')!;
  getSpecializationsAndDoctor () async {
    var response = await crud.getRequestWithToken(AppLink.home, token);
    return response.fold((l) => l, (r) => r);
  }


}