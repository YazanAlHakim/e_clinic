import 'package:e_clinic/core/constant/link_api_app.dart';

import '../core/class/crud.dart';
import '../main.dart';

class SpecializationViewRepo {
  Crud crud;
  SpecializationViewRepo(this.crud);
  String token = prefs.getString('token')!;

  specializationView()async{
    var response = await crud.getRequestListWithToken(AppLink.specializationView, token);
    return response.fold((l) => l, (r) => r);
  }
}