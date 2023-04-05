import 'package:e_clinic/core/constant/link_api_app.dart';

import '../core/class/crud.dart';
import '../main.dart';

class QuestionViewRepo{
  
  Crud crud;
  QuestionViewRepo(this.crud);
  String token = prefs.getString('token')!;
  
  getQuestions ()async{
    var response = await crud.getRequestListWithToken(AppLink.questionView, token);
    return response.fold((l) => l, (r) => r);
  }
}