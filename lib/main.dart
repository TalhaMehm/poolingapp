  import 'package:firebase_core/firebase_core.dart';
  import 'package:flutter/material.dart';
  import 'package:poolingapp/UI/auth/loginScreen.dart';
  import 'package:poolingapp/UI/splash_screen.dart';
  import 'package:poolingapp/firebase_options.dart';

  void main() async {
    WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    runApp(const Pooling());
  }

  class Pooling extends StatelessWidget {
    const Pooling({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      );
    }
  }
