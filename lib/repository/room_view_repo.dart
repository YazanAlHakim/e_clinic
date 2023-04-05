import 'package:e_clinic/core/constant/link_api_app.dart';

import '../core/class/crud.dart';
import '../main.dart';

class RoomViewRepo {
  Crud crud;
  RoomViewRepo(this.crud);
  String token = prefs.getString('token')!;

  getRoomView()async{
    var response = await crud.getRequestListWithToken(AppLink.roomView, token);
    return response.fold((l) => l, (r) => r);
  }
}