import 'package:bmi_tracker_app/core/routing/app_router.dart';
import 'package:bmi_tracker_app/core/routing/routes.dart';
import 'package:bmi_tracker_app/features/app/presentation/manager/home_provider.dart';
import 'package:bmi_tracker_app/features/auth/presentation/manager/auth_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/di.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupDI();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => getIt<AuthProvider>()),
          ChangeNotifierProvider(create: (_) => getIt<HomeProvider>()),
        ],
        child: MaterialApp(
          title: 'BMI Tracker App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
            useMaterial3: true,
          ),
          initialRoute: Routes.coreScreen,
          onGenerateRoute: AppRouter().generateRoute,
        ));
  }
}
