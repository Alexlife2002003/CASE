import 'package:case_cuestionario/screens/dashboard.dart';
import 'package:case_cuestionario/utils/WidgetBuilderHelper.dart';
import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:case_cuestionario/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class serviciosUnidad extends StatefulWidget {
  const serviciosUnidad({super.key});

  @override
  State<serviciosUnidad> createState() => _serviciosUnidadState();
}

class _serviciosUnidadState extends State<serviciosUnidad> {
  late Future<Map<String, dynamic>> apiDataFuture;
  Map<String, dynamic> answers = {};
  Map<String, dynamic> questions = {};
  String valorNoEncontrado = "VALOR NO ENCONTRADO";

  List<DatosDeTabla> tablapregunta69 = [];
  List<String> respuesta69 = [];
  String? _selectedPregunta70;
  String? _selectedPregunta71;
  String? _selectedPregunta72;
  String? _selectedPregunta73;
  String? _selectedPregunta74;
  String? _selectedPregunta75;
  String? _selectedPregunta76;
  final _selectedPregunta77Controller = TextEditingController();
  final _selectedPregunta78Controller = TextEditingController();
  String? _selectedPregunta79;
  String? _selectedPregunta80;

  String? authToken = "";
  String? userId = "";
  final _secureStorage = const FlutterSecureStorage();

  void rebuild() {
    setState(() {});
  }

