import '../core/class/crud.dart';
import '../core/constant/link_api_app.dart';
import '../main.dart';

class FinishConsultationRepo{

  Crud crud;
  FinishConsultationRepo(this.crud);
  String token = prefs.getString('token')!;

  getFinishConsultation()async{
    var response = await crud.getRequestListWithToken(AppLink.finishConsultation, token);
    return response.fold((l) => l, (r) => r);
  }

}