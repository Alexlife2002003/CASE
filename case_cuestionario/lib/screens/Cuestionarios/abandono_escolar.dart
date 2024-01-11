import 'package:case_cuestionario/screens/dashboard.dart';
import 'package:case_cuestionario/utils/WidgetBuilderHelper.dart';
import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:case_cuestionario/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class abandonoEscolar extends StatefulWidget {
  const abandonoEscolar({super.key});

  @override
  State<abandonoEscolar> createState() => _abandonoEscolarState();
}

class _abandonoEscolarState extends State<abandonoEscolar> {
  late Future<Map<String, dynamic>> apiDataFuture;
  Map<String, dynamic> answers = {};
  Map<String, dynamic> questions = {};
  String valorNoEncontrado = "VALOR NO ENCONTRADO";
  String resultado50 = "";
  bool horariosComplicados = false;
  bool noVocacion = false;
  bool desempenoAcademico = false;
  bool noGustaronMaterias = false;
  bool dificultadMaterias = false;
  bool noGustanMetodos = false;
  bool actitudProfesores = false;
  bool situacionEconomica = false;
  bool tenerQueTrabajar = false;
  bool faltaHerramientas = false;
  bool estadoAnimo = false;
  bool dificultadRelacionarse = false;
  bool faltaLaboratorios = false;
  bool lugarDomicilio = false;
  bool influenciaFamilia = false;
  bool aspectosPersonales = false;
  bool aspectosSalud = false;
  bool noMotivosAbandono = false;
  String? _selected_pregunta51;
  String? _selected_pregunta52;
  String? _selected_pregunta53;
  String? _selected_pregunta54;
  String? _selected_pregunta55;
  List<String> respuestaoregunta56 = [];
  List<String> respuestaoregunta57 = [];
  List<DatosDeTabla> tablapregunta56 = [];
  List<DatosDeTabla> tablapregunta57 = [];
  String? _selected_pregunta58;
  String? _selected_pregunta59;
  String? _selected_pregunta60;
  String? _selected_pregunta61;
  String? _selected_pregunta62;

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

