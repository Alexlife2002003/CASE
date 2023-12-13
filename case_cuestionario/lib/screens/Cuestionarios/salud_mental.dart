import 'package:case_cuestionario/utils/WidgetBuilderHelper.dart';
import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:case_cuestionario/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class saludMental extends StatefulWidget {
  const saludMental({super.key});

  @override
  State<saludMental> createState() => _saludMentalState();
}

class _saludMentalState extends State<saludMental> {
  late Future<Map<String, dynamic>> apiDataFuture;
  Map<String, dynamic> answers = {};
  Map<String, dynamic> questions = {};
  String valorNoEncontrado = "VALOR NO ENCONTRADO";

  String? selectedPregunta64;
  bool pregunta64_0 = false;
  bool pregunta64_1 = false;
  bool pregunta64_2 = false;
  bool pregunta64_3 = false;
  bool pregunta64_4 = false;
  bool pregunta64_5 = false;
  bool pregunta64_6 = false;
  bool pregunta64_7 = false;
  bool pregunta64_8 = false;
  bool pregunta64_9 = false;

  void rebuild() {
    setState(() {});
  }

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http
        .get(Uri.parse('https://case-408016.wl.r.appspot.com/saludmental'));

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

  @override
  Widget build(BuildContext context) {
    WidgetBuilderHelper helper = WidgetBuilderHelper(context, rebuild);
    return FutureBuilder<Map<String, dynamic>>(
        future: apiDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AppWithDrawer(
                title: 'Salud mental',
                content: Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ));
          } else if (snapshot.hasError) {
            return AppWithDrawer(
                title: 'Salud mental',
                content: Scaffold(
                  body: Center(child: Text('Error: ${snapshot.error}')),
                ));
          } else {
            return AppWithDrawer(
                title: 'Salud mental',
                content: Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildText(
                              questions['pregunta63'] ?? valorNoEncontrado),
                          Column(
                            children: [
                              helper.buildCheckboxRow(
                                  'Problemas para conciliar el sueño.',
                                  pregunta64_0, (value) {
                                setState(() {
                                  pregunta64_0 = value!;
                                });
                              }),
                              helper.buildCheckboxRow(
                                  'Comportamientos agresivos.', pregunta64_1,
                                  (value) {
                                setState(() {
                                  pregunta64_1 = value!;
                                });
                              }),
                              helper.buildCheckboxRow(
                                  'Estar más irritable.', pregunta64_2,
                                  (value) {
                                setState(() {
                                  pregunta64_2 = value!;
                                });
                              }),
                              helper.buildCheckboxRow(
                                  'Perdida de interés en actividades que antes solía disfrutar.',
                                  pregunta64_3, (value) {
                                setState(() {
                                  pregunta64_3 = value!;
                                });
                              }),
                              helper.buildCheckboxRow(
                                  'Pérdida de energía o cansancio excesivo.',
                                  pregunta64_4, (value) {
                                setState(() {
                                  pregunta64_4 = value!;
                                });
                              }),
                              helper.buildCheckboxRow(
                                  'Sensación de desesperanza hacia el futuro.',
                                  pregunta64_5, (value) {
                                setState(() {
                                  pregunta64_5 = value!;
                                });
                              }),
                              helper.buildCheckboxRow(
                                  'Actos de autolesión.', pregunta64_6,
                                  (value) {
                                setState(() {
                                  pregunta64_6 = value!;
                                });
                              }),
                              helper.buildCheckboxRow(
                                  'Ideas de suicidio.', pregunta64_7, (value) {
                                setState(() {
                                  pregunta64_7 = value!;
                                });
                              }),
                              helper.buildCheckboxRow(
                                  'Comportamientos alimentarios de riesgo',
                                  pregunta64_8, (value) {
                                setState(() {
                                  pregunta64_8 = value!;
                                });
                              }),
                              helper.buildCheckboxRow(
                                  'Todas las anteriores', pregunta64_9,
                                  (value) {
                                setState(() {
                                  pregunta64_9 = value!;
                                });
                              }),
                            ],
                          ),
                          buildText(
                              questions['pregunta64'] ?? valorNoEncontrado),
                          Row(
                            children: [
                              for (var option in answers['respuesta64'] ??
                                  [valorNoEncontrado])
                                helper.buildRadioButtonRow(
                                    option, option, selectedPregunta64,
                                    (value) {
                                  setState(() {
                                    selectedPregunta64 = value;
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
