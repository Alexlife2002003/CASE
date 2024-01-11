import 'package:case_cuestionario/screens/dashboard.dart';
import 'package:case_cuestionario/utils/WidgetBuilderHelper.dart';
import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:case_cuestionario/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Incorporacion extends StatefulWidget {
  const Incorporacion({super.key});

  @override
  State<Incorporacion> createState() => _IncorporacionState();
}

class _IncorporacionState extends State<Incorporacion> {
  late Future<Map<String, dynamic>> apiDataFuture;
  Map<String, dynamic> answers = {};
  Map<String, dynamic> questions = {};
  String valorNoEncontrado = "VALOR NO ENCONTRADO";

  String? selectedRespuesta1;
  String? selectedRespuesta2;
  String? SelectedRespuesta3;
  bool escritorio = false;
  bool internet = false;
  bool impresora = false;
  bool calculadora = false;
  bool computadora = false;
  bool tablet = false;
  bool todas = false;
  String t_escritorio = "No";
  String t_internet = "No";
  String t_impresora = "No";
  String t_calculadora = "No";
  String t_computadora = "No";
  String t_tablet = "No";
  String? selectedRespuesta5;
  String? selectedRespuesta6;
  String? selectedRespuesta7;
  String? selectedRespuesta8;
  String? selectedRespuesta9;

  List<DatosDeTabla> tablapregunta10 = [];
  List<String> respuestapregunta10 = [];

  String? selectedRespuesta11;

  String? authToken = "";
  String? userId = "";
  final _secureStorage = const FlutterSecureStorage();

