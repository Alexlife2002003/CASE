import 'package:case_cuestionario/screens/dashboard.dart';
import 'package:case_cuestionario/utils/WidgetBuilderHelper.dart';
import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:case_cuestionario/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class conectividad extends StatefulWidget {
  const conectividad({super.key});

  @override
  State<conectividad> createState() => _conectividadState();
}

class _conectividadState extends State<conectividad> {
  late Future<Map<String, dynamic>> apiDataFuture;
  Map<String, dynamic> answers = {};
  Map<String, dynamic> questions = {};
  String valorNoEncontrado = "VALOR NO ENCONTRADO";

  String? _selectedPregunta65;
  String? _selectedPregunta66;
  String? _selectedPregunta67;
  String? _selectedPregunta68;

  String? authToken = "";
  String? userId = "";
  final _secureStorage = const FlutterSecureStorage();
  void rebuild() {
    setState(() {});
  }

  Future<void> addConectividad() async {
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
    String baseUrl = dotenv.env['API_BASE_URL_BD'] ?? "default_base_url";
    String Endpoint = dotenv.env['ADD_CONECTIVIDAD'] ?? "/defaultEndpoint1";
    String url = baseUrl + Endpoint;
    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $authToken',
            'Content-Type': 'application/json'
          },
          body: jsonEncode({
            'userId': userId,
            'pregunta65': _selectedPregunta65,
            'pregunta66': _selectedPregunta66,
            'pregunta67': _selectedPregunta67,
            'pregunta68': _selectedPregunta68
          }));
      if (response.statusCode == 201) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Center(
              child: Text(
            'Respuestas guardadas con éxito.',
            style: TextStyle(fontSize: 18),
          )),
        ));
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Dashboard()),
          (Route<dynamic> route) => false,
        );
      } else {
        // Handle error
        Navigator.pop(context);
        snackbarRed(
            "Hubo un problema al agregar las respuestas. Por favor, inténtalo de nuevo.");
      }
    } catch (error) {
      Navigator.pop(context);
      snackbarRed('Error: $error');
    }
  }

  Future<Map<String, dynamic>> fetchData() async {
    String baseUrl = dotenv.env['BASE_URL'] ?? "default_base_url";
    String endpoint = dotenv.env['CONECTIVIDAD'] ?? "/defaultEndpoint1";
    final response = await http.get(Uri.parse(baseUrl + endpoint));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          Map<String, dynamic>.from(json.decode(response.body));
      setState(() {
        questions = data['questions'];
        answers = data['answers'];
      });
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    apiDataFuture = fetchData();
  }

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

  @override
  Widget build(BuildContext context) {
    WidgetBuilderHelper helper = WidgetBuilderHelper(context, rebuild);
    return FutureBuilder<Map<String, dynamic>>(
        future: apiDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return AppWithDrawer(
                title: 'Conectividad',
                content: const Scaffold(
                  body: Center(child: CircularProgressIndicator( color: Color(
                0xff927249),)),
                ));
          } else if (snapshot.hasError) {
            return AppWithDrawer(
                title: 'Conectividad',
                content: Scaffold(
                  body: Center(child: Text('Error: ${snapshot.error}')),
                ));
          } else {
            return AppWithDrawer(
                title: 'Conectividad',
                content: Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildText(
                              questions['pregunta65'] ?? valorNoEncontrado),
                          Column(
                            children: [
                              for (var option in answers['respuesta65'] ??
                                  [valorNoEncontrado])
                                helper.buildRadioButton(
                                    option, option, _selectedPregunta65,
                                    (value) {
                                  setState(() {
                                    _selectedPregunta65 = value;
                                  });
                                }),
                            ],
                          ),
                          buildText(
                              questions['pregunta66'] ?? valorNoEncontrado),
                          Column(
                            children: [
                              for (var option in answers['respuesta66'] ??
                                  [valorNoEncontrado])
                                helper.buildRadioButton(
                                    option, option, _selectedPregunta66,
                                    (value) {
                                  setState(() {
                                    _selectedPregunta66 = value;
                                  });
                                }),
                            ],
                          ),
                          buildText(
                              questions['pregunta67'] ?? valorNoEncontrado),
                          Column(
                            children: [
                              for (var option in answers['respuesta67'] ??
                                  [valorNoEncontrado])
                                helper.buildRadioButton(
                                    option, option, _selectedPregunta67,
                                    (value) {
                                  setState(() {
                                    _selectedPregunta67 = value;
                                  });
                                }),
                            ],
                          ),
                          buildText(
                              questions['pregunta68'] ?? valorNoEncontrado),
                          Column(
                            children: [
                              for (var option in answers['respuesta68'] ??
                                  [valorNoEncontrado])
                                helper.buildRadioButton(
                                    option, option, _selectedPregunta68,
                                    (value) {
                                  setState(() {
                                    _selectedPregunta68 = value;
                                  });
                                }),
                            ],
                          ),
                          const SizedBox(height: 25),
                          helper.buildGuardarButton(() async {
                            authToken = await _secureStorage.read(key: 'token');
                            userId = await _secureStorage.read(key: 'id');
                            // Verificar si se ha seleccionado la respuesta a la pregunta 65
                            if (_selectedPregunta65 == null) {
                              snackbarRed(
                                  "Por favor, responde cómo consideras el servicio de internet de la unidad.");
                              return;
                            }

// Verificar si se ha seleccionado la respuesta a la pregunta 66
                            if (_selectedPregunta66 == null) {
                              snackbarRed(
                                  "Por favor, responde cómo consideras las instalaciones del centro de cómputo.");
                              return;
                            }

// Verificar si se ha seleccionado la respuesta a la pregunta 67
                            if (_selectedPregunta67 == null) {
                              snackbarRed(
                                  "Por favor, responde cómo consideras la higiene y limpieza del servicio de cafetería.");
                              return;
                            }

// Verificar si se ha seleccionado la respuesta a la pregunta 68
                            if (_selectedPregunta68 == null) {
                              snackbarRed(
                                  "Por favor, responde si consideras accesibles los precios de los alimentos.");
                              return;
                            }

                            await addConectividad();
                          })
                        ],
                      ),
                    ),
                  ),
                ));
          }
        });
  }
}
