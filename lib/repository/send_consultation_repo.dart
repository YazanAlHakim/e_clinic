import 'dart:convert';
import 'package:e_clinic/core/constant/link_api_app.dart';
import '../core/class/crud.dart';
import '../main.dart';

class SendConsultationRepo {
  Crud crud;
  SendConsultationRepo(this.crud);
  String token = prefs.getString('token')!;

  sendConsultation(
    String title,
    String type,
    String details,
    String time,
    String update,
    String frequency,
    String severity,
    String factorsIncrease,
    String factorsReduce,
    String place,
    String nature,
    String? doctorId,
    String specializationId,
  ) async {


    var image = jsonEncode(
      [
        'https://cdn1-m.alittihad.ae/store/archive/image/2022/9/10/d21c3268-366d-444a-b5cb-c3d7cb7f694b.jpg?width=1300',
        'https://cdn.altibbi.com/cdn/image/2021/05/17/6004e7d9f6ad836802c17fdaf47c1686.jpeg',
      ],
    );
    var response = await crud.postRequestWithToken(
        AppLink.consultationStore,
        {
          'title': title,
          'type_complaint': type,
          'details': details,
          'time': time,
          'status_pain': update,
          'frequency': frequency,
          'nature_complaint': nature,
          'severity_pain': severity,
          'factors_increase_complaint': factorsIncrease,
          'factors_reduce_complaint': factorsReduce,
          'place_pain': place,
          'images' : image,
          'doctor_id': doctorId,
          'specialization_id': specializationId,
        },
        token);
    return response.fold((l) => l, (r) => r);
  }
}
