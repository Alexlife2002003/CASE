import 'package:case_cuestionario/utils/WidgetBuilderHelper.dart';
import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:case_cuestionario/utils/widgets.dart';
import 'package:flutter/material.dart';
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
  String? selectedRespuesta5;
  String? selectedRespuesta6;
  String? selectedRespuesta7;
  String? selectedRespuesta8;
  String? selectedRespuesta9;

  List<DatosDeTabla> tablapregunta10 = [];

  String? selectedRespuesta11;

  void rebuild() {
    setState(() {});
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
          return const AppWithDrawer(
            title: 'Incorporacion',
            content: Scaffold(
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
                          selectedRespuesta1,
                          answers['respuesta6'] ?? [], (String? newValue) {
                        selectedRespuesta6 = newValue;
                      }),
                      buildText(questions['pregunta7'] ?? valorNoEncontrado),
                      helper.buildDropdownDynamic(
                          'Seleccione uno',
                          selectedRespuesta1,
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
                      helper.buildGuardarButton(() {})
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
