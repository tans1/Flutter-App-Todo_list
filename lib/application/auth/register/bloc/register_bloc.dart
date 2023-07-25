import 'package:todo_list/barrel.dart'; 
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<FullNameEvent>((event, emit) {
      emit(state.copyWith(fullName: event.fullName));
    });
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<ConfirmPasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.confirm_password));
    });

  }
}
