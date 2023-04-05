import 'package:e_clinic/core/constant/link_api_app.dart';
import '../core/class/crud.dart';

class CityRepository{

  Crud crud;
  CityRepository(this.crud);

  getCities() async{
    var response = await crud.getRequest(AppLink.city);
    return response.fold((l) => l, (r) => r);
  }

}