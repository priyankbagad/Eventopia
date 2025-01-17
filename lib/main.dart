import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controller/auth_controller.dart';
import 'view/landing_page.dart';
import 'view/auth/auth_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/landing',
        routes: {
          '/landing': (context) => const LandingPage(),
          '/auth': (context) => const AuthPage(),
          '/home': (context) => const Scaffold(
                body: Center(
                  child: Text(
                    'Home Page',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
        },
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        ),
      ),
    );
  }
}