  Future<void> addServiciosUnidad() async {
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
    String Endpoint = dotenv.env['ADD_SERVICIOS_UNIDAD'] ?? "/defaultEndpoint1";
    String url = baseUrl + Endpoint;
    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $authToken',
            'Content-Type': 'application/json'
          },
          body: jsonEncode({
            'userId': userId,
            'pregunta69_impresion': respuesta69[0],
            'pregunta69_fotocopiado': respuesta69[1],
            'pregunta69_digitalizacion': respuesta69[2],
            'pregunta70': _selectedPregunta70,
            'pregunta71': _selectedPregunta71,
            'pregunta72': _selectedPregunta72,
            'pregunta73': _selectedPregunta73,
            'pregunta74': _selectedPregunta74,
            'pregunta75': _selectedPregunta75,
            'pregunta76': _selectedPregunta76,
            'pregunta77': _selectedPregunta77Controller.text.trim(),
            'pregunta78': _selectedPregunta78Controller.text.trim(),
            'pregunta79': _selectedPregunta79,
            'pregunta80': _selectedPregunta80
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
    String endpoint = dotenv.env['SERVICIOS_UNIDAD'] ?? "/defaultEndpoint1";

    final response = await http.get(Uri.parse(baseUrl + endpoint));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          Map<String, dynamic>.from(json.decode(response.body));
      setState(() {
        questions = data['questions'];
        answers = data['answers'];
        for (var option in answers['respuesta69columna']) {
          tablapregunta69.add(DatosDeTabla(aspect: option, answer: ''));
        }
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
                title: 'Servicios Unidad',
                content: const Scaffold(
                  body: Center(child: CircularProgressIndicator( color: Color(
                0xff927249),)),
                ));
          } else if (snapshot.hasError) {
            return AppWithDrawer(
                title: 'Servicios Unidad',
                content: Scaffold(
                  body: Center(child: Text('Error: ${snapshot.error}')),
                ));
          } else {
            return AppWithDrawer(
                title: 'Servicios Unidad',
                content: Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildText(
                              questions['pregunta69'] ?? valorNoEncontrado),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              dataRowHeight: 60,
                              columns: [
                                const DataColumn(label: Text('Aspecto')),
                                for (var label in answers['respuesta69fila'])
                                  DataColumn(label: Text(label)),
                              ],
                              rows: tablapregunta69.map((experiencia) {
                                return DataRow(cells: [
                                  DataCell(SizedBox(
                                    width: 150,
                                    child: Text(experiencia.aspect),
                                  )),
                                  for (var label in answers['respuesta69fila'])
                                    helper.buildRadioCell(
                                      value: label,
                                      groupValue: experiencia.answer,
                                      onChanged: (value) {
                                        setState(() {
                                          experiencia.answer = value;
                                        });
                                      },
                                    ),
                                ]);
                              }).toList(),
                            ),
                          ),
                          buildText(
                              questions['pregunta70'] ?? valorNoEncontrado),
                          Column(
                            children: [
                              for (var option in answers['respuesta70'] ??
                                  [valorNoEncontrado])
                                helper.buildRadioButton(
                                    option, option, _selectedPregunta70,
                                    (value) {
                                  setState(() {
                                    _selectedPregunta70 = value;
                                  });
                                }),
                            ],
                          ),
                          buildText(
                              questions['pregunta71'] ?? valorNoEncontrado),
                          Column(
                            children: [
                              for (var option in answers['respuesta71'] ??
                                  [valorNoEncontrado])
                                helper.buildRadioButton(
                                    option, option, _selectedPregunta71,
                                    (value) {
                                  setState(() {
                                    _selectedPregunta71 = value;
                                  });
                                }),
                            ],
                          ),
                          buildText(
                              questions['pregunta72'] ?? valorNoEncontrado),
                          Row(
                            children: [
                              for (var option in answers['respuesta72'] ??
                                  [valorNoEncontrado])
                                helper.buildRadioButtonRow(
                                    option, option, _selectedPregunta72,
                                    (value) {
                                  setState(() {
                                    _selectedPregunta72 = value;
                                  });
                                }),
                            ],
                          ),
                          buildText(
                              questions['pregunta73'] ?? valorNoEncontrado),
                          Column(
                            children: [
                              for (var option in answers['respuesta73'] ??
                                  [valorNoEncontrado])
                                helper.buildRadioButton(
                                    option, option, _selectedPregunta73,
                                    (value) {
                                  setState(() {
                                    _selectedPregunta73 = value;
                                  });
                                }),
                            ],
                          ),
                          buildText(
                              questions['pregunta74'] ?? valorNoEncontrado),
                          Column(
                            children: [
                              for (var option in answers['respuesta74'] ??
                                  [valorNoEncontrado])
                                helper.buildRadioButton(
                                    option, option, _selectedPregunta74,
                                    (value) {
                                  setState(() {
                                    _selectedPregunta74 = value;
                                  });
                                }),
                            ],
                          ),
                          buildText(
                              questions['pregunta75'] ?? valorNoEncontrado),
                          Column(
                            children: [
                              for (var option in answers['respuesta75'] ??
                                  [valorNoEncontrado])
                                helper.buildRadioButton(
                                    option, option, _selectedPregunta75,
                                    (value) {
                                  setState(() {
                                    _selectedPregunta75 = value;
                                  });
                                }),
                            ],
                          ),
                          buildText(
                              questions['pregunta76'] ?? valorNoEncontrado),
                          Row(
                            children: [
                              for (var option in answers['respuesta76'] ??
                                  [valorNoEncontrado])
                                helper.buildRadioButtonRow(
                                    option, option, _selectedPregunta76,
                                    (value) {
                                  setState(() {
                                    _selectedPregunta76 = value;
                                  });
                                }),
                            ],
                          ),
                          buildText(
                              questions['pregunta77'] ?? valorNoEncontrado),
                          helper.buildInputField(
                              'Materia', _selectedPregunta77Controller),
                          buildText(
                              questions['pregunta78'] ?? valorNoEncontrado),
                          helper.buildInputField(
                              'Materia', _selectedPregunta78Controller),
                          buildText(
                              questions['pregunta79'] ?? valorNoEncontrado),
                          Row(
                            children: [
                              for (var option in answers['respuesta79'] ??
                                  [valorNoEncontrado])
                                helper.buildRadioButtonRow(
                                    option, option, _selectedPregunta79,
                                    (value) {
                                  setState(() {
                                    _selectedPregunta79 = value;
                                  });
                                }),
                            ],
                          ),
                          buildText(
                              questions['pregunta80'] ?? valorNoEncontrado),
                          Row(
                            children: [
                              for (var option in answers['respuesta80'] ??
                                  [valorNoEncontrado])
                                helper.buildRadioButtonRow(
                                    option, option, _selectedPregunta80,
                                    (value) {
                                  setState(() {
                                    _selectedPregunta80 = value;
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
                            respuesta69 = [];
                            for (DatosDeTabla x in tablapregunta69) {
                              respuesta69.add(x.answer);
                            }

                            // Verificar si la respuesta a la pregunta 69, aspecto "Impresión", está vacía
                            if (respuesta69[0].isEmpty) {
                              snackbarRed(
                                  'Por favor, responde al aspecto "Impresión".');
                              return;
                            }

// Verificar si la respuesta a la pregunta 69, aspecto "Fotocopiado", está vacía
                            if (respuesta69[1].isEmpty) {
                              snackbarRed(
                                  'Por favor, responde al aspecto "Fotocopiado".');
                              return;
                            }

// Verificar si la respuesta a la pregunta 69, aspecto "Digitalización", está vacía
                            if (respuesta69[2].isEmpty) {
                              snackbarRed(
                                  'Por favor, responde al aspecto "Digitalización".');
                              return;
                            }

// Verificar si se ha seleccionado la respuesta a la pregunta 70
                            if (_selectedPregunta70 == null) {
                              snackbarRed(
                                  'Por favor, responde cómo calificas la biblioteca.');
                              return;
                            }

                            // Verificar si se ha seleccionado la respuesta a la pregunta 71
                            if (_selectedPregunta71 == null) {
                              snackbarRed(
                                  "Por favor, califica el mobiliario de la unidad.");
                              return;
                            }

// Verificar si se ha seleccionado la respuesta a la pregunta 72
                            if (_selectedPregunta72 == null) {
                              snackbarRed(
                                  "Por favor, indica el área que requiere atención.");
                              return;
                            }

// Verificar si se ha seleccionado la respuesta a la pregunta 73
                            if (_selectedPregunta73 == null) {
                              snackbarRed(
                                  "Por favor, indica cómo calificarías a la planta docente.");
                              return;
                            }

// Verificar si se ha seleccionado la respuesta a la pregunta 74
                            if (_selectedPregunta74 == null) {
                              snackbarRed(
                                  "Por favor, responde cómo calificarías el sistema de enseñanza-aprendizaje.");
                              return;
                            }

                            // Verificar si se ha seleccionado la respuesta a la pregunta 75
                            if (_selectedPregunta75 == null) {
                              snackbarRed(
                                  "Por favor, responde cómo calificarías los servicios educativos.");
                              return;
                            }

// Verificar si se ha seleccionado la respuesta a la pregunta 76
                            if (_selectedPregunta76 == null) {
                              snackbarRed(
                                  "Por favor, indica si consideras reestructurar materias.");
                              return;
                            }

// Verificar si el campo de texto de la pregunta 77 está vacío
                            if (_selectedPregunta77Controller.text
                                .trim()
                                .isEmpty) {
                              snackbarRed(
                                  "Por favor, indica las materias que no son tan indispensables.");
                              return;
                            }

// Verificar si el campo de texto de la pregunta 78 está vacío
                            if (_selectedPregunta78Controller.text
                                .trim()
                                .isEmpty) {
                              snackbarRed(
                                  "Por favor, indica qué materias agregarías.");
                              return;
                            }

                            // Verificar si se ha seleccionado la respuesta a la pregunta 79
                            if (_selectedPregunta79 == null) {
                              snackbarRed(
                                  "Por favor, responde si agregarías materias.");
                              return;
                            }

// Verificar si se ha seleccionado la respuesta a la pregunta 80
                            if (_selectedPregunta80 == null) {
                              snackbarRed(
                                  "Por favor, indica si actualizarías alguna materia.");
                              return;
                            }

                            await addServiciosUnidad();
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
