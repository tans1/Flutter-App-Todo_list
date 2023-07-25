import 'package:todo_list/barrel.dart'; 

class RegisterController {
  final BuildContext context;

  RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String fullName = state.fullName;
    String email = state.email;
    String password = state.password;
    String confirm_password = state.confirmPassword;

    if (email.isEmpty) {
      toastInfo(msg: "email is required, please fill it");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "password is required, please fill it");
      return;
    }
    if (confirm_password.isEmpty) {
      toastInfo(msg: "confirm password is required, please fill it");
      return;
    }
    if (fullName.isEmpty) {
      toastInfo(msg: "full name is required, please fill it");
      return;
    }
    if (password != confirm_password) {
      toastInfo(msg: "passwords don't match");
      return;
    }

    try {
      final credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credentials.user != null) {
        await credentials.user?.sendEmailVerification();
        await credentials.user?.updateDisplayName(fullName);
        toastInfo(msg: "please verify your email");
        GoRouter.of(context).go('/login');
      } else {
        toastInfo(msg: "error occured,try again please");
        return;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        toastInfo(msg: "password is too weak");
        return;
      } else if (e.code == "email-already-in-use") {
        toastInfo(msg: "email is already in use");
        return;
      } else if (e.code == "invalid-email") {
        toastInfo(msg: "email format is invalid");
        return;
      }
    }
  }
}
