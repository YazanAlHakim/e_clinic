import 'package:e_clinic/core/class/crud.dart';

import '../core/constant/link_api_app.dart';
import '../main.dart';

class SendMessageRepo{
  Crud crud;
  SendMessageRepo(this.crud);
  String token = prefs.getString('token')!;

  sendMessage(String message , String roomId) async {
    var response = await crud.postRequestWithToken(
        AppLink.messageStore,
        {
          'body' : message,
          'room_id' : roomId,
        },
        token
    );
    return response.fold((l) => l, (r) => r);
  }
}