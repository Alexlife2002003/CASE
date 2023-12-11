import 'package:case_cuestionario/utils/WidgetBuilderHelper.dart';
import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:case_cuestionario/utils/widgets.dart';
import 'package:flutter/material.dart';
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

  void rebuild() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    apiDataFuture = fetchData();
  }

  Future<Map<String, dynamic>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://case-api-2.onrender.com/idioma'));

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
          return AppWithDrawer(
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
                          for (var option in snapshot.data!['answers']['respuesta44'])
                            helper.buildRadioButton(
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
                          for (var option in snapshot.data!['answers']['respuesta43'])
                            helper.buildRadioButton(
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
                          for (var option in snapshot.data!['answers']['respuesta44'])
                            helper.buildRadioButton(
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSurface,
                            border: Border.all(color: Colors.white, width: .2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.white, width: 2),
                                ),
                                child: Center(
                                  child: Text(
                                    'Guardar',
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.background,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
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
