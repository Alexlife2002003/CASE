import 'package:case_cuestionario/screens/dashboard.dart';
import 'package:case_cuestionario/utils/WidgetBuilderHelper.dart';
import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:case_cuestionario/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class areaProfesional extends StatefulWidget {
  const areaProfesional({super.key});

  @override
  State<areaProfesional> createState() => _areaProfesionalState();
}

class _areaProfesionalState extends State<areaProfesional> {
  late Future<Map<String, dynamic>> apiDataFuture;
  Map<String, dynamic> answers = {};
  Map<String, dynamic> questions = {};
  String valorNoEncontrado = "VALOR NO ENCONTRADO";

  String? _selected_pregunta12;
  final _pregunta13Controller = TextEditingController();
  final _pregunta14Controller = TextEditingController();
  List<DatosDeTabla> tablapregunta15 = [];
  String? _selectedPregunta16;
  String? _selectedPregunta17;
  String? _selectedPregunta18;
  String? _selectedPregunta19;
  String? _selectedPregunta20;
  List<DatosDeTabla> tablapregunta21 = [];
  String? _selectedPregunta22;
  String? _selectedPregunta23;
  String? _selectedPregunta24;
  List<DatosDeTabla> tablapregunta25 = [];
  String? _selectedPregunta26;
  final _pregunta26Controller = TextEditingController();
  List<DatosDeTabla> tablapregunta27 = [];
  String? _selectedPregunta28;
  String? _selectedPregunta29;
  final _pregunta30Controller = TextEditingController();
  String? _selectedPregunta31;
  String? _selectedPregunta32;
  String? _selectedPregunta33;
  String? _selectedPregunta34;
  String? _selectedPregunta35;
  String? _selectedPregunta36;
  List<DatosDeTabla> tablapregunta37 = [];
  final _pregunta38Controller = TextEditingController();
  final _pregunta39Controller = TextEditingController();
  String? _selectedPregunta40;
  List<DatosDeTabla> tablapregunta41 = [];

  List<String> respuestapregunta15 = [];
  List<String> respuestapregunta21 = [];
  List<String> respuestapregunta25 = [];
  List<String> respuestapregunta27 = [];
  List<String> respuestapregunta37 = [];
  List<String> respuestapregunta41 = [];

  String? authToken = "";
  String? userId = "";
  final _secureStorage = const FlutterSecureStorage();

  void rebuild() {
    setState(() {});
  }

