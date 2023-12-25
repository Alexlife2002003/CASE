import 'package:case_cuestionario/utils/WidgetBuilderHelper.dart';
import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:case_cuestionario/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class datosGenerales extends StatefulWidget {
  const datosGenerales({super.key});

  @override
  State<datosGenerales> createState() => _datosGeneralesState();
}

class _datosGeneralesState extends State<datosGenerales> {
  late Future<Map<String, dynamic>> apiDataFuture;
  Map<String, dynamic> answers = {};
  Map<String, dynamic> questions = {};
  String? selectedSemester;
  String? selectedSexo;
  String? selectedEstadoCivil;
  String? selectedTrabaja;
  String? selectedYear;
  String valorNoEncontrado = "VALOR NO ENCONTRADO";
  final _nombreCompletoController = TextEditingController();
  final _municipioController = TextEditingController();

  void rebuild() {
    setState(() {});
  }

  Future<Map<String, dynamic>> fetchData() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.66:8080/datosGenerales'));

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
    Future<void> addDatosGenerales({
      required String authToken,
      required int userId,
      required String semestreText,
      required String nombreCompleto,
      required String hintNombre,
      required String sexoGenero,
      required String municipio,
      required String hintMunicipio,
      required String estadoCivil,
      required String trabaja,
      required int yearIngreso,
    }) async {
      final String url = 'https://192.168.1.66:3000/addDatosGenerales';

      try {
        final response = await http.post(
          Uri.parse(url),
          headers: {
            'Authorization':
                'Bearer $authToken', // Include the JWT token for authentication
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'userId': userId,
            'semestreText': semestreText,
            'nombreCompleto': nombreCompleto,
            'hintNombre': hintNombre,
            'sexoGenero': sexoGenero,
            'municipio': municipio,
            'hintMunicipio': hintMunicipio,
            'estadoCivil': estadoCivil,
            'trabaja': trabaja,
            'yearIngreso': yearIngreso,
          }),
        );

        if (response.statusCode == 201) {
          final Map<String, dynamic> data = json.decode(response.body);
          print('User answers added successfully. Message: ${data['message']}');
        } else {
          // Handle error
          print('Failed to add user answers: ${response.statusCode}');
        }
      } catch (error) {
        // Handle network or other errors
        print('Error: $error');
      }
    }

    WidgetBuilderHelper helper = WidgetBuilderHelper(context, rebuild);
    return FutureBuilder<Map<String, dynamic>>(
        future: apiDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AppWithDrawer(
              title: 'Datos generales',
              content: Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (snapshot.hasError) {
            return AppWithDrawer(
              title: 'Datos generales',
              content: Scaffold(
                  body: Center(
                child: Text('Error:${snapshot.error}'),
              )),
            );
          } else {
            return AppWithDrawer(
              title: 'Datos generales',
              content: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildText(
                            questions['semestretext'] ?? valorNoEncontrado),
                        Column(
                          children: [
                            for (var option
                                in answers['semestre'] ?? [valorNoEncontrado])
                              helper.buildRadioButton(
                                  option, option, selectedSemester, (value) {
                                setState(() {
                                  selectedSemester = value;
                                });
                              }),
                          ],
                        ),
                        buildText(
                            questions['nombrecompleto'] ?? valorNoEncontrado),
                        helper.buildInputField(
                            questions['hintNombre'] ?? valorNoEncontrado,
                            _nombreCompletoController),
                        const SizedBox(
                          height: 15,
                        ),
                        buildText(questions['sexoGenero'] ?? valorNoEncontrado),
                        Column(
                          children: [
                            for (var option
                                in answers['genero'] ?? [valorNoEncontrado])
                              helper.buildRadioButton(
                                  option, option, selectedSexo, (value) {
                                setState(() {
                                  selectedSexo = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['municipio'] ?? valorNoEncontrado),
                        helper.buildInputField(
                            questions['hintMunicipio'], _municipioController),
                        const SizedBox(
                          height: 15,
                        ),
                        buildText(
                            questions['estadocivil'] ?? valorNoEncontrado),
                        Column(
                          children: [
                            for (var option in answers['estadoCivil'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButton(
                                  option, option, selectedEstadoCivil, (value) {
                                setState(() {
                                  selectedEstadoCivil = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['trabaja'] ?? valorNoEncontrado),
                        Column(
                          children: [
                            for (var option in answers['trabajaActual'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButton(
                                  option, option, selectedTrabaja, (value) {
                                setState(() {
                                  selectedTrabaja = value;
                                });
                              }),
                          ],
                        ),
                        buildText(
                            questions['yearingreso'] ?? valorNoEncontrado),
                        helper.buildDropdownDynamic('Seleccione uno',
                            selectedYear, answers['anio'] ?? valorNoEncontrado,
                            (String? newvalue) {
                          setState(() {
                            selectedYear = newvalue;
                          });
                        }),
                        const SizedBox(
                          height: 25,
                        ),
                        helper.buildGuardarButton(() {

                        })
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }
}
