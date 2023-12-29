import 'package:case_cuestionario/utils/WidgetBuilderHelper.dart';
import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:case_cuestionario/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Idioma extends StatefulWidget {
  const Idioma({super.key});

  @override
  State<Idioma> createState() => _IdiomaState();
}

class _IdiomaState extends State<Idioma> {
  late Future<Map<String, dynamic>> apiDataFuture;
  Map<String, dynamic> answers = {};
  Map<String, dynamic> questions = {};
  String? _selectedPregunta42;
  String? _selectedPregunta43;
  String? _selectedPregunta44;

  String? authToken = "";
  String? userId = "";
  final _secureStorage = FlutterSecureStorage();

  void rebuild() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    apiDataFuture = fetchData();
  }

  Future<void> addIdioma() async {
    final String url = 'http://192.168.1.66:3000/addIdioma';
    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $authToken',
            'Content-Type': 'application/json'
          },
          body: jsonEncode({
            'userId': userId,
            'pregunta42': _selectedPregunta42,
            'pregunta43': _selectedPregunta43,
            'pregunta44': _selectedPregunta44
          }));
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http
        .get(Uri.parse('https://case-408016.wl.r.appspot.com/idioma'));

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
          return const AppWithDrawer(
            title: 'Idioma',
            content: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return AppWithDrawer(
            title: 'Idioma',
            content: Scaffold(
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            ),
          );
        } else {
          return AppWithDrawer(
            title: 'Idioma',
            content: Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildText(snapshot.data!['questions']['pregunta42']),
                      Row(
                        children: [
                          for (var option in snapshot.data!['answers']
                              ['respuesta44'])
                            helper.buildRadioButtonRow(
                                option, option, _selectedPregunta42, (value) {
                              setState(() {
                                _selectedPregunta42 = value;
                              });
                            }),
                        ],
                      ),
                      buildText(snapshot.data!['questions']['pregunta43']),
                      Row(
                        children: [
                          for (var option in snapshot.data!['answers']
                              ['respuesta43'])
                            helper.buildRadioButtonRow(
                                option, option, _selectedPregunta43, (value) {
                              setState(() {
                                _selectedPregunta43 = value;
                              });
                            }),
                        ],
                      ),
                      buildText(snapshot.data!['questions']['pregunta44']),
                      Row(
                        children: [
                          for (var option in snapshot.data!['answers']
                              ['respuesta44'])
                            helper.buildRadioButtonRow(
                                option, option, _selectedPregunta44, (value) {
                              setState(() {
                                _selectedPregunta44 = value;
                              });
                            }),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      helper.buildGuardarButton(() async {
                        authToken = await _secureStorage.read(key: 'token');
                        userId = await _secureStorage.read(key: 'id');
                        await addIdioma();
                      }),
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