  Future<void> addAreaProfesional() async {
    const String url = 'http://192.168.1.66:3000/addAreaProfesional';
    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $authToken',
            'Content-Type': 'application/json'
          },
          body: jsonEncode({
            'userId': userId,
            'pregunta12': _selected_pregunta12,
            'pregunta13': _pregunta13Controller.text.trim(),
            'pregunta14': _pregunta14Controller.text.trim(),
            'pregunta15_extra': respuestapregunta15[0],
            'pregunta15_titulo': respuestapregunta15[1],
            'pregunta16': _selectedPregunta16,
            'pregunta17': _selectedPregunta17,
            'pregunta18': _selectedPregunta18,
            'pregunta19': _selectedPregunta19,
            'pregunta20': _selectedPregunta20,
            'pregunta21_maestro_expone': respuestapregunta21[0],
            'pregunta21_maestro_dicta': respuestapregunta21[1],
            'pregunta21_dinamicas_grupo': respuestapregunta21[2],
            'pregunta21_alumnos_exponen': respuestapregunta21[3],
            'pregunta21_maestro_pregunta': respuestapregunta21[4],
            'pregunta21_recursos_audiovisuales': respuestapregunta21[5],
            'pregunta21_recursos_informaticos': respuestapregunta21[6],
            'pregunta21_entrega_materiales': respuestapregunta21[7],
            'pregunta22': _selectedPregunta22,
            'pregunta23': _selectedPregunta23,
            'pregunta24': _selectedPregunta24,
            'pregunta25_articulos': respuestapregunta25[0],
            'pregunta25_bibliografia': respuestapregunta25[1],
            'pregunta25_internet': respuestapregunta25[2],
            'pregunta25_libros': respuestapregunta25[3],
            'pregunta26': _selectedPregunta26,
            'pregunta27_resumenes': respuestapregunta27[0],
            'pregunta27_fichas': respuestapregunta27[1],
            'pregunta27_esquemas': respuestapregunta27[2],
            'pregunta27_diagramas': respuestapregunta27[3],
            'pregunta27_cuadros': respuestapregunta27[4],
            'pregunta27_subrayar': respuestapregunta27[5],
            'pregunta27_mapa_mental': respuestapregunta27[6],
            'pregunta27_mapa_conceptual': respuestapregunta27[7],
            'pregunta28': _selectedPregunta28,
            'pregunta29': _selectedPregunta29,
            'pregunta30': _pregunta30Controller.text.trim(),
            'pregunta31': _selectedPregunta31,
            'pregunta32': _selectedPregunta32,
            'pregunta33': _selectedPregunta33,
            'pregunta34': _selectedPregunta34,
            'pregunta35': _selectedPregunta35,
            'pregunta36': _selectedPregunta36,
            'pregunta37_biblioteca': respuestapregunta37[0],
            'pregunta37_centro_computo': respuestapregunta37[1],
            'pregunta37_laboratorio': respuestapregunta37[2],
            'pregunta37_aulas': respuestapregunta37[3],
            'pregunta37_banos': respuestapregunta37[4],
            'pregunta37_comedor': respuestapregunta37[5],
            'pregunta37_limpieza': respuestapregunta37[6],
            'pregunta38': _pregunta38Controller.text.trim(),
            'pregunta39': _pregunta39Controller.text.trim(),
            'pregunta40': _selectedPregunta40,
            'pregunta41_diplomado': respuestapregunta41[0],
            'pregunta41_especialidad': respuestapregunta41[1],
            'pregunta41_maestria': respuestapregunta41[2],
            'pregunta41_doctorado': respuestapregunta41[3],
          }));

      final Map<String, dynamic> data = json.decode(response.body);
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
        snackbarRed(
            "Hubo un problema al agregar las respuestas. Por favor, inténtalo de nuevo.");
      }
    } catch (error) {
      snackbarRed("Error: $error");
    }
  }

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http
        .get(Uri.parse('https://case-408016.wl.r.appspot.com/areaProfesional'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          Map<String, dynamic>.from(json.decode(response.body));
      setState(() {
        questions = data['questions'];
        answers = data['answers'];
        for (var option in answers['respuesta15columna']) {
          tablapregunta15.add(DatosDeTabla(aspect: option, answer: ''));
        }
        for (var option in answers['respuesta21columna']) {
          tablapregunta21.add(DatosDeTabla(aspect: option, answer: ''));
        }
        for (var option in answers['respuesta25columna']) {
          tablapregunta25.add(DatosDeTabla(aspect: option, answer: ''));
        }
        for (var option in answers['respuesta27columna']) {
          tablapregunta27.add(DatosDeTabla(aspect: option, answer: ''));
        }
        for (var option in answers['respuesta37columna']) {
          tablapregunta37.add(DatosDeTabla(aspect: option, answer: ''));
        }
        for (var option in answers['respuesta41columna']) {
          tablapregunta41.add(DatosDeTabla(aspect: option, answer: ''));
        }
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
              title: 'Area profesional',
              content: const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ));
        } else if (snapshot.hasError) {
          return AppWithDrawer(
              title: 'Area profesioanl',
              content: Scaffold(
                body: Center(child: Text('Error:${snapshot.error}')),
              ));
        } else {
          return AppWithDrawer(
              title: 'Area profesional',
              content: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildText(questions['pregunta12'] ?? valorNoEncontrado),
                        Column(
                          children: [
                            for (var option in answers['respuesta12'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButton(
                                  option, option, _selected_pregunta12,
                                  (value) {
                                setState(() {
                                  _selected_pregunta12 = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['pregunta13'] ?? valorNoEncontrado),
                        helper.buildInputField(
                            'Materias', _pregunta13Controller),
                        const SizedBox(
                          height: 15,
                        ),
                        buildText(questions['pregunta14'] ?? valorNoEncontrado),
                        helper.buildInputField(
                            'Materias', _pregunta14Controller),
                        const SizedBox(
                          height: 15,
                        ),
                        buildText(questions['pregunta15'] ?? valorNoEncontrado),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            dataRowHeight: 60,
                            columns: [
                              const DataColumn(label: Text('Aspecto')),
                              for (var label
                                  in answers['respuesta15fila'] ?? [])
                                DataColumn(label: Text(label)),
                            ],
                            rows: tablapregunta15.map((option) {
                              return DataRow(cells: [
                                DataCell(SizedBox(
                                  width: 150,
                                  child: Text(option.aspect),
                                )),
                                for (var label
                                    in answers['respuesta15fila'] ?? [])
                                  helper.buildRadioCell(
                                    value: label,
                                    groupValue: option.answer,
                                    onChanged: (value) {
                                      setState(() {
                                        option.answer = value;
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
                        buildText(questions['pregunta16'] ?? valorNoEncontrado),
                        Row(
                          children: [
                            for (var option in answers['respuesta16'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButtonRow(
                                  option, option, _selectedPregunta16, (value) {
                                setState(() {
                                  _selectedPregunta16 = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['pregunta17'] ?? valorNoEncontrado),
                        helper.buildDropdownDynamic(
                            'Seleccione uno',
                            _selectedPregunta17,
                            answers['respuesta17'] ?? [], (String? newValue) {
                          _selectedPregunta17 = newValue;
                        }),
                        buildText(questions['pregunta18'] ?? valorNoEncontrado),
                        helper.buildDropdownDynamic(
                            'Seleccione uno',
                            _selectedPregunta18,
                            answers['respuesta18'] ?? [], (String? newValue) {
                          _selectedPregunta18 = newValue;
                        }),
                        buildText(questions['pregunta19'] ?? valorNoEncontrado),
                        Row(
                          children: [
                            for (var option in answers['respuesta19'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButtonRow(
                                  option, option, _selectedPregunta19, (value) {
                                setState(() {
                                  _selectedPregunta19 = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['pregunta20'] ?? valorNoEncontrado),
                        helper.buildDropdownDynamic(
                            'Seleccione uno',
                            _selectedPregunta20,
                            answers['respuesta20'] ?? [], (String? newValue) {
                          _selectedPregunta20 = newValue;
                        }),
                        buildText(questions['pregunta21'] ?? valorNoEncontrado),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            dataRowHeight: 60,
                            columns: [
                              const DataColumn(label: Text('Aspecto')),
                              for (var label in answers['respuesta21fila'] ??
                                  valorNoEncontrado)
                                DataColumn(label: Text(label)),
                            ],
                            rows: tablapregunta21.map((option) {
                              return DataRow(cells: [
                                DataCell(SizedBox(
                                  width: 150,
                                  child: Text(option.aspect),
                                )),
                                for (var label in answers['respuesta21fila'] ??
                                    valorNoEncontrado)
                                  helper.buildRadioCell(
                                    value: label,
                                    groupValue: option.answer,
                                    onChanged: (value) {
                                      setState(() {
                                        option.answer = value;
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
                        buildText(questions['pregunta22'] ?? valorNoEncontrado),
                        Column(
                          children: [
                            for (var option in answers['respuesta22'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButton(
                                  option, option, _selectedPregunta22, (value) {
                                setState(() {
                                  _selectedPregunta22 = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['pregunta23'] ?? valorNoEncontrado),
                        Column(
                          children: [
                            for (var option in answers['respuesta23'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButton(
                                  option, option, _selectedPregunta23, (value) {
                                setState(() {
                                  _selectedPregunta23 = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['pregunta24'] ?? valorNoEncontrado),
                        Column(
                          children: [
                            for (var option in answers['respuesta24'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButton(
                                  option, option, _selectedPregunta24, (value) {
                                setState(() {
                                  _selectedPregunta24 = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['pregunta25'] ?? valorNoEncontrado),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            dataRowHeight: 60,
                            columns: [
                              const DataColumn(label: Text('Aspecto')),
                              for (var label
                                  in answers['respuesta25fila'] ?? [])
                                DataColumn(label: Text(label)),
                            ],
                            rows: tablapregunta25.map((option) {
                              return DataRow(cells: [
                                DataCell(SizedBox(
                                  width: 150,
                                  child: Text(option.aspect),
                                )),
                                for (var label
                                    in answers['respuesta25fila'] ?? [])
                                  helper.buildRadioCell(
                                    value: label,
                                    groupValue: option.answer,
                                    onChanged: (value) {
                                      setState(() {
                                        option.answer = value;
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
                        buildText(questions['pregunta26'] ?? valorNoEncontrado),
                        Column(
                          children: [
                            for (var option in answers['respuesta26'] ?? [])
                              helper.buildRadioButton(
                                  option, option, _selectedPregunta26, (value) {
                                setState(() {
                                  _selectedPregunta26 = value;
                                });
                              }),
                          ],
                        ),
                        if (_selectedPregunta26 == "Otro especifique")
                          helper.buildInputField(
                            "Especifique",
                            _pregunta26Controller,
                          ),
                        if (_selectedPregunta26 == "Otro especifique")
                          const SizedBox(
                            height: 15,
                          ),
                        buildText(questions['pregunta27'] ?? valorNoEncontrado),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            dataRowHeight: 60,
                            columns: [
                              const DataColumn(label: Text('Aspecto')),
                              for (var label
                                  in answers['respuesta27fila'] ?? [])
                                DataColumn(label: Text(label)),
                            ],
                            rows: tablapregunta27.map((option) {
                              return DataRow(cells: [
                                DataCell(SizedBox(
                                  width: 150,
                                  child: Text(option.aspect),
                                )),
                                for (var label
                                    in answers['respuesta27fila'] ?? [])
                                  helper.buildRadioCell(
                                    value: label,
                                    groupValue: option.answer,
                                    onChanged: (value) {
                                      setState(() {
                                        option.answer = value;
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
                        buildText(questions['pregunta28'] ?? valorNoEncontrado),
                        helper.buildDropdownDynamic(
                            'Seleccione uno',
                            _selectedPregunta28,
                            answers['respuesta28'] ?? [], (String? newValue) {
                          _selectedPregunta28 = newValue;
                        }),
                        buildText(questions['pregunta29'] ?? valorNoEncontrado),
                        Row(
                          children: [
                            for (var option in answers['respuesta29'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButtonRow(
                                  option, option, _selectedPregunta29, (value) {
                                setState(() {
                                  _selectedPregunta29 = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['pregunta30'] ?? valorNoEncontrado),
                        helper.buildInputField(
                            'Material', _pregunta30Controller),
                        const SizedBox(
                          height: 15,
                        ),
                        buildText(questions['pregunta31'] ?? valorNoEncontrado),
                        Row(
                          children: [
                            for (var option in answers['respuesta31'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButtonRow(
                                  option, option, _selectedPregunta31, (value) {
                                setState(() {
                                  _selectedPregunta31 = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['pregunta32'] ?? valorNoEncontrado),
                        Column(
                          children: [
                            for (var option in answers['respuesta32'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButton(
                                  option, option, _selectedPregunta32, (value) {
                                setState(() {
                                  _selectedPregunta32 = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['pregunta33'] ?? valorNoEncontrado),
                        Column(
                          children: [
                            for (var option in answers['respuesta33'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButton(
                                  option, option, _selectedPregunta33, (value) {
                                setState(() {
                                  _selectedPregunta33 = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['pregunta34'] ?? valorNoEncontrado),
                        Column(
                          children: [
                            for (var option in answers['respuesta34'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButton(
                                  option, option, _selectedPregunta34, (value) {
                                setState(() {
                                  _selectedPregunta34 = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['pregunta35'] ?? valorNoEncontrado),
                        helper.buildDropdownDynamic(
                            'Seleccione uno',
                            _selectedPregunta35,
                            answers['respuesta35'] ?? [], (String? newValue) {
                          _selectedPregunta35 = newValue;
                        }),
                        buildText(questions['pregunta36'] ?? valorNoEncontrado),
                        helper.buildDropdownDynamic(
                            'Seleccione uno',
                            _selectedPregunta36,
                            answers['respuesta36'] ?? [], (String? newValue) {
                          _selectedPregunta36 = newValue;
                        }),
                        buildText(questions['pregunta37'] ?? valorNoEncontrado),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            dataRowHeight: 60,
                            columns: [
                              const DataColumn(label: Text('Aspecto')),
                              for (var label
                                  in answers['respuesta37fila'] ?? [])
                                DataColumn(label: Text(label)),
                            ],
                            rows: tablapregunta37.map((option) {
                              return DataRow(cells: [
                                DataCell(SizedBox(
                                  width: 150,
                                  child: Text(option.aspect),
                                )),
                                for (var label
                                    in answers['respuesta37fila'] ?? [])
                                  helper.buildRadioCell(
                                    value: label,
                                    groupValue: option.answer,
                                    onChanged: (value) {
                                      setState(() {
                                        option.answer = value;
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
                        buildText(questions['pregunta38'] ?? valorNoEncontrado),
                        helper.buildInputField('Area', _pregunta38Controller),
                        const SizedBox(
                          height: 15,
                        ),
                        buildText(questions['pregunta39'] ?? valorNoEncontrado),
                        helper.buildInputField('Area', _pregunta39Controller),
                        const SizedBox(
                          height: 15,
                        ),
                        buildText(questions['pregunta40'] ?? valorNoEncontrado),
                        helper.buildDropdownDynamic(
                            'Seleccione uno',
                            _selectedPregunta40,
                            answers['respuesta40'] ?? [], (String? newValue) {
                          _selectedPregunta40 = newValue;
                        }),
                        buildText(questions['pregunta41'] ?? valorNoEncontrado),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            dataRowHeight: 60,
                            columns: [
                              const DataColumn(label: Text('Aspecto')),
                              for (var label
                                  in answers['respuesta41fila'] ?? [])
                                DataColumn(label: Text(label)),
                            ],
                            rows: tablapregunta41.map((option) {
                              return DataRow(cells: [
                                DataCell(SizedBox(
                                  width: 150,
                                  child: Text(option.aspect),
                                )),
                                for (var label
                                    in answers['respuesta41fila'] ?? [])
                                  helper.buildRadioCell(
                                    value: label,
                                    groupValue: option.answer,
                                    onChanged: (value) {
                                      setState(() {
                                        option.answer = value;
                                      });
                                    },
                                  ),
                              ]);
                            }).toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        helper.buildGuardarButton(() async {
                          authToken = await _secureStorage.read(key: 'token');
                          userId = await _secureStorage.read(key: 'id');
                          respuestapregunta15 = [];
                          respuestapregunta21 = [];
                          respuestapregunta25 = [];
                          respuestapregunta27 = [];
                          respuestapregunta37 = [];
                          respuestapregunta41 = [];
                          for (DatosDeTabla x in tablapregunta15) {
                            respuestapregunta15.add(x.answer);
                          }
                          for (DatosDeTabla x in tablapregunta21) {
                            respuestapregunta21.add(x.answer);
                          }
                          for (DatosDeTabla x in tablapregunta25) {
                            respuestapregunta25.add(x.answer);
                          }
                          for (DatosDeTabla x in tablapregunta27) {
                            respuestapregunta27.add(x.answer);
                          }
                          for (DatosDeTabla x in tablapregunta37) {
                            respuestapregunta37.add(x.answer);
                          }
                          for (DatosDeTabla x in tablapregunta41) {
                            respuestapregunta41.add(x.answer);
                          }
                          // Verificar si se ha seleccionado la respuesta a la pregunta 12
                          if (_selected_pregunta12 == null) {
                            snackbarRed(
                                "Por favor, responde al enfoque que prefieres.");
                            return;
                          }

// Verificar si el campo de la pregunta 13 está vacío
                          if (_pregunta13Controller.text.trim().isEmpty) {
                            snackbarRed(
                                "Por favor, menciona una materia en la que te sientas más habilidoso/a.");
                            return;
                          }

// Verificar si el campo de la pregunta 14 está vacío
                          if (_pregunta14Controller.text.trim().isEmpty) {
                            snackbarRed(
                                "Por favor, menciona una materia en la que te sientas menos habilidoso/a.");
                            return;
                          }

                          // Verificar si la respuesta a la pregunta 15, cantidad de exámenes extraordinarios, está vacía
                          if (respuestapregunta15[0].isEmpty) {
                            snackbarRed(
                                "Por favor, responde a la cantidad de exámenes extraordinarios.");
                            return;
                          }

// Verificar si la respuesta a la pregunta 15, cantidad de exámenes de a título de suficiencia, está vacía
                          if (respuestapregunta15[1].isEmpty) {
                            snackbarRed(
                                "Por favor, responde a la cantidad de exámenes de a título de suficiencia.");
                            return;
                          }

// Verificar si se ha seleccionado la respuesta a la pregunta 16
                          if (_selectedPregunta16 == null) {
                            snackbarRed(
                                "Por favor, responde si te encuentras recursando materias.");
                            return;
                          }

                          // Verificar si se ha seleccionado la respuesta a la pregunta 17
                          if (_selectedPregunta17 == null) {
                            snackbarRed(
                                "Por favor, responde a qué atribuyes el reprobar materias.");
                            return;
                          }

// Verificar si se ha seleccionado la respuesta a la pregunta 18
                          if (_selectedPregunta18 == null) {
                            snackbarRed(
                                "Por favor, responde a las dificultades que encontraste al ingresar a la carrera.");
                            return;
                          }

// Verificar si se ha seleccionado la respuesta a la pregunta 19
                          if (_selectedPregunta19 == null) {
                            snackbarRed(
                                "Por favor, responde si los docentes entregaron criterios de evaluación.");
                            return;
                          }

                          // Verificar si se ha seleccionado la respuesta a la pregunta 20
                          if (_selectedPregunta20 == null) {
                            snackbarRed(
                                "Por favor, escoge el aspecto que comentaron los maestros al inicio del curso.");
                            return;
                          }

// Verificar si la respuesta a la pregunta 21, aspecto "Expone el maestro", está vacía
                          if (respuestapregunta21[0].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Expone el maestro".');
                            return;
                          }

// Verificar si la respuesta a la pregunta 21, aspecto "El maestro dicta", está vacía
                          if (respuestapregunta21[1].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "El maestro dicta".');
                            return;
                          }

                          // Verificar si la respuesta a la pregunta 21, aspecto "Dinámicas de grupo", está vacía
                          if (respuestapregunta21[2].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Dinámicas de grupo".');
                            return;
                          }

// Verificar si la respuesta a la pregunta 21, aspecto "Los alumnos exponen", está vacía
                          if (respuestapregunta21[3].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Los alumnos exponen".');
                            return;
                          }

// Verificar si la respuesta a la pregunta 21, aspecto "Preguntas sobre la lectura", está vacía
                          if (respuestapregunta21[4].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Preguntas sobre la lectura".');
                            return;
                          }

                          // Verificar si la respuesta a la pregunta 21, aspecto "Uso de recursos audiovisuales", está vacía
                          if (respuestapregunta21[5].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Uso de recursos audiovisuales".');
                            return;
                          }

// Verificar si la respuesta a la pregunta 21, aspecto "Uso de recursos informáticos", está vacía
                          if (respuestapregunta21[6].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Uso de recursos informáticos".');
                            return;
                          }

// Verificar si la respuesta a la pregunta 21, aspecto "Entrega de materiales", está vacía
                          if (respuestapregunta21[7].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Entrega de materiales".');
                            return;
                          }

                          // Verificar si se ha seleccionado la respuesta a la pregunta 22
                          if (_selectedPregunta22 == null) {
                            snackbarRed(
                                "Por favor, responde a la frecuencia con la que los maestros impulsan la participación.");
                            return;
                          }

// Verificar si se ha seleccionado la respuesta a la pregunta 23
                          if (_selectedPregunta23 == null) {
                            snackbarRed(
                                "Por favor, responde a cómo impulsan los maestros la participación.");
                            return;
                          }

// Verificar si se ha seleccionado la respuesta a la pregunta 24
                          if (_selectedPregunta24 == null) {
                            snackbarRed(
                                "Por favor, responde si consideras que tus maestros relacionan la teoría con ejemplos.");
                            return;
                          }

                          // Verificar si la respuesta a la pregunta 25, aspecto "Artículos o revistas", está vacía
                          if (respuestapregunta25[0].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Artículos o revistas".');
                            return;
                          }

// Verificar si la respuesta a la pregunta 25, aspecto "Bibliografía del programa", está vacía
                          if (respuestapregunta25[1].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Bibliografía del programa".');
                            return;
                          }

// Verificar si la respuesta a la pregunta 25, aspecto "Internet", está vacía
                          if (respuestapregunta25[2].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Internet".');
                            return;
                          }

                          // Verificar si la respuesta a la pregunta 25, aspecto "Libros digitales", está vacía
                          if (respuestapregunta25[3].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Libros digitales".');
                            return;
                          }

// Verificar si se ha seleccionado la respuesta a la pregunta 26
                          if (_selectedPregunta26 == null) {
                            snackbarRed(
                                "Por favor, responde con quién resuelves tus dudas.");
                            return;
                          }

// Verificar si la respuesta a la pregunta 27, aspecto "Resúmenes", está vacía
                          if (respuestapregunta27[0].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Resúmenes".');
                            return;
                          }

                          // Verificar si la respuesta a la pregunta 27, aspecto "Fichas o tarjetas", está vacía
                          if (respuestapregunta27[1].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Fichas o tarjetas".');
                            return;
                          }

// Verificar si la respuesta a la pregunta 27, aspecto "Esquemas", está vacía
                          if (respuestapregunta27[2].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Esquemas".');
                            return;
                          }

// Verificar si la respuesta a la pregunta 27, aspecto "Diagramas", está vacía
                          if (respuestapregunta27[3].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Diagramas".');
                            return;
                          }

                          // Verificar si la respuesta a la pregunta 27, aspecto "Cuadros comparativos", está vacía
                          if (respuestapregunta27[4].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Cuadros comparativos".');
                            return;
                          }

// Verificar si la respuesta a la pregunta 27, aspecto "Subrayar", está vacía
                          if (respuestapregunta27[5].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Subrayar".');
                            return;
                          }

// Verificar si la respuesta a la pregunta 27, aspecto "Mapas mentales", está vacía
                          if (respuestapregunta27[6].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Mapas mentales".');
                            return;
                          }

                          // Verificar si la respuesta a la pregunta 27, aspecto "Mapas conceptuales", está vacía
                          if (respuestapregunta27[7].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Mapas conceptuales".');
                            return;
                          }

// Verificar si se ha seleccionado la respuesta a la pregunta 28
                          if (_selectedPregunta28 == null) {
                            snackbarRed(
                                "Por favor, responde de dónde obtienes tus materiales de apoyo.");
                            return;
                          }

// Verificar si se ha seleccionado la respuesta a la pregunta 29
                          if (_selectedPregunta29 == null) {
                            snackbarRed(
                                "Por favor, responde si consideras importante aplicar nuevas tecnologías educativas.");
                            return;
                          }

                          // Verificar si el campo de la pregunta 30 está vacío
                          if (_pregunta30Controller.text.trim().isEmpty) {
                            snackbarRed(
                                "Por favor, responde cuál es el material didáctico que más utilizas para estudiar.");
                            return;
                          }

// Verificar si se ha seleccionado la respuesta a la pregunta 31
                          if (_selectedPregunta31 == null) {
                            snackbarRed(
                                "Por favor, responde si acostumbras leer bibliografía adicional.");
                            return;
                          }

// Verificar si se ha seleccionado la respuesta a la pregunta 32
                          if (_selectedPregunta32 == null) {
                            snackbarRed(
                                "Por favor, responde qué tipo de bibliografía consultas.");
                            return;
                          }

                          // Verificar si se ha seleccionado la respuesta a la pregunta 33
                          if (_selectedPregunta33 == null) {
                            snackbarRed(
                                "Por favor, responde qué herramienta tecnológica usas con más frecuencia.");
                            return;
                          }

                        // Verificar si se ha seleccionado la respuesta a la pregunta 34
                          if (_selectedPregunta34 == null) {
                            snackbarRed(
                                "Por favor, responde cómo calificarías en general las clases a distancia.");
                            return;
                          }

                          // Verificar si se ha seleccionado la respuesta a la pregunta 35
                          if (_selectedPregunta35 == null) {
                            snackbarRed(
                                "Por favor, responde qué recurso empleas más para estudiar.");
                            return;
                          }
                          // Verificar si se ha seleccionado la respuesta a la pregunta 36
                          if (_selectedPregunta36 == null) {
                            snackbarRed(
                                "Por favor, responde cuántas horas dedicas para estudiar.");
                            return;
                          }

                          // Verificar si la respuesta a la pregunta 37, aspecto "Biblioteca", está vacía
                          if (respuestapregunta37[0].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Biblioteca".');
                            return;
                          }

                          // Verificar si la respuesta a la pregunta 37, aspecto "Centro de cómputo", está vacía
                          if (respuestapregunta37[1].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Centro de cómputo".');
                            return;
                          }

                          // Verificar si la respuesta a la pregunta 37, aspecto "Laboratorios", está vacía
                          if (respuestapregunta37[2].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Laboratorios".');
                            return;
                          }

                          // Verificar si la respuesta a la pregunta 37, aspecto "Aulas", está vacía
                          if (respuestapregunta37[3].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Aulas".');
                            return;
                          }

                          // Verificar si la respuesta a la pregunta 37, aspecto "Baños", está vacía
                          if (respuestapregunta37[4].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Baños".');
                            return;
                          }

                          // Verificar si la respuesta a la pregunta 37, aspecto "Cafeterías o comedor", está vacía
                          if (respuestapregunta37[5].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Cafeterías o comedor".');
                            return;
                          }

                          // Verificar si la respuesta a la pregunta 37, aspecto "Limpieza del programa académico", está vacía
                          if (respuestapregunta37[6].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Limpieza del programa académico".');
                            return;
                          }

                          // Verificar si el campo de la pregunta 38 está vacío
                          if (_pregunta38Controller.text.trim().isEmpty) {
                            snackbarRed(
                                "Por favor, responde la materia donde te sientas más preparado.");
                            return;
                          }

                          // Verificar si el campo de la pregunta 39 está vacío
                          if (_pregunta39Controller.text.trim().isEmpty) {
                            snackbarRed(
                                "Por favor, responde la materia donde te sientas menos preparado.");
                            return;
                          }

                          // Verificar si se ha seleccionado la respuesta a la pregunta 40
                          if (_selectedPregunta40 == null) {
                            snackbarRed(
                                "Por favor, responde donde pretendes desarrollarte laboralmente.");
                            return;
                          }

                          // Verificar si la respuesta a la pregunta 41, aspecto "Cursar un diplomado", está vacía
                          if (respuestapregunta41[0].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Cursar un diplomado".');
                            return;
                          }
                          // Verificar si la respuesta a la pregunta 41, aspecto "Realizar una especialidad", está vacía
                          if (respuestapregunta41[1].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Realizar una especialidad".');
                            return;
                          }

                          // Verificar si la respuesta a la pregunta 41, aspecto "Hacer una maestría", está vacía
                          if (respuestapregunta41[2].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Hacer una maestría".');
                            return;
                          }

                          // Verificar si la respuesta a la pregunta 41, aspecto "Realizar un doctorado", está vacía
                          if (respuestapregunta41[3].isEmpty) {
                            snackbarRed(
                                'Por favor, responde al aspecto "Realizar un doctorado".');
                            return;
                          }

                          await addAreaProfesional();
                        })
                      ],
                    ),
                  ),
                ),
              ));
        }
      },
    );
  }
}
