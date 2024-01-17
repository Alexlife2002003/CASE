import 'package:case_cuestionario/screens/dashboard.dart';
import 'package:case_cuestionario/utils/WidgetBuilderHelper.dart';
import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:case_cuestionario/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Idioma extends StatefulWidget {
  const Idioma({super.key});

  @override
  State<Idioma> createState() => _IdiomaState();
}

class _IdiomaState extends State<Idioma> {
  late Future<Map<String, dynamic>> apiDataFuture;
  Map<String, dynamic> answers = {};
  Map<String, dynamic> questions = {};
  String? _selectedPregunta42;
  String? _selectedPregunta43;
  String? _selectedPregunta44;

  String? authToken = "";
  String? userId = "";
  final _secureStorage = const FlutterSecureStorage();

  void rebuild() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    apiDataFuture = fetchData();
  }

  Future<void> addIdioma() async {
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
    String Endpoint = dotenv.env['ADD_IDIOMA'] ?? "/defaultEndpoint1";
    String url = baseUrl + Endpoint;
    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $authToken',
            'Content-Type': 'application/json'
          },
          body: jsonEncode({
            'userId': userId,
            'pregunta42': _selectedPregunta42,
            'pregunta43': _selectedPregunta43,
            'pregunta44': _selectedPregunta44
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
    String idioma_endpoint = dotenv.env['IDIOMA'] ?? "/defaultEndpoint1";

    final response = await http.get(Uri.parse(baseUrl + idioma_endpoint));

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
            title: 'Idioma',
            content: const Scaffold(
              body: Center(
                child: CircularProgressIndicator(color: Color(0xff927249)),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return AppWithDrawer(
            title: 'Idioma',
            content: Scaffold(
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            ),
          );
        } else {
          return AppWithDrawer(
            title: 'Idioma',
            content: Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildText(snapshot.data!['questions']['pregunta42']),
                      Row(
                        children: [
                          for (var option in snapshot.data!['answers']
                              ['respuesta44'])
                            helper.buildRadioButtonRow(
                                option, option, _selectedPregunta42, (value) {
                              setState(() {
                                _selectedPregunta42 = value;
                              });
                            }),
                        ],
                      ),
                      buildText(snapshot.data!['questions']['pregunta43']),
                      Row(
                        children: [
                          for (var option in snapshot.data!['answers']
                              ['respuesta43'])
                            helper.buildRadioButtonRow(
                                option, option, _selectedPregunta43, (value) {
                              setState(() {
                                _selectedPregunta43 = value;
                              });
                            }),
                        ],
                      ),
                      buildText(snapshot.data!['questions']['pregunta44']),
                      Row(
                        children: [
                          for (var option in snapshot.data!['answers']
                              ['respuesta44'])
                            helper.buildRadioButtonRow(
                                option, option, _selectedPregunta44, (value) {
                              setState(() {
                                _selectedPregunta44 = value;
                              });
                            }),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      helper.buildGuardarButton(() async {
                        authToken = await _secureStorage.read(key: 'token');
                        userId = await _secureStorage.read(key: 'id');
                        // Verificar si se ha seleccionado la respuesta a la pregunta 42
                        if (_selectedPregunta42 == null) {
                          snackbarRed(
                              "Por favor, responde si tienes conocimiento del idioma inglés.");
                          return;
                        }

// Verificar si se ha seleccionado la respuesta a la pregunta 43
                        if (_selectedPregunta43 == null) {
                          snackbarRed(
                              "Por favor, responde si estudias inglés actualmente.");
                          return;
                        }

// Verificar si se ha seleccionado la respuesta a la pregunta 44
                        if (_selectedPregunta44 == null) {
                          snackbarRed(
                              "Por favor, responde si conoces opciones para estudiar inglés.");
                          return;
                        }

                        await addIdioma();
                      }),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
