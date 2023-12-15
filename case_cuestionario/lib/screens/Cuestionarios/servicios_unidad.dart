import 'package:case_cuestionario/utils/WidgetBuilderHelper.dart';
import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:case_cuestionario/utils/widgets.dart';
import 'package:flutter/material.dart';
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

  void rebuild() {
    setState(() {});
  }

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http
        .get(Uri.parse('https://case-408016.wl.r.appspot.com/serviciosUnidad'));

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

  @override
  Widget build(BuildContext context) {
    WidgetBuilderHelper helper = WidgetBuilderHelper(context, rebuild);
    return FutureBuilder<Map<String, dynamic>>(
        future: apiDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AppWithDrawer(
                title: 'Servicios Unidad',
                content: Scaffold(
                  body: Center(child: CircularProgressIndicator()),
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
                                    _selectedPregunta76 = value;
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
                          SizedBox(
                            height: 25,
                          ),
                          helper.buildGuardarButton(() {})
                        ],
                      ),
                    ),
                  ),
                ));
          }
        });
  }
}