  void rebuild() {
    setState(() {});
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

  Future<void> addCorporacion() async {
    const String url = 'http://192.168.1.66:3000/addIncorporacion';

    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $authToken',
            'Content-Type': 'application/json'
          },
          body: jsonEncode({
            'userId': userId,
            'pregunta1': selectedRespuesta1,
            'pregunta2': selectedRespuesta2,
            'pregunta3': SelectedRespuesta3,
            'pregunta4_escritorio': t_escritorio,
            'pregunta4_internet': t_internet,
            'pregunta4_impresora': t_impresora,
            'pregunta4_calculadora': t_calculadora,
            'pregunta4_computadora': t_computadora,
            'pregunta4_tablet': t_tablet,
            'pregunta5': selectedRespuesta5,
            'pregunta6': selectedRespuesta6,
            'pregunta7': selectedRespuesta7,
            'pregunta8': selectedRespuesta8,
            'pregunta9': selectedRespuesta9,
            'pregunta10_exigencia_academica': respuestapregunta10[0],
            'pregunta10_ambiente_social': respuestapregunta10[1],
            'pregunta10_relacion_familia': respuestapregunta10[2],
            'pregunta10_relacion_maestros': respuestapregunta10[3],
            'pregunta10_relacion_companeros': respuestapregunta10[4],
            'pregunta11': selectedRespuesta11
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
        snackbarRed("Hubo un problema al agregar las respuestas. Por favor, inténtalo de nuevo.");

      }
    } catch (error) {
      snackbarRed('$error');
    }
  }

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(
        Uri.parse('https://case-408016.wl.r.appspot.com/datosIncorporacion'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          Map<String, dynamic>.from(json.decode(response.body));
      setState(() {
        questions = data['questions'];
        answers = data['answers'];
        for (var option in answers['respuesta10columna']) {
          tablapregunta10.add(DatosDeTabla(aspect: option, answer: ''));
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

  @override
  Widget build(BuildContext context) {
    WidgetBuilderHelper helper = WidgetBuilderHelper(context, rebuild);
    return FutureBuilder<Map<String, dynamic>>(
      future: apiDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AppWithDrawer(
            title: 'Incorporacion',
            content: const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (snapshot.hasError) {
          return AppWithDrawer(
            title: 'Incorporacion',
            content: Scaffold(
              body: Center(child: Text('Error:${snapshot.error}')),
            ),
          );
        } else {
          return AppWithDrawer(
            title: 'Incorporacion',
            content: Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildText(questions['pregunta1'] ?? valorNoEncontrado),
                      helper.buildDropdownDynamic(
                          'Seleccione uno',
                          selectedRespuesta1,
                          answers['respuesta1'] ?? [], (String? newValue) {
                        selectedRespuesta1 = newValue;
                      }),
                      buildText(questions['pregunta2'] ?? valorNoEncontrado),
                      Column(
                        children: [
                          for (var option
                              in answers['respuesta2'] ?? [valorNoEncontrado])
                            helper.buildRadioButton(
                                option, option, selectedRespuesta2, (value) {
                              setState(() {
                                selectedRespuesta2 = value;
                              });
                            }),
                        ],
                      ),
                      buildText(questions['pregunta3'] ?? valorNoEncontrado),
                      Row(
                        children: [
                          for (var option
                              in answers['respuesta3'] ?? [valorNoEncontrado])
                            helper.buildRadioButtonRow(
                                option, option, SelectedRespuesta3, (value) {
                              setState(() {
                                SelectedRespuesta3 = value;
                              });
                            }),
                        ],
                      ),
                      buildText(questions['pregunta4'] ?? valorNoEncontrado),
                      Column(
                        children: [
                          helper.buildCheckboxRow('escritorio', escritorio,
                              (value) {
                            setState(() {
                              escritorio = value!;
                            });
                          }),
                          helper.buildCheckboxRow('internet', internet,
                              (value) {
                            setState(() {
                              internet = value!;
                            });
                          }),
                          helper.buildCheckboxRow('impresora', impresora,
                              (value) {
                            setState(() {
                              impresora = value!;
                            });
                          }),
                          helper.buildCheckboxRow('calculadora', calculadora,
                              (value) {
                            setState(() {
                              calculadora = value!;
                            });
                          }),
                          helper.buildCheckboxRow('computadora', computadora,
                              (value) {
                            setState(() {
                              computadora = value!;
                            });
                          }),
                          helper.buildCheckboxRow('tablet', tablet, (value) {
                            setState(() {
                              tablet = value!;
                            });
                          }),
                          helper.buildCheckboxRow('todas las anteriores', todas,
                              (value) {
                            setState(() {
                              todas = value!;
                            });
                          }),
                        ],
                      ),
                      buildText(questions['pregunta5'] ?? valorNoEncontrado),
                      Column(
                        children: [
                          for (var option
                              in answers['respuesta5'] ?? [valorNoEncontrado])
                            helper.buildRadioButton(
                                option, option, selectedRespuesta5, (value) {
                              setState(() {
                                selectedRespuesta5 = value;
                              });
                            }),
                        ],
                      ),
                      buildText(questions['pregunta6'] ?? valorNoEncontrado),
                      helper.buildDropdownDynamic(
                          'Seleccione uno',
                          selectedRespuesta6,
                          answers['respuesta6'] ?? [], (String? newValue) {
                        selectedRespuesta6 = newValue;
                      }),
                      buildText(questions['pregunta7'] ?? valorNoEncontrado),
                      helper.buildDropdownDynamic(
                          'Seleccione uno',
                          selectedRespuesta7,
                          answers['respuesta7'] ?? [], (String? newValue) {
                        selectedRespuesta7 = newValue;
                      }),
                      buildText(questions['pregunta8'] ?? valorNoEncontrado),
                      Row(
                        children: [
                          for (var option
                              in answers['respuesta8'] ?? [valorNoEncontrado])
                            helper.buildRadioButtonRow(
                                option, option, selectedRespuesta8, (value) {
                              setState(() {
                                selectedRespuesta8 = value;
                              });
                            }),
                        ],
                      ),
                      buildText(questions['pregunta9'] ?? valorNoEncontrado),
                      Row(
                        children: [
                          for (var option
                              in answers['respuesta9'] ?? [valorNoEncontrado])
                            helper.buildRadioButtonRow(
                                option, option, selectedRespuesta9, (value) {
                              setState(() {
                                selectedRespuesta9 = value;
                              });
                            }),
                        ],
                      ),
                      buildText(questions['pregunta10'] ?? valorNoEncontrado),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          dataRowHeight: 60,
                          columns: [
                            const DataColumn(label: Text('Aspecto')),
                            for (var label in answers['respuesta10fila'])
                              DataColumn(label: Text(label)),
                          ],
                          rows: tablapregunta10.map((experiencia) {
                            return DataRow(cells: [
                              DataCell(SizedBox(
                                width: 150,
                                child: Text(experiencia.aspect),
                              )),
                              for (var label in answers['respuesta10fila'])
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
                      const SizedBox(
                        height: 15,
                      ),
                      buildText(questions['pregunta11'] ?? valorNoEncontrado),
                      Column(
                        children: [
                          for (var option
                              in answers['respuesta11'] ?? [valorNoEncontrado])
                            helper.buildRadioButton(
                                option, option, selectedRespuesta11, (value) {
                              setState(() {
                                selectedRespuesta11 = value;
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
                        if (todas) {
                          t_escritorio = "SI";
                          t_internet = "Si";
                          t_impresora = "Si";
                          t_calculadora = "Si";
                          t_computadora = "Si";
                          t_tablet = "Si";
                        } else {
                          if (escritorio) {
                            t_escritorio = "SI";
                          }
                          if (internet) {
                            t_internet = "Si";
                          }
                          if (impresora) {
                            t_impresora = "Si";
                          }
                          if (calculadora) {
                            t_calculadora = "Si";
                          }
                          if (computadora) {
                            t_computadora = "Si";
                          }
                          if (tablet) {
                            t_tablet = "Si";
                          }
                        }
                        respuestapregunta10 = [];
                        for (DatosDeTabla x in tablapregunta10) {
                          respuestapregunta10.add(x.answer);
                        }
                       // Verificar si se ha seleccionado la respuesta 1
if (selectedRespuesta1 == null) {
  snackbarRed('Por favor, indica cómo te enteraste de la licenciatura.');
  return;
}

// Verificar si se ha seleccionado la respuesta 2
if (selectedRespuesta2 == null) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      backgroundColor: Colors.red,
      content: Center(
        child: Text(
          'Por favor, indica el nivel de importancia de las actividades escolares en tu familia.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    ),
  );
  return;
}

                       // Verificar si se ha seleccionado la respuesta 3
if (selectedRespuesta3 == null) {
  snackbarRed('Por favor, responde si cuentas con un espacio para estudiar.');
  return;
}

// Verificar si al menos un medio ha sido seleccionado
if (!escritorio && !internet && !impresora && !calculadora && !computadora && !tablet && !todas) {
  snackbarRed('Por favor, indica con qué medios cuentas para estudiar.');
  return;
}

// Verificar si se ha seleccionado la respuesta 5
if (selectedRespuesta5 == null) {
  snackbarRed('Por favor, responde sobre los recursos económicos con los que cuentas.');
  return;
}

                       // Verificar si se ha seleccionado la respuesta 6
if (selectedRespuesta6 == null) {
  snackbarRed('Por favor, indica el medio de transporte que utilizas.');
  return;
}

// Verificar si se ha seleccionado la respuesta 7
if (selectedRespuesta7 == null) {
  snackbarRed('Por favor, indica cuánto tiempo tardas en llegar a la escuela.');
  return;
}

// Verificar si se ha seleccionado la respuesta 8
if (selectedRespuesta8 == null) {
  snackbarRed('Por favor, responde si conoces al CEBUAZ.');
  return;
}

// Verificar si se ha seleccionado la respuesta 9
if (selectedRespuesta9 == null) {
  snackbarRed('Por favor, responde si utilizas el CEBUAZ.');
  return;
}


                     // Verificar si la respuesta a la pregunta 10, aspecto de exigencia académica, está vacía
if (respuestapregunta10[0].isEmpty) {
  snackbarRed('Por favor, responde al aspecto de exigencia académica.');
  return;
}

// Verificar si la respuesta a la pregunta 10, aspecto de ambiente social, está vacía
if (respuestapregunta10[1].isEmpty) {
  snackbarRed('Por favor, responde al aspecto de ambiente social.');
  return;
}

// Verificar si la respuesta a la pregunta 10, aspecto de relación con la familia, está vacía
if (respuestapregunta10[2].isEmpty) {
  snackbarRed('Por favor, responde al aspecto de relación con la familia.');
  return;
}

                        // Verificar si la respuesta a la pregunta 10, aspecto de relación con los maestros, está vacía
if (respuestapregunta10[3].isEmpty) {
  snackbarRed('Por favor, responde al aspecto de relación con los maestros.');
  return;
}

// Verificar si la respuesta a la pregunta 10, aspecto de relación con peers, está vacía
if (respuestapregunta10[4].isEmpty) {
  snackbarRed('Por favor, responde al aspecto de relación con compañeros.');
  return;
}

// Verificar si se ha seleccionado la respuesta a la pregunta 11
if (selectedRespuesta11 == null) {
  snackbarRed('Por favor, responde a la experiencia obtenida hasta la fecha.');
  return;
}

                        await addCorporacion();
                      })
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
