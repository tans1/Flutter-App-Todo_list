import 'package:todo_list/barrel.dart'; 

class LoginController {
  final BuildContext context;
  LoginController({required this.context});

  Future<void> handleLogin() async {
    final state = context.read<LoginBloc>().state;
    String email = state.email;
    String password = state.password;
    GoRouter.of(context).go('/home');
    try {
      if (email.isEmpty) {
        toastInfo(msg: "email is required, please fill it");
        return;
      }
      if (password.isEmpty) {
        toastInfo(msg: "password is required, please fill it");
        return;
      }

      try {
        final credentials = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        User user = credentials.user!;
        user.reload();
        
        if (user.email == null) {
          toastInfo(msg: "you didn't registered yet, please signUp first");
          GoRouter.of(context).go('/signup');
          return;
        }

        
        if (user.emailVerified == true) {
          var box = Hive.box('user__box');
          box.put('loggedIn', true);
          GoRouter.of(context).go('/home');
        } else {
          toastInfo(msg: "please verify your email");
          return;
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-not-found") {
          toastInfo(msg: "user not found for this email");
          return;
        } else if (e.code == "wrong-password") {
          toastInfo(msg: "wrong password provided for that user");
          return;
        } else if (e.code == "invalid-email") {
          toastInfo(msg: "email format is invalid");
          return;
        } else {
          toastInfo(msg: "error occured, retry again");
          return;
        }
      }
    } catch (e) {}
  }
}
