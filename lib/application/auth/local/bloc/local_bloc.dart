import 'package:todo_list/barrel.dart'; 
part 'local_event.dart';
part 'local_state.dart';

class LocalBloc extends Bloc<LocalEvent, LocalState> {
  LocalBloc() : super(LocalState()) {
    on<PassWordEvent>((event, emit) {
      emit(state.copyWith(passWord: event.passWord));
    });
  }
}
