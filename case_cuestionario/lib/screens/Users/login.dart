import 'dart:convert';

import 'package:case_cuestionario/screens/dashboard.dart';
import 'package:case_cuestionario/screens/Users/registro.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    void snackbarRed(String message) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Center(
            child: Text(
          message,
          style: const TextStyle(fontSize: 18),
        )),
      ));
    }

    Future<void> loginUser() async {
      const String url = 'http://192.168.1.66:3000/login';

      final response = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'username': _emailController.text.trim(),
            'password': _passwordController.text.trim(),
          }));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        final String token = data['token'];
        final String id = data['userId'].toString();
        const secureStorage = FlutterSecureStorage();
        await secureStorage.write(key: 'token', value: token);
        await secureStorage.write(key: 'id', value: id);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Dashboard()));
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  backgroundColor: Colors.grey.shade500,
  content: const Center(child: Text('Inicio de sesión exitoso')),
));

      } else if (response.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  backgroundColor: Colors.grey.shade500,
  content: Center(child: Text('Inicio de sesión fallido ${response.body}')),
));

      } else {
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  backgroundColor: Colors.grey.shade500,
  content: Center(child: Text('Error al iniciar sesión: ${response.body}')),
));

      }
    }

    Widget buildInputField(String hintText, TextEditingController controller,
        bool obscureText, TextInputType inputType, double screenWidth) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: TextField(
            style: const TextStyle(color: Colors.black),
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
            child: Text(
              '¡Te hemos extrañado!',
              style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "¿Olvidaste tu contraseña?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: GestureDetector(
              onTap: () {
                if (_emailController.text.trim().isEmpty) {
  snackbarRed("Por favor, ingrese su correo electrónico");
  return;
}
if (_passwordController.text.trim().isEmpty) {
  snackbarRed("Por favor, ingrese su contraseña");
  return;
}

                loginUser();
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
                    'Iniciar sesión',
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
                '¿No eres miembro? ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Registrarse()),
                  );
                },
                child: const Text(
                  'Regístrate ahora',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
