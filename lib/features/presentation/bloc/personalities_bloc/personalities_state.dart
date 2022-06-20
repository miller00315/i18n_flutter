part of 'personalities_bloc.dart';

abstract class PersonalitiesState extends Equatable {
  const PersonalitiesState();
  
  @override
  List<Object> get props => [];
}

class PersonalitiesInitial extends PersonalitiesState {}
