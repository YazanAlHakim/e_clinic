import 'package:e_clinic/core/class/crud.dart';
import 'package:e_clinic/core/constant/link_api_app.dart';
import '../main.dart';

class MedicationRepo{

  Crud crud;
  MedicationRepo(this.crud);
  String token = prefs.getString('token')!;

  getMedication() async {
    var response = await crud.getRequestListWithToken(AppLink.medication, token);
    return response.fold((l) => l, (r) => r);
  }
}