import 'package:e_clinic/core/class/crud.dart';
import 'package:e_clinic/core/constant/link_api_app.dart';

import '../main.dart';

class DoctorRepo{
  Crud crud;
  DoctorRepo(this.crud);
  String token = prefs.getString('token')!;

  getDoctor ()async {
    var response = await crud.getRequestListWithToken(AppLink.doctors, token);
    return response.fold((l) => l, (r) => r);
}


getFilterDoctor (String specializationId) async {
    var response = await crud.postRequestWithTokenList(AppLink.doctorView,{
      'specialization_id' : specializationId,
    }, token
    );
    return response.fold((l) => l, (r) => r);

}
}