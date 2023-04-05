part of 'primary_home_bloc.dart';


abstract class PrimaryHomeState extends Equatable {
  const PrimaryHomeState();
}

class PrimaryHomeInitial extends PrimaryHomeState {
  @override
  List<Object> get props => [];
}

class ChangePageState extends PrimaryHomeState{

  final int indexPage;
  const ChangePageState(this.indexPage);
  @override
  List<Object?> get props => [indexPage];


}
