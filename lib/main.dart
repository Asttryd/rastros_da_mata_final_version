import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rastros_da_mata_official_app/views/about_page.dart';
import 'package:rastros_da_mata_official_app/views/onboarding_page.dart';
import 'package:rastros_da_mata_official_app/views/plants_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/plants': (context) => const PlantsPage(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}
