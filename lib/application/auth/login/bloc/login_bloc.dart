import 'package:todo_list/barrel.dart'; 
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginEmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<LoginPasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
  }
}



