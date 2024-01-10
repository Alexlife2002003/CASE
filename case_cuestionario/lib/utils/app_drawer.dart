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
  bool _areaProfesional = false;
  bool _idioma = false;
  bool _serviciosCase = false;
  bool _abandonoEscolar = false;
  bool _saludMental = false;
  bool _conectividad = false;
  bool _serviciosUnidad = false;
  final _secureStorage = const FlutterSecureStorage();
  String? userId;
  @override
  void initState() {
    super.initState();
    checkDatosGenerales();
    checkIncorporacion();
    checkAreaProfesional();
    checkIdioma();
    checkServiciosCase();
    checkAbandonoEscolar();
    checkSaludMental();
    checkConectividad();
    checkServiciosUnidad();
  }

  Future<void> checkDatosGenerales() async {
    const String url = 'http://192.168.1.66:3000/revisarDatosGenerales';
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
    const String url = 'http://192.168.1.66:3000/revisarIncorporacion';
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

  Future<void> checkAreaProfesional() async {
    const String url = 'http://192.168.1.66:3000/revisarAreaProfesional';
    userId = await _secureStorage.read(key: 'id');
    try {
      final response = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'userId': userId,
          }));
      if (response.statusCode == 200) {
        setState(() {
          _areaProfesional = true;
        });
      }
    } catch (e) {
      //Handle network or other errors
    }
  }

  Future<void> checkIdioma() async {
    const String url = 'http://192.168.1.66:3000/revisarIdioma';
    userId = await _secureStorage.read(key: 'id');
    try {
      final response = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'userId': userId,
          }));
      if (response.statusCode == 200) {
        setState(() {
          _idioma = true;
        });
      }
    } catch (e) {
      //Handle network or other errors
    }
  }

  Future<void> checkServiciosCase() async {
    const String url = 'http://192.168.1.66:3000/revisarServiciosCase';
    userId = await _secureStorage.read(key: 'id');
    try {
      final response = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'userId': userId,
          }));
      if (response.statusCode == 200) {
        setState(() {
          _serviciosCase = true;
        });
      }
    } catch (e) {
      //Handle network or other errors
    }
  }

  Future<void> checkAbandonoEscolar() async {
    const String url = 'http://192.168.1.66:3000/revisarAbandonoEscolar';
    userId = await _secureStorage.read(key: 'id');
    try {
      final response = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'userId': userId,
          }));
      if (response.statusCode == 200) {
        setState(() {
          _abandonoEscolar = true;
        });
      }
    } catch (e) {
      //Handle network or other errors
    }
  }

  Future<void> checkSaludMental() async {
    const String url = 'http://192.168.1.66:3000/revisarAbandonoEscolar';
    userId = await _secureStorage.read(key: 'id');
    try {
      final response = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'userId': userId,
          }));
      if (response.statusCode == 200) {
        setState(() {
          _saludMental = true;
        });
      }
    } catch (e) {
      //Handle network or other errors
    }
  }

  Future<void> checkConectividad() async {
    const String url = 'http://192.168.1.66:3000/revisarConectividad';
    userId = await _secureStorage.read(key: 'id');
    try {
      final response = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'userId': userId,
          }));
      if (response.statusCode == 200) {
        setState(() {
          _conectividad = true;
        });
      }
    } catch (e) {
      //Handle network or other errors
    }
  }

  Future<void> checkServiciosUnidad() async {
    const String url = 'http://192.168.1.66:3000/revisarServiciosUnidad';
    userId = await _secureStorage.read(key: 'id');
    try {
      final response = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'userId': userId,
          }));
      if (response.statusCode == 200) {
        setState(() {
          _serviciosUnidad = true;
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
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
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
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
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
                            _areaProfesional
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Area profesional',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {
                        if (_areaProfesional == false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const areaProfesional(),
                            ),
                          );
                        }
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            _idioma
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Idioma',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {
                        if (_idioma == false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Idioma(),
                            ),
                          );
                        }
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            _serviciosCase
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Servicios Case',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {
                        if (_serviciosCase == false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const serviciosCase(),
                            ),
                          );
                        }
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            _abandonoEscolar
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
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
                        if (_abandonoEscolar == false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const abandonoEscolar(),
                            ),
                          );
                        }
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            _saludMental
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
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
                        if (_saludMental == false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const saludMental(),
                            ),
                          );
                        }
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            _conectividad
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Conectividad e \ninfraestructura',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {
                       if(_conectividad==false){
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const conectividad(),
                          ),
                        );
                       }
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            _serviciosUnidad
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
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
