import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'personalities_event.dart';
part 'personalities_state.dart';

class PersonalitiesBloc extends Bloc<PersonalitiesEvent, PersonalitiesState> {
  PersonalitiesBloc() : super(PersonalitiesInitial()) {
    on<PersonalitiesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
