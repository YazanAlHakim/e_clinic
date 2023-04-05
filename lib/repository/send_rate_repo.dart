import 'package:e_clinic/core/constant/link_api_app.dart';

import '../core/class/crud.dart';
import '../main.dart';

class SendRateRepo {
  Crud crud;
  SendRateRepo(this.crud);
  String token = prefs.getString('token')!;


  sendRate(String doctorId , String rate) async {
    var response = await crud.postRequestWithToken(AppLink.rateStore,
        {
          'doctor_id' : doctorId,
          'rate' : rate ,
        },
        token,
    );

    return response.fold((l) => l, (r) => r);
  }
}