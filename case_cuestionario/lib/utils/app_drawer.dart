import 'dart:convert';
import 'package:case_cuestionario/screens/Cuestionarios/abandono_escolar.dart';
import 'package:case_cuestionario/screens/Cuestionarios/area_profesional.dart';
import 'package:case_cuestionario/screens/Cuestionarios/conectividad.dart';
import 'package:case_cuestionario/screens/Cuestionarios/datos_generales.dart';
import 'package:case_cuestionario/screens/Cuestionarios/idioma.dart';
import 'package:case_cuestionario/screens/Cuestionarios/incorporacion.dart';
import 'package:case_cuestionario/screens/Cuestionarios/salud_mental.dart';
import 'package:case_cuestionario/screens/Cuestionarios/servicios_case.dart';
import 'package:case_cuestionario/screens/Cuestionarios/servicios_unidad.dart';
import 'package:flutter/material.dart';
import 'package:case_cuestionario/screens/Users/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AppWithDrawer extends StatefulWidget {
  final String title;
  final Widget content;

  AppWithDrawer({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  _AppWithDrawerState createState() => _AppWithDrawerState();
}

class _AppWithDrawerState extends State<AppWithDrawer> {
  bool _datosGenerales = false;
  bool _incorporacion = false;
  final _secureStorage = FlutterSecureStorage();
  String? userId;
  @override
  void initState() {
    super.initState();
    checkDatosGenerales();
    checkIncorporacion();
  }

  Future<void> checkDatosGenerales() async {
    final String url = 'http://192.168.1.76:3000/revisarDatosGenerales';
    userId = await _secureStorage.read(key: 'id');
    try {
      final response = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'userId': userId,
          }));

      if (response.statusCode == 200) {
        setState(() {
          _datosGenerales = true;
        });
      }
    } catch (e) {
      // Handle network or other errors
    }
  }

  Future<void> checkIncorporacion() async {
    final String url = 'http://192.168.1.76:3000/revisarIncorporacion';
    userId = await _secureStorage.read(key: 'id');
    try {
      final response = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'userId': userId,
          }));
      if (response.statusCode == 200) {
        setState(() {
          _incorporacion = true;
        });
      }
    } catch (e) {
      //Handle network or other errors
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: screenWidth / 2,
              child: DrawerHeader(
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/case-logo.png',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            _datosGenerales
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Datos generales',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {
                        if (_datosGenerales == false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const datosGenerales(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: Colors.grey,
                            content: Center(
                                child: Text(
                              'Ya se encuentra con respuestas',
                              style: TextStyle(fontSize: 18),
                            )),
                          ));
                        }
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            _incorporacion
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Incorporacion, medios \ny recursos',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {
                        if (_incorporacion == false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Incorporacion(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: Colors.grey,
                            content: Center(
                                child: Text(
                              'Ya se encuentra con respuestas',
                              style: TextStyle(fontSize: 18),
                            )),
                          ));
                        }
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.check_box_outline_blank,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Area profesional',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const areaProfesional(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.check_box_outline_blank,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Idioma',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Idioma(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.check_box_outline_blank,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Servicios Case',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const serviciosCase(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.check_box_outline_blank,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Motivos de desercion \ny abandono escolar',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const abandonoEscolar(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.check_box_outline_blank,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Salud mental',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const saludMental(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.check_box_outline_blank,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Conectividad e \ninfraestructura',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const conectividad(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.check_box_outline_blank,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Servicios de la \nunidad academica',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const serviciosUnidad(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Row(
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
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const Login()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: widget.content,
    );
  }
}
