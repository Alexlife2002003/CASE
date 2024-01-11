import 'package:case_cuestionario/screens/dashboard.dart';
import 'package:case_cuestionario/utils/WidgetBuilderHelper.dart';
import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:case_cuestionario/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http
        .get(Uri.parse('http://case-408016.wl.r.appspot.com/datosGenerales'));

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
    String? userId = "";
    String? token = "";
    const _secureStorage = FlutterSecureStorage();

    Future<void> addDatosGenerales({
      required String authToken,
      required int userId,
      required String semestreText,
      required String nombreCompleto,
      required String sexoGenero,
      required String municipio,
      required String estadoCivil,
      required String trabaja,
      required String yearIngreso,
    }) async {
      const String url = 'http://192.168.1.66:3000/addDatosGenerales';

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
            'sexoGenero': sexoGenero,
            'municipio': municipio,
            'estadoCivil': estadoCivil,
            'trabaja': trabaja,
            'yearIngreso': yearIngreso,
          }),
        );

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
          snackbarRed("Error al agregar las respuestas");
        }
      } catch (error) {
        // Handle network or other errors
        snackbarRed('Error: $error');
      }
    }

    WidgetBuilderHelper helper = WidgetBuilderHelper(context, rebuild);
    return FutureBuilder<Map<String, dynamic>>(
        future: apiDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return AppWithDrawer(
              title: 'Datos generales',
              content: const Scaffold(
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
                        helper.buildGuardarButton(() async {
                          token = await _secureStorage.read(key: 'token');
                          userId = await _secureStorage.read(key: 'id');
                          // Verificar si se ha seleccionado un semestre
if (selectedSemester == null) {
  snackbarRed("Por favor, selecciona un semestre.");
  return;
}

// Verificar si se ha proporcionado un nombre completo
if (_nombreCompletoController.text.trim().isEmpty) {
  snackbarRed('Por favor, ingresa tu nombre completo.');
  return;
}

// Verificar si se ha seleccionado un género
if (selectedSexo == null) {
  snackbarRed('Por favor, selecciona tu género.');
  return;
}

// Verificar si se ha proporcionado un municipio
if (_municipioController.text.trim().isEmpty) {
  snackbarRed('Por favor, ingresa tu municipio.');
  return;
}

                          if (selectedEstadoCivil == null) {
                            snackbarRed(
                                'Estado civil se encuentra sin contestar');
                            return;
                          }
                          if (selectedTrabaja == null) {
                            snackbarRed('Trabaja se encuentra sin contestar');
                            return;
                          }
                          if (selectedYear == null) {
                            snackbarRed(
                                'Anio de ingreso se encuentra sin contestar');
                            return;
                          }
                          addDatosGenerales(
                              authToken: token!,
                              userId: int.parse(userId!),
                              semestreText: selectedSemester!,
                              nombreCompleto:
                                  _nombreCompletoController.text.trim(),
                              sexoGenero: selectedSexo!,
                              municipio: _municipioController.text.trim(),
                              estadoCivil: selectedEstadoCivil!,
                              trabaja: selectedTrabaja!,
                              yearIngreso: selectedYear!);
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
