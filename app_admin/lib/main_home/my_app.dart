import 'package:app_admin/tela_login_senha/senha/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../tela_login_senha/login/login_page.dart';
import 'home_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        Provider<AuthenticationService?>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(create: (context) => context.read<AuthenticationService>().authStateChanges, initialData: null),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => AuthenticationWrapper(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if(firebaseUser != null){
      return HomePage();
    }
    return const LoginPage();
  }
}


