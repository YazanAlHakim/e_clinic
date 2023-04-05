import '../errors/failure.dart';

String handlingFailure(Failure failure){
  switch (failure.runtimeType){
    case ServerFailure :
      return 'Server Failure';
    case OfflineFailure :
      return 'Offline Failure';
    case Error :
      return 'Error';
    default :
      return 'Unexpected Error';
  }
}