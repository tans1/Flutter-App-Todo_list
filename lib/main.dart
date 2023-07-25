import 'package:todo_list/barrel.dart'; 
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  print("firebase initialized succesffully");
  final hiveDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(hiveDir.path);
  Hive.initFlutter('hiveDb');
  Hive.openBox("user__box");

  print("hive initialized successfully");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routesClass = AppRoutes.routes;

    return MultiBlocProvider(
        providers: AppBlocProvider.allBlocProviders,
        child: ScreenUtilInit(
            designSize: Size(400, 600),
            builder: (context, child) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                      seedColor: Color.fromARGB(255, 39, 169, 209)),
                  useMaterial3: true,
                ),
                routeInformationProvider: routesClass.routeInformationProvider,
                routerDelegate: routesClass.routerDelegate,
                routeInformationParser: routesClass.routeInformationParser,
              );
            }));
  }
}
