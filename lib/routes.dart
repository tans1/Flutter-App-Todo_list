import 'package:todo_list/barrel.dart'; 

class AppRoutes {
  static final GoRouter routes = GoRouter(routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => Welcome(),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: "/login",
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: "/signup",
      builder: (context, state) => SignUp(),
    ),
    GoRoute(
      path: "/local-auth",
      builder: (context, state) => LocalAuthPage(),
    ),
    // GoRoute(
    //   path: "/",
    //   builder: (context, state) => Welcome(),
    // ),
  ]);
}
