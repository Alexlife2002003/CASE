import 'package:case_cuestionario/utils/WidgetBuilderHelper.dart';
import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:case_cuestionario/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    const String url = 'http://192.168.1.66:3000/addServiciosCase';
    print(userId);
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
      print(response.body);
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http
        .get(Uri.parse('https://case-408016.wl.r.appspot.com/serviciosCase'));

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
  Widget build(BuildContext context) {
    WidgetBuilderHelper helper = WidgetBuilderHelper(context, rebuild);
    return FutureBuilder<Map<String, dynamic>>(
        future: apiDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  AppWithDrawer(
                title: 'Servicios CASE',
                content: Scaffold(
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
