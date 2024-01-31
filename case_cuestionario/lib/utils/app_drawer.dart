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
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
    String baseUrl = dotenv.env['API_BASE_URL_BD'] ?? "default_base_url";
    String Endpoint =
        dotenv.env['REVISAR_DATOS_GENERALES'] ?? "/defaultEndpoint1";
    String url = baseUrl + Endpoint;
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
    String baseUrl = dotenv.env['API_BASE_URL_BD'] ?? "default_base_url";
    String Endpoint =
        dotenv.env['REVISAR_INCORPORACION'] ?? "/defaultEndpoint1";
    String url = baseUrl + Endpoint;
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
    String baseUrl = dotenv.env['API_BASE_URL_BD'] ?? "default_base_url";
    String Endpoint =
        dotenv.env['REVISAR_AREA_PROFESIONAL'] ?? "/defaultEndpoint1";
    String url = baseUrl + Endpoint;
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
    String baseUrl = dotenv.env['API_BASE_URL_BD'] ?? "default_base_url";
    String Endpoint = dotenv.env['REVISAR_IDIOMA'] ?? "/defaultEndpoint1";
    String url = baseUrl + Endpoint;
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
    String baseUrl = dotenv.env['API_BASE_URL_BD'] ?? "default_base_url";
    String Endpoint =
        dotenv.env['REVISAR_SERVICIOS_CASE'] ?? "/defaultEndpoint1";
    String url = baseUrl + Endpoint;
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
    String baseUrl = dotenv.env['API_BASE_URL_BD'] ?? "default_base_url";
    String Endpoint =
        dotenv.env['REVISAR_ABANDONO_ESCOLAR'] ?? "/defaultEndpoint1";
    String url = baseUrl + Endpoint;
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
    String baseUrl = dotenv.env['API_BASE_URL_BD'] ?? "default_base_url";
    String Endpoint = dotenv.env['REVISAR_SALUD_MENTAL'] ?? "/defaultEndpoint1";
    String url = baseUrl + Endpoint;
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
    String baseUrl = dotenv.env['API_BASE_URL_BD'] ?? "default_base_url";
    String Endpoint = dotenv.env['REVISAR_CONECTIVIDAD'] ?? "/defaultEndpoint1";
    String url = baseUrl + Endpoint;
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
    String baseUrl = dotenv.env['API_BASE_URL_BD'] ?? "default_base_url";
    String Endpoint =
        dotenv.env['REVISAR_SERVICIOS_UNIDAD'] ?? "/defaultEndpoint1";
    String url = baseUrl + Endpoint;
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Image.asset(
                        'lib/assets/case-logo.png',
                      ),
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
                            'Incorporación, medios \ny recursos',
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
                            'Área profesional',
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
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Motivos de deserción \ny abandono escolar',
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
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
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
                        if (_conectividad == false) {
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
                            'Servicios de la \nUnidad académica',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {
                        if (_serviciosUnidad == false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const serviciosUnidad(),
                            ),
                          );
                        }
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
