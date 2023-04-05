part of 'primary_home_bloc.dart';


abstract class PrimaryHomeEvent extends Equatable {
  const PrimaryHomeEvent();
}

class ChangePageEvent extends PrimaryHomeEvent{

  final int indexPage;
  const ChangePageEvent(this.indexPage);

  @override
  List<Object?> get props => [indexPage];

}


