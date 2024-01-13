import 'package:case_cuestionario/screens/dashboard.dart';
import 'package:case_cuestionario/utils/WidgetBuilderHelper.dart';
import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:case_cuestionario/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class serviciosCase extends StatefulWidget {
  const serviciosCase({super.key});

  @override
  State<serviciosCase> createState() => _serviciosCaseState();
}

class _serviciosCaseState extends State<serviciosCase> {
  late Future<Map<String, dynamic>> apiDataFuture;
  Map<String, dynamic> answers = {};
  Map<String, dynamic> questions = {};

  String? _selectedPregunta45;
  String? _selectedPregunta46;
  String? _selectedPregunta47;
  String? _selectedPregunta48;
  String? _selectedPregunta49;

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

  Future<void> addServiciosCase() async {
    String baseUrl = dotenv.env['API_BASE_URL_BD'] ?? "default_base_url";
    String loginEndpoint =
        dotenv.env['ADD_SERVICIOS_CASE'] ?? "/defaultEndpoint1";
    String url = baseUrl + loginEndpoint;
    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $authToken',
            'Content-Type': 'application/json'
          },
          body: jsonEncode({
            'userId': userId,
            'pregunta45': _selectedPregunta45,
            'pregunta46': _selectedPregunta46,
            'pregunta47': _selectedPregunta47,
            'pregunta48': _selectedPregunta48,
            'pregunta49': _selectedPregunta49
          }));
      if (response.statusCode == 201) {
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
        snackbarRed(
            "Hubo un problema al agregar las respuestas. Por favor, inténtalo de nuevo.");
      }
    } catch (error) {
      snackbarRed('Error: $error');
    }
  }

  Future<Map<String, dynamic>> fetchData() async {
    String baseUrl = dotenv.env['BASE_URL'] ?? "default_base_url";
    String servicios_endpoint =
        dotenv.env['SERVICIOS_CASE'] ?? "/defaultEndpoint1";
    final response = await http.get(Uri.parse(baseUrl + servicios_endpoint));

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
                title: 'Servicios CASE',
                content: const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                ));
          } else if (snapshot.hasError) {
            return AppWithDrawer(
                title: 'Servicios CASE',
                content: Scaffold(
                  body: Center(
                    child: Text('Error: ${snapshot.error}'),
                  ),
                ));
          } else {
            return AppWithDrawer(
                title: 'Servicios CASE',
                content: Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildText(questions['pregunta45']),
                          Row(
                            children: [
                              for (var option in snapshot.data!['answers']
                                  ['respuesta45'])
                                helper.buildRadioButtonRow(
                                    option, option, _selectedPregunta45,
                                    (value) {
                                  setState(() {
                                    _selectedPregunta45 = value;
                                  });
                                }),
                            ],
                          ),
                          buildText(questions['pregunta46']),
                          helper.buildDropdownDynamic(
                              'Seleccione uno',
                              _selectedPregunta46,
                              answers['respuesta46'] ?? [], (String? newValue) {
                            _selectedPregunta46 = newValue;
                          }),
                          buildText(questions['pregunta47']),
                          helper.buildDropdownDynamic(
                              'Seleccione uno',
                              _selectedPregunta47,
                              answers['respuesta47'] ?? [], (String? newValue) {
                            _selectedPregunta47 = newValue;
                          }),
                          buildText(questions['pregunta48']),
                          Row(
                            children: [
                              for (var option in snapshot.data!['answers']
                                  ['respuesta48'])
                                helper.buildRadioButtonRow(
                                    option, option, _selectedPregunta48,
                                    (value) {
                                  setState(() {
                                    _selectedPregunta48 = value;
                                  });
                                }),
                            ],
                          ),
                          buildText(questions['pregunta49']),
                          Column(
                            children: [
                              for (var option in snapshot.data!['answers']
                                  ['respuesta49'])
                                helper.buildRadioButton(
                                    option, option, _selectedPregunta49,
                                    (value) {
                                  setState(() {
                                    _selectedPregunta49 = value;
                                  });
                                }),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          helper.buildGuardarButton(() async {
                            authToken = await _secureStorage.read(key: 'token');
                            userId = await _secureStorage.read(key: 'id');
                            if (_selectedPregunta45 == null) {
                              snackbarRed(
                                  'Por favor, responde si sabes lo que es el CASE');
                              return;
                            }
                            if (_selectedPregunta46 == null) {
                              snackbarRed(
                                  'Por favor, indica qué tipos de servicios has recibido por parte del CASE');
                              return;
                            }
                            if (_selectedPregunta47 == null) {
                              snackbarRed(
                                  'Por favor, indica en qué áreas requieres apoyo para que tu tránsito por la universidad sea óptimo');
                              return;
                            }
                            if (_selectedPregunta48 == null) {
                              snackbarRed(
                                  'Por favor, responde si cuentas con beca');
                              return;
                            }
                            if (_selectedPregunta49 == null) {
                              snackbarRed(
                                  'Por favor, responde si te apoyas en las mentorías que ofrece el programa académico');
                              return;
                            }

                            await addServiciosCase();
                          }),
                        ],
                      ),
                    ),
                  ),
                ));
          }
        });
  }
}
