import '../core/class/crud.dart';
import '../core/constant/link_api_app.dart';
import '../main.dart';

class PostViewRepo{
  
  Crud crud;
  PostViewRepo(this.crud);
  String token = prefs.getString('token')!;
  
  getPosts() async{
    var response = await crud.getRequestListWithToken(AppLink.postsView, token);
    return response.fold((l) => l, (r) => r);
  }
  
}