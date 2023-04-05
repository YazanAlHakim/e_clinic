import 'dart:convert';

import 'package:e_clinic/core/constant/link_api_app.dart';

import '../core/class/crud.dart';
import '../main.dart';

class RegisterRepo{
  Crud crud;
  RegisterRepo(this.crud);
  late String token = prefs.getString('token')!;

  register(String name,String email , String password , String cityId,String phone , String age, String height, String weight , bool gender , bool social,
      String address, String practices, String permanentMedicine, String surgery, bool highBloodPressure ,
      bool diabetes, String geneticDiseases,String vaccines,String sensitive,String fireBaseToken) async {
    var body = jsonEncode(
        {
          'name' : name,
          'email' :email,
          'password' : password,
          'city_id' : cityId,
          'image' : 'https://st2.depositphotos.com/1007566/11541/v/950/depositphotos_115416492-stock-illustration-avatar-business-man-vector-graphic.jpg' ,
          'mobile_number' : phone,
          'age' : age,
          'height' :height,
          'weight' : weight,
          'sex' : gender,
          'social_situation' : social,
          'address' : address,
          'practices' : practices,
          'medicines' : permanentMedicine,
          'surgery' : surgery,
          'hypertension' : highBloodPressure,
          'diabetes' : diabetes,
          'genetic_diseases' : geneticDiseases,
          'vaccines' : vaccines,
          'sensitive' : sensitive,
          'fireBaseToken' : fireBaseToken,
        }
    );
    var response = await crud.postRequestWithTokenJson(AppLink.register,
        body
    );
    return response.fold((l) => l, (r) => r);
  }
}