  Future<void> addAbandonoEscolar() async {
    const String url = 'http://192.168.1.66:3000/addAbandonoEscolar';
    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $authToken',
            'Content-Type': 'application/json'
          },
          body: jsonEncode({
            'userId': userId,
            'pregunta50': resultado50,
            'pregunta51': _selected_pregunta51,
            'pregunta52': _selected_pregunta52,
            'pregunta53': _selected_pregunta53,
            'pregunta54': _selected_pregunta54,
            'pregunta55': _selected_pregunta55,
            'pregunta56_diario': respuestaoregunta56[0],
            'pregunta56_fin_semana': respuestaoregunta56[1],
            'pregunta56_antes_examen': respuestaoregunta56[2],
            'pregunta57_uso_conocimientos': respuestaoregunta57[0],
            'pregunta57_cumplo_metas': respuestaoregunta57[1],
            'pregunta57_desarrollo_habilidades': respuestaoregunta57[2],
            'pregunta57_pensamiento_critico': respuestaoregunta57[3],
            'pregunta58': _selected_pregunta58,
            'pregunta59': _selected_pregunta59,
            'pregunta60': _selected_pregunta60,
            'pregunta61': _selected_pregunta61,
            'pregunta62': _selected_pregunta62
          }));
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Center(
              child: Text(
            'Respuestas guardadas con exito',
            style: TextStyle(fontSize: 18),
          )),
        ));
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Dashboard()),
          (Route<dynamic> route) => false,
        );
      } else {
        // Handle error
        snackbarRed('Error al agregar las respuestas ');
      }
    } catch (error) {
      snackbarRed('Error: $error');
    }
  }

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http
        .get(Uri.parse('https://case-408016.wl.r.appspot.com/abandonoEscolar'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          Map<String, dynamic>.from(json.decode(response.body));
      setState(() {
        questions = data['questions'];
        answers = data['answers'];
        for (var option in answers['respuesta56columna']) {
          tablapregunta56.add(DatosDeTabla(aspect: option, answer: ''));
        }
        for (var option in answers['respuesta57columna']) {
          tablapregunta57.add(DatosDeTabla(aspect: option, answer: ''));
        }
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
                title: 'Abandono Escolar',
                content: const Scaffold(
                    body: Center(
                  child: CircularProgressIndicator(),
                )));
          } else if (snapshot.hasError) {
            return AppWithDrawer(
                title: 'Abandono Escolar',
                content: Scaffold(
                  body: Center(
                    child: Text('Error: ${snapshot.error}'),
                  ),
                ));
          } else {
            return AppWithDrawer(
                title: 'Abandono Escolar',
                content: Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        buildText(questions['pregunta50'] ?? valorNoEncontrado),
                        Column(
                          children: [
                            helper.buildCheckboxRow(
                                'Horarios complicados de clases',
                                horariosComplicados, (value) {
                              setState(() {
                                horariosComplicados = value!;
                              });
                            }),
                            helper.buildCheckboxRow(
                                'No era mi vocación la carrera', noVocacion,
                                (value) {
                              setState(() {
                                noVocacion = value!;
                              });
                            }),
                            helper.buildCheckboxRow(
                                'Desempeño académico inadecuado (bajas calificaciones)',
                                desempenoAcademico, (value) {
                              setState(() {
                                desempenoAcademico = value!;
                              });
                            }),
                            helper.buildCheckboxRow(
                                'No me gustaron las materias',
                                noGustaronMaterias, (value) {
                              setState(() {
                                noGustaronMaterias = value!;
                              });
                            }),
                            helper.buildCheckboxRow(
                                'Dificultad en las materias',
                                dificultadMaterias, (value) {
                              setState(() {
                                dificultadMaterias = value!;
                              });
                            }),
                            helper.buildCheckboxRow(
                                'No me gustan los métodos de enseñanza de los profesores',
                                noGustanMetodos, (value) {
                              setState(() {
                                noGustanMetodos = value!;
                              });
                            }),
                            helper.buildCheckboxRow(
                                'Actitud o comportamiento de profesores son complicados',
                                actitudProfesores, (value) {
                              setState(() {
                                actitudProfesores = value!;
                              });
                            }),
                            helper.buildCheckboxRow(
                                'Situación económica difícil',
                                situacionEconomica, (value) {
                              setState(() {
                                situacionEconomica = value!;
                              });
                            }),
                            helper.buildCheckboxRow(
                                'Tener que trabajar', tenerQueTrabajar,
                                (value) {
                              setState(() {
                                tenerQueTrabajar = value!;
                              });
                            }),
                            helper.buildCheckboxRow(
                                'Falta de herramientas o habilidades de aprendizaje',
                                faltaHerramientas, (value) {
                              setState(() {
                                faltaHerramientas = value!;
                              });
                            }),
                            helper.buildCheckboxRow(
                                'Estado de ánimo que complica emocionalmente continuar estudiando',
                                estadoAnimo, (value) {
                              setState(() {
                                estadoAnimo = value!;
                              });
                            }),
                            helper.buildCheckboxRow(
                                'Dificultad de relacionarse con compañeros o maestros',
                                dificultadRelacionarse, (value) {
                              setState(() {
                                dificultadRelacionarse = value!;
                              });
                            }),
                            helper.buildCheckboxRow(
                                'Falta de laboratorios, infraestructura, equipo en la carrera',
                                faltaLaboratorios, (value) {
                              setState(() {
                                faltaLaboratorios = value!;
                              });
                            }),
                            helper.buildCheckboxRow(
                                'Lugar de domicilio (alejado que complica estar en la carrera)',
                                lugarDomicilio, (value) {
                              setState(() {
                                lugarDomicilio = value!;
                              });
                            }),
                            helper.buildCheckboxRow(
                                'Influencia de padres o familiares para abandonar la carrera',
                                influenciaFamilia, (value) {
                              setState(() {
                                influenciaFamilia = value!;
                              });
                            }),
                            helper.buildCheckboxRow(
                                'Aspectos personales (matrimonio, embarazo, etc.)',
                                aspectosPersonales, (value) {
                              setState(() {
                                aspectosPersonales = value!;
                              });
                            }),
                            helper.buildCheckboxRow(
                                'Aspectos de salud (estar enfermo o enfermedad de algún familiar)',
                                aspectosSalud, (value) {
                              setState(() {
                                aspectosSalud = value!;
                              });
                            }),
                            helper.buildCheckboxRow(
                                'No tengo motivos para abandonar estudios',
                                noMotivosAbandono, (value) {
                              setState(() {
                                noMotivosAbandono = value!;
                              });
                            }),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        buildText(questions['pregunta51'] ?? valorNoEncontrado),
                        Row(
                          children: [
                            for (var option in answers['respuesta51'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButtonRow(
                                  option, option, _selected_pregunta51,
                                  (value) {
                                setState(() {
                                  _selected_pregunta51 = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['pregunta52'] ?? valorNoEncontrado),
                        Row(
                          children: [
                            for (var option in answers['respuesta52'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButtonRow(
                                  option, option, _selected_pregunta52,
                                  (value) {
                                setState(() {
                                  _selected_pregunta52 = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['pregunta53'] ?? valorNoEncontrado),
                        helper.buildDropdownDynamic(
                            'Seleccione uno',
                            _selected_pregunta53,
                            answers['respuesta53'] ?? [], (String? newValue) {
                          _selected_pregunta53 = newValue;
                        }),
                        buildText(questions['pregunta54'] ?? valorNoEncontrado),
                        Column(
                          children: [
                            for (var option in answers['respuesta54'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButton(
                                  option, option, _selected_pregunta54,
                                  (value) {
                                setState(() {
                                  _selected_pregunta54 = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['pregunta55'] ?? valorNoEncontrado),
                        Column(
                          children: [
                            for (var option in answers['respuesta55'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButton(
                                  option, option, _selected_pregunta55,
                                  (value) {
                                setState(() {
                                  _selected_pregunta55 = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['pregunta56'] ?? valorNoEncontrado),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            dataRowHeight: 60,
                            columns: [
                              const DataColumn(label: Text('Aspecto')),
                              for (var label
                                  in answers['respuesta56fila'] ?? [])
                                DataColumn(label: Text(label)),
                            ],
                            rows: tablapregunta56.map((option) {
                              return DataRow(cells: [
                                DataCell(SizedBox(
                                  width: 150,
                                  child: Text(option.aspect),
                                )),
                                for (var label
                                    in answers['respuesta56fila'] ?? [])
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
                        buildText(questions['pregunta57'] ?? valorNoEncontrado),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            dataRowHeight: 60,
                            columns: [
                              const DataColumn(label: Text('Aspecto')),
                              for (var label
                                  in answers['respuesta57fila'] ?? [])
                                DataColumn(label: Text(label)),
                            ],
                            rows: tablapregunta57.map((option) {
                              return DataRow(cells: [
                                DataCell(SizedBox(
                                  width: 150,
                                  child: Text(option.aspect),
                                )),
                                for (var label
                                    in answers['respuesta57fila'] ?? [])
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
                        buildText(questions['pregunta58'] ?? valorNoEncontrado),
                        Column(
                          children: [
                            for (var option in answers['respuesta58'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButton(
                                  option, option, _selected_pregunta58,
                                  (value) {
                                setState(() {
                                  _selected_pregunta58 = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['pregunta59'] ?? valorNoEncontrado),
                        Row(
                          children: [
                            for (var option in answers['respuesta59'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButtonRow(
                                  option, option, _selected_pregunta59,
                                  (value) {
                                setState(() {
                                  _selected_pregunta59 = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['pregunta60'] ?? valorNoEncontrado),
                        Column(
                          children: [
                            for (var option in answers['respuesta60'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButton(
                                  option, option, _selected_pregunta60,
                                  (value) {
                                setState(() {
                                  _selected_pregunta60 = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['pregunta61'] ?? valorNoEncontrado),
                        Column(
                          children: [
                            for (var option in answers['respuesta61'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButton(
                                  option, option, _selected_pregunta61,
                                  (value) {
                                setState(() {
                                  _selected_pregunta61 = value;
                                });
                              }),
                          ],
                        ),
                        buildText(questions['pregunta62'] ?? valorNoEncontrado),
                        Row(
                          children: [
                            for (var option in answers['respuesta62'] ??
                                [valorNoEncontrado])
                              helper.buildRadioButtonRow(
                                  option, option, _selected_pregunta62,
                                  (value) {
                                setState(() {
                                  _selected_pregunta62 = value;
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
                          resultado50 = "";
                          respuestaoregunta56 = [];
                          respuestaoregunta57 = [];
                          for (DatosDeTabla x in tablapregunta56) {
                            respuestaoregunta56.add(x.answer);
                          }
                          for (DatosDeTabla x in tablapregunta57) {
                            respuestaoregunta57.add(x.answer);
                          }
                          if ((horariosComplicados == false) &&
                              (noVocacion == false) &&
                              (desempenoAcademico == false) &&
                              (noGustaronMaterias == false) &&
                              (dificultadMaterias == false) &&
                              (noGustanMetodos == false) &&
                              (actitudProfesores == false) &&
                              (situacionEconomica == false) &&
                              (tenerQueTrabajar == false) &&
                              (faltaHerramientas == false) &&
                              (estadoAnimo == false) &&
                              (dificultadRelacionarse == false) &&
                              (faltaLaboratorios == false) &&
                              (lugarDomicilio == false) &&
                              (influenciaFamilia == false) &&
                              (aspectosPersonales == false) &&
                              (aspectosSalud == false) &&
                              (noMotivosAbandono == false)) {
                            snackbarRed(
                                "Contesta al menos un motivo de dejar la universidad");
                            return;
                          }
                          if (_selected_pregunta51 == null) {
                            snackbarRed(
                                "Contesta si volverias a estudiar en la UAZ");
                            return;
                          }
                          if (_selected_pregunta52 == null) {
                            snackbarRed(
                                "Responde si consideras aplicar nuevas tecnologias en tu carrera");
                            return;
                          }
                          if (_selected_pregunta53 == null) {
                            snackbarRed(
                                "Contesta si realizas a alguna extra escolar");
                            return;
                          }
                          if (_selected_pregunta54 == null) {
                            snackbarRed(
                                "Responde si consideras que las actividades artisticas te ayudan a mejorar");
                            return;
                          }
                          if (_selected_pregunta55 == null) {
                            snackbarRed("Contesta como usas tu tiempo");
                            return;
                          }
                          if (respuestaoregunta56[0].isEmpty) {
                            snackbarRed('Contesta el aspecto "Diariamente"');
                            return;
                          }
                          if (respuestaoregunta56[1].isEmpty) {
                            snackbarRed('Contesta el aspecto "Fin de semana"');
                            return;
                          }
                          if (respuestaoregunta56[2].isEmpty) {
                            snackbarRed(
                                'Contesta el aspecto "Antes de un examen"');
                            return;
                          }
                          if (respuestaoregunta57[0].isEmpty) {
                            snackbarRed(
                                'Contesta el aspecto "Hago uso constante de mis conocimientos"');
                            return;
                          }
                          if (respuestaoregunta57[1].isEmpty) {
                            snackbarRed(
                                'Contesta el aspecto "Cumplo mis metas"');
                            return;
                          }
                          if (respuestaoregunta57[2].isEmpty) {
                            snackbarRed(
                                'Contesta el aspecto "He desarrollado habilidades referentes a mis estudios"');
                            return;
                          }
                          if (respuestaoregunta57[3].isEmpty) {
                            snackbarRed(
                                'Contesta el aspecto "He desarrollado pensamiento critico"');
                            return;
                          }
                          if (_selected_pregunta58 == null) {
                            snackbarRed(
                                "Responde si preguntas lo que no entiendes");
                            return;
                          }
                          if (_selected_pregunta59 == null) {
                            snackbarRed(
                                "Contesta si aplicas estrategias de estudio");
                            return;
                          }
                          if (_selected_pregunta60 == null) {
                            snackbarRed("Contesta como calificas tu desempeno");
                            return;
                          }
                          if (_selected_pregunta61 == null) {
                            snackbarRed(
                                "Responde que requieres para mejorar tu rendimiento academico");
                            return;
                          }
                          if (_selected_pregunta62 == null) {
                            snackbarRed(
                                "Responde si la contigencia sanitaria te afecto a nivel emocional");
                            return;
                          }
                          revisar50(horariosComplicados);
                          revisar50(noVocacion);
                          revisar50(desempenoAcademico);
                          revisar50(noGustaronMaterias);
                          revisar50(dificultadMaterias);
                          revisar50(noGustanMetodos);
                          revisar50(actitudProfesores);
                          revisar50(situacionEconomica);
                          revisar50(tenerQueTrabajar);
                          revisar50(faltaHerramientas);
                          revisar50(estadoAnimo);
                          revisar50(dificultadRelacionarse);
                          revisar50(faltaLaboratorios);
                          revisar50(lugarDomicilio);
                          revisar50(influenciaFamilia);
                          revisar50(aspectosPersonales);
                          revisar50(aspectosSalud);
                          revisar50(noMotivosAbandono);

                          await addAbandonoEscolar();
                        })
                      ]),
                    ),
                  ),
                ));
          }
        });
  }

  void revisar50(bool valor) {
    if (valor) {
      resultado50 += "Si,";
    } else {
      resultado50 += "No,";
    }
  }
}
