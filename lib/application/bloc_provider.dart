import 'package:todo_list/barrel.dart'; 

class AppBlocProvider {
  static get allBlocProviders => [
        BlocProvider(
            lazy: false, 
            child: HomePage(), 
            create: (context) => HomeBloc()),
         BlocProvider(
            lazy: false, 
            child: LoginPage(), 
            create: (context) => LoginBloc()),
        BlocProvider(
            lazy: false, 
            child: SignUp(), 
            create: (context) => RegisterBloc()),
      ];
}
