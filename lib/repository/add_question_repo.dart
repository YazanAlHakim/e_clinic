import 'package:e_clinic/core/constant/link_api_app.dart';

import '../core/class/crud.dart';
import '../main.dart';

class AddQuestionRepo{
  Crud crud;
  AddQuestionRepo(this.crud);
  String token = prefs.getString('token')!;
  
  addQuestion(String question, String idSpecializations, bool unKnown) async {
    var response = await crud.postRequestWithToken(AppLink.questionStore, {
      'body' : question,
      'specialization_id' : '1',
      'anonymous' : unKnown ? '1' : '0',
    },
        token
    );
    return response.fold((l) => l, (r) => r);
  }

  specializationView()async{
    var response = await crud.getRequestListWithToken(AppLink.specializationView, token);
    return response.fold((l) => l, (r) => r);
  }
}