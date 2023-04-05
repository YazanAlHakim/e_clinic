import 'package:e_clinic/core/class/crud.dart';

import '../core/constant/link_api_app.dart';
import '../main.dart';

class WaitingConsultationRepo{

  Crud crud;
  WaitingConsultationRepo(this.crud);
  String token = prefs.getString('token')!;

  getWaitingConsultation ()async{
    var response = await crud.getRequestListWithToken(AppLink.waitingConsultation , token);
    return response.fold((l) => l, (r) => r);
  }
}