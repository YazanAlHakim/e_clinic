import 'package:e_clinic/core/class/crud.dart';
import 'package:e_clinic/core/constant/link_api_app.dart';

import '../main.dart';

class ComplaintStoreRepo{

  Crud crud ;
  ComplaintStoreRepo(this.crud);
  String token = prefs.getString('token')!;

  sendPublicComplaint (String type , String body)async{
    var response = await crud.postRequestWithToken(
        AppLink.complaintStore,
        {
          'type' : type,
          'body' : body,
        },
        token);
    return response.fold((l) => l, (r) => r);
  }



  sendPrivateComplaint (String body, String doctorId)async{
    var response = await crud.postRequestWithToken(
        AppLink.complaintStore,
        {
          'type' : 'doctor',
          'body' : body,
          'doctor_id' : doctorId,
        },
        token);
    return response.fold((l) => l, (r) => r);
  }

}