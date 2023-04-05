import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../errors/failure.dart';
import '../function/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {

  Future<Either<Failure,List>> getRequest (String linkUrl) async{
    try{
      if(await checkInternet()){
        var response = await http.get(Uri.parse(linkUrl),
            headers: {
              'Accept' : 'application/json',
              'Content-Type' : 'multipart/from-data',
            }
        );
        print(response.statusCode);
        if(response.statusCode == 200 || response.statusCode == 201){
          List responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        }
        else if (response.statusCode == 425) {
          return Left(Error());
        }
        else{
          return Left(ServerFailure());
        }
      }
      else{
        return Left(OfflineFailure());
      }
    } catch(_){
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure,Map>> getRequestWithToken(String linkUrl, String token) async{
    try{
      if(await checkInternet()) {
        var response= await http.get(Uri.parse(linkUrl), headers:{
          'Accept' : 'application/json',
          'Authorization' : 'Bearer$token',
        });
        print(response.statusCode);
        if(response.statusCode == 200 || response.statusCode == 201){
          print(json.decode(response.body));
          Map responseBody = json.decode(response.body);
          return Right(responseBody);
        }
        else if (response.statusCode == 425){
          return Left(Error());
        }
        else{
          return Left(ServerFailure());
        }
      } else{
        return Left(OfflineFailure());
      }
    }catch(_){
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure,List>> getRequestListWithToken(String linkUrl, String token) async{
    try{
      if(await checkInternet()) {
        var response= await http.get(Uri.parse(linkUrl), headers:{
          'Accept' : 'application/json',
          'Authorization' : 'Bearer$token',
        });
        print(response.statusCode);
        if(response.statusCode == 200 || response.statusCode == 201){
          print(json.decode(response.body));
          List responseBody = json.decode(response.body);
          return Right(responseBody);
        }
        else if (response.statusCode == 425){
          return Left(Error());
        }
        else{
          return Left(ServerFailure());
        }
      } else{
        return Left(OfflineFailure());
      }
    }catch(_){
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure,Map>> postRequest(String linkUrl,Map data) async{
    try{
      if(await checkInternet()) {
        print('hereeeeee');
        var response= await http.post(Uri.parse(linkUrl),body: data);
        print(response.statusCode);

        if(response.statusCode == 200 || response.statusCode == 201){
          Map responseBody = json.decode(response.body);
          print(responseBody);
          return Right(responseBody);
        }
        else if (response.statusCode == 425){
          return Left(Error());
        }
        else{
          return Left(ServerFailure());
        }
      } else{
        return Left(OfflineFailure());
      }
    }catch(_){
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure,String>> postRequestWithToken(String linkUrl,Map data,String token) async{
    try{
      if(await checkInternet()) {
        print('heloooooooo');
        var response= await http.post(Uri.parse(linkUrl),body: data,headers: {
          'Accept' : 'application/json',
          'Authorization' : 'Bearer$token',
        });
        print(response.statusCode);

        if(response.statusCode == 200 || response.statusCode == 201){
          String responseBody = json.decode(response.body);
          print('testtttttttttttttttttttttttttt$responseBody');
          return Right(responseBody);
        }
        else if (response.statusCode == 425){
          print('425testtttttttttttttttttttttttttt${json.decode(response.body)}');
          return Left(ServerFailure());
        }
        else{print('500testtt${json.decode(response.body)}');
          return Left(ServerFailure());
        }
      } else{
        return Left(OfflineFailure());
      }
    }catch(_){
      print('Catch erorrrr');
      return Left(ServerFailure());
    }
  }


  Future<Either<Failure,List>> postRequestWithTokenList(String linkUrl,Map data,String token) async{
    try{
      if(await checkInternet()) {
        print('heloooooooo');
        var response= await http.post(Uri.parse(linkUrl),body: data,headers: {
          'Accept' : 'application/json',
          'Authorization' : 'Bearer$token',
        });
        print(response.statusCode);

        if(response.statusCode == 200 || response.statusCode == 201){
          print('testtttttttttttttttttttttttttt22222222');
          List responseBody = json.decode(response.body);
          print('testtttttttttttttttttttttttttt$responseBody');
          return Right(responseBody);
        }
        else if (response.statusCode == 425){
          print('425testtttttttttttttttttttttttttt${json.decode(response.body)}');
          return Left(ServerFailure());
        }
        else{print('500testtt${json.decode(response.body)}');
        return Left(ServerFailure());
        }
      } else{
        return Left(OfflineFailure());
      }
    }catch(_){
      print('Catch erorrrr');
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure,Map>> postRequestWithTokenJson(String linkUrl,String data) async{
    try{
      if(await checkInternet()) {
        print('heloooooooo');
        var response= await http.post(Uri.parse(linkUrl),body: data,headers: {
          'Accept' : 'application/json',
          "Content-Type": "application/json",
        });
        print(response.statusCode);

        if(response.statusCode == 200 || response.statusCode == 201){
          Map responseBody = json.decode(response.body);
          print('testtttttttttttttttttttttttttt$responseBody');
          return Right(responseBody);
        }
        else if (response.statusCode == 425){
          print('425testtttttttttttttttttttttttttt${json.decode(response.body)}');
          return Left(ServerFailure());
        }
        else{print('500testtt${json.decode(response.body)}');
        return Left(ServerFailure());
        }
      } else{
        return Left(OfflineFailure());
      }
    }catch(_){
      print('Catch erorrrr');
      return Left(ServerFailure());
    }
  }

}