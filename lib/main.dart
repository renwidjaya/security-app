import 'package:flutter/material.dart';
import 'package:security_app/providers/articles_provider.dart';
import 'package:security_app/providers/login_provider.dart';
import 'package:security_app/repositories/service/articles_service.dart';
import 'package:security_app/repositories/service/login_services.dart';
import 'package:security_app/ui/screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ArticlesProvider(
            articlesService: ArticlesService(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(
            loginServices: LoginServices(),
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SECURITY SMART',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
