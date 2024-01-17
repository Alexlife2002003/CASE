import 'package:case_cuestionario/screens/Users/login.dart';
import 'package:case_cuestionario/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    const _secureStorage = FlutterSecureStorage();
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

    void _showPrivacyPolicy() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey.withOpacity(0.9),
            title: const Text(
              'Políticas de privacidad',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            content: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ENCUESTA DE SEGUIMIENTO DE TRAYECTORIAS ESCOLARES\n\n'
                    'La Universidad Autónoma de Zacatecas “Francisco García Salinas”, con domicilio en Jardín Juárez #147, Centro Histórico, C.P. 98000, Zacatecas, Zacatecas, es la responsable del tratamiento de los datos personales proporcionados y de protegerlos en términos de lo dispuesto en la Ley General de Protección de Datos Personales en Posesión de Sujetos Obligados, la Ley de Protección de Datos Personales en Posesión de los Sujetos Obligados del Estado de Zacatecas y demás normatividad que resulte aplicable.',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '¿Para qué fines utilizaremos tus datos personales?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Nos interesa conocer cuál ha sido tu experiencia dentro de esta institución educativa con el objetivo de poder ofrecerte mejores condiciones de estudio y servicios educativos mediante el programa de Seguimiento de Trayectorias Escolares y la Subsede del CASE del Programa Académico y, por ende, formar recursos humanos más competitivos y con mayores valores, habilidades y destrezas en el campo de estudio. Para las finalidades anteriores se recabarán los siguientes datos personales: nombre completo, correo electrónico, género, matrícula escolar y de manera general los recursos materiales y económicos con los que cuentas para estudiar, así como datos personales sensibles relacionados con tus emociones.',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '¿Con quién compartimos tus datos personales y para qué fines?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Tus datos personales no serán transferidos, salvo que sea necesario atender un requerimiento de información de una autoridad competente, que esté debidamente fundado y motivado.\n\n'
                    'Si deseas conocer nuestro Aviso de Privacidad Integral, lo podrás consultar en: http://transparencia.uaz.edu.mx Última actualización 07/10/2021.\n\n'
                    'Programa de seguimiento de Trayectorias Escolares. CASE-UAZ.',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Cerrar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

    bool isValidEmail(String email) {
      // A more robust regular expression for validating email addresses.
      final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[a-z]{2,})$');

      // Additional check to exclude email addresses like "5@5.5".
      final validEmail = emailRegex.hasMatch(email);

      // Check if the email has the "@uaz.edu.mx"  domain.
      final isUazEmail = email.endsWith("@uaz.edu.mx");

      return validEmail || isUazEmail;
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

    Future<void> registerUser(String correo, String password) async {
      String baseUrl = dotenv.env['API_BASE_URL_BD'] ?? "default_base_url";
      String loginEndpoint =
          dotenv.env['REGISTER_ENDPOINT'] ?? "/defaultEndpoint1";
      String apiUrl = baseUrl + loginEndpoint;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(
                  0xff927249), // The color to use for text and icons on the background color
            ),
          );
        },
      );
      try {
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'correo': correo, 'password': password}),
        );

        if (response.statusCode == 200) {
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          final String token = responseData['token'];
          final String userId = responseData['userId'].toString();
          await _secureStorage.write(key: 'id', value: userId);
          await _secureStorage.write(key: 'token', value: token);
          Navigator.pop(context);
          // Navigate to Dashboard
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Dashboard()),
          );

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.grey.shade500,
            content: const Center(child: Text('Registro exitoso!')),
          ));
        } else {
          Navigator.pop(context);
          snackbarRed('Registro fallido. ${response.statusCode}');
        }
      } catch (error) {
        Navigator.pop(context);
        snackbarRed("Registro fallido, vuelve a intentarlo.");
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
          buildInputField('Confirmar contraseña', _confirmPasswordController,
              true, TextInputType.text, screenWidth),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: GestureDetector(
              onTap: () async {
                if (_emailController.text.trim().isEmpty) {
                  snackbarRed("El correo electrónico no puede estar vacío");
                  return;
                }
                if (!isValidEmail(_emailController.text.trim())) {
                  snackbarRed('Ingresa un correo electrónico válido');
                  return;
                }
                if ((_passwordController.text.trim().isEmpty) ||
                    (_confirmPasswordController.text.trim().isEmpty)) {
                  snackbarRed("La contraseña no puede estar vacía");
                  return;
                }
                if (_passwordController.text.trim() !=
                    _confirmPasswordController.text.trim()) {
                  snackbarRed("Las contraseñas no coinciden");
                  return;
                }

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
                      MaterialPageRoute(builder: (context) => const Login()));
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
            onPressed: () {
              _showPrivacyPolicy();
            },
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
