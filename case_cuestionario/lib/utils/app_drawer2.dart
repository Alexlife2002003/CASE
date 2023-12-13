import 'package:case_cuestionario/screens/Cuestionarios/datos_generales.dart';
import 'package:case_cuestionario/screens/Cuestionarios/idioma.dart';
import 'package:case_cuestionario/screens/Cuestionarios/incorporacion.dart';
import 'package:case_cuestionario/screens/Users/login.dart';
import 'package:case_cuestionario/screens/dashboard.dart';
import 'package:flutter/material.dart';

class homePage2 extends StatefulWidget {
  @override
  _homePage2State createState() => _homePage2State();
}

class _homePage2State extends State<homePage2> {
  int _currentIndex = 0;
  String title = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon:const Icon(Icons.person))],
      ),
      drawer: AppDrawer(
        onIndexChanged: (index, pageTitle) {
          setState(() {
            _currentIndex = index;
            title = pageTitle;
          });
          Navigator.pop(context);
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          Dashboard(),
          datosGenerales(),
          Incorporacion(),
          Idioma(),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final Function(int, String) onIndexChanged;

  AppDrawer({required this.onIndexChanged});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => onIndexChanged(0, "Dashboard"),
                  child: Image.asset(
                    'lib/assets/case-logo.png',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(Icons.check_box_outline_blank),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Datos generales', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    onTap: () => onIndexChanged(1, "Datos Generales"),
                  ),
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(Icons.check_box_outline_blank),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Incorporacion, medios \ny recursos',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    onTap: () => onIndexChanged(2, "Incorporacion"),
                  ),
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(Icons.check_box_outline_blank),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Area profesional',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    onTap: () => onIndexChanged(0, "Idioma"),
                  ),
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(Icons.check_box_outline_blank),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Idioma', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    onTap: () => onIndexChanged(3, "Idioma"),
                  ),
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(Icons.check_box_outline_blank),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Servicios Case', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    onTap: () => onIndexChanged(0, "Idioma"),
                  ),
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(Icons.check_box_outline_blank),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Motivos de desercion \ny abandono escolar',
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    onTap: () => onIndexChanged(0, "Idioma"),
                  ),
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(Icons.check_box_outline_blank),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Salud mental', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    onTap: () => onIndexChanged(0, "Idioma"),
                  ),
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(Icons.check_box_outline_blank),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Conectividad e \ninfraestructura',
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    onTap: () => onIndexChanged(0, "Idioma"),
                  ),
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(Icons.check_box_outline_blank),
                        SizedBox(
                          width: 10,
                        ),
                        Text(' Servicios de la \nunidad academica',
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    onTap: () => onIndexChanged(0, "Idioma"),
                  ),
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Cerrar sesión',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
