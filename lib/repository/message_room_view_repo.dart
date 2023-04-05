import 'package:e_clinic/core/class/crud.dart';
import 'package:e_clinic/core/constant/link_api_app.dart';

import '../main.dart';

class MessageRoomViewRepo{
  Crud crud;
  MessageRoomViewRepo(this.crud);
  String token = prefs.getString('token')!;

  getMessage(String roomId)async{
    var response = await crud.postRequestWithTokenList(AppLink.messagesView,
        {
          'room_id' : roomId,
        }, token
    );
    return response.fold((l) => l, (r) => r);
  }

}