import 'package:case_cuestionario/screens/Users/Login.dart';
import 'package:flutter/material.dart';

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
    double screenheight = MediaQuery.of(context).size.height;
    Widget buildInputField(String hintText, TextEditingController controller,
        bool obscureText, TextInputType inputType, double screenWidth) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: TextField(
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
      body: Container(
        child: SingleChildScrollView(
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
                onTap: () {},
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text(
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
      ),
    );
  }
}
