import 'package:case_cuestionario/screens/Users/login.dart';
import 'package:case_cuestionario/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' ;

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color darkblue = const Color.fromARGB(255, 0, 0, 139);

    return MaterialApp(
      title: 'CASE',
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: darkblue, // The primary color for the overall theme
          secondary: const Color(
              0xff5686aa), // The secondary color for the overall theme
          surface: Colors
              .white, // The surface color (background color of components)
          background:
              const Color(0xff111b3e), // The background color of the app
          error:
              const Color(0xFFB00020), // The color to use for error indicators
          onPrimary: Colors
              .black, // The color to use for text and icons on the primary color
          onSecondary: Colors
              .black, // The color to use for text and icons on the secondary color
          onSurface: Colors
              .white, // The color to use for text and icons on the surface color
          onBackground: const Color(
              0xff927249), // The color to use for text and icons on the background color
          onError: Colors
              .white, // The color to use for text and icons on error backgrounds
          brightness:
              Brightness.light, // The overall brightness of the color scheme
        ),
      ),
      home: const Login(),//Change to Login
    );
  }
}