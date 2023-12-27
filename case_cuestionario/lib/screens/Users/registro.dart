import 'package:case_cuestionario/screens/Users/login.dart';
import 'package:case_cuestionario/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Registrarse extends StatefulWidget {
  const Registrarse({super.key});

  @override
  State<Registrarse> createState() => _RegistrarseState();
}

class _RegistrarseState extends State<Registrarse> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final _secureStorage = FlutterSecureStorage();

    Widget buildInputField(String hintText, TextEditingController controller,
        bool obscureText, TextInputType inputType, double screenWidth) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: TextField(
            style: TextStyle(color: Colors.black),
            cursorColor: Theme.of(context).colorScheme.secondary,
            controller: controller,
            obscureText: obscureText,
            keyboardType: inputType,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary, width: 2),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(12.0),
              ),
              labelText: hintText,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 24,
              ),
              labelStyle: TextStyle(
                color: Theme.of(context)
                    .colorScheme
                    .secondary, // Change color when focused
                fontWeight: FontWeight.bold,
              ),
              filled: true,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    Future<void> registerUser(String correo, String password) async {
      final String apiUrl =
          'http://192.168.1.66:3000/register'; // Replace with your server URL

      try {
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'correo': correo, 'password': password}),
        );

        if (response.statusCode == 200) {
          // Registration successful, extract and store the token
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          final String token = responseData['token'];
          final String userId = responseData['userId'];
          await _secureStorage.write(key: 'id', value: userId);
          // Save the token in a secure manner (e.g., using secure storage)
          await _secureStorage.write(
              key: 'token',
              value: token); //await secureStorage.read(key: 'token');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Dashboard()));
          print('Registration successful. Token: $token');
        } else {
          // Registration failed, handle the error
          print('Registration failed. Status code: ${response.statusCode}');
          print('Response body: ${response.body}');
        }
      } catch (error) {
        // Handle any network or server errors
        print('Error during registration: $error');
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 55,
          ),
          Center(
            child: Icon(
              Icons.person_outline_outlined,
              size: screenWidth - 160,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text('Hola nuevamente',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: Theme.of(context).colorScheme.onBackground)),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text('¡Hagamos una cuenta para ti!',
                style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onBackground)),
          ),
          const SizedBox(
            height: 50,
          ),
          buildInputField('Correo Electrónico', _emailController, false,
              TextInputType.emailAddress, screenWidth),
          const SizedBox(
            height: 15,
          ),
          buildInputField('Contraseña', _passwordController, true,
              TextInputType.text, screenWidth),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: GestureDetector(
              onTap: () async {
                await registerUser(_emailController.text.trim(),
                    _passwordController.text.trim());
              },
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                      child: Text(
                    'Registrarte',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '¿Ya tienes cuenta? ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: const Text(
                  'Iniciar sesión',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Políticas de privacidad',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
