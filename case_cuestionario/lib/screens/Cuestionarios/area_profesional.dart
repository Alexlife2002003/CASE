import 'package:case_cuestionario/Datos/datosAreaProfesional.dart';
import 'package:case_cuestionario/utils/WidgetBuilderHelper.dart';
import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:case_cuestionario/utils/widgets.dart';
import 'package:flutter/material.dart';

class DatosDeTabla {
  String aspect;
  String answer;

  DatosDeTabla({required this.aspect, required this.answer});
}

class AreaProfesional extends StatefulWidget {
  const AreaProfesional({super.key});

  @override
  State<AreaProfesional> createState() => _AreaProfesionalState();
}

class _AreaProfesionalState extends State<AreaProfesional> {
  String? _selected_pregunta12;
  final _pregunta13Controller = TextEditingController();
  final _pregunta14Controller = TextEditingController();
  List<DatosDeTabla> tablapregunta15 = [
    DatosDeTabla(aspect: 'Extraordinario', answer: ''),
    DatosDeTabla(aspect: 'A título de suficiencia', answer: '')
  ];
  String? _selectedPregunta16;
  String? _selectedPregunta17;
  String? _selectedPregunta18;
  String? _selectedPregunta19;
  String? _selectedPregunta20;

  List<DatosDeTabla> tablapregunta21 = [
    DatosDeTabla(aspect: 'Expone el maestro', answer: ''),
    DatosDeTabla(aspect: 'El maestro dicta', answer: ''),
    DatosDeTabla(aspect: 'Se realizan dinámicas de grupo', answer: ''),
    DatosDeTabla(aspect: 'Los alumnos exponen', answer: ''),
    DatosDeTabla(
        aspect: 'El maestro hace preguntas sobre la lectura', answer: ''),
    DatosDeTabla(
        aspect: 'Uso de recursos audiovisuales (videos ó películas)',
        answer: ''),
    DatosDeTabla(
        aspect: 'Uso de recursos informáticos (plataformas)', answer: ''),
    DatosDeTabla(
        aspect: 'Entrega de materiales (cuadernillos antologías)', answer: ''),
  ];
  String? _selectedPregunta22;
  String? _selectedPregunta23;
  String? _selectedPregunta24;
  List<DatosDeTabla> tablapregunta25 = [
    DatosDeTabla(aspect: 'Artículos o revistas', answer: ''),
    DatosDeTabla(aspect: 'Bibliografía del programa', answer: ''),
    DatosDeTabla(aspect: 'Internet (consulta general)', answer: ''),
    DatosDeTabla(aspect: ' Libros digitales (en línea o PDF)', answer: '')
  ];

  String? _selectedPregunta26;
  final _pregunta26Controller = TextEditingController();

  List<DatosDeTabla> tablapregunta27 = [
    DatosDeTabla(aspect: 'Resúmenes', answer: ''),
    DatosDeTabla(aspect: 'Fichas o tarjetas', answer: ''),
    DatosDeTabla(aspect: 'Esquemas', answer: ''),
    DatosDeTabla(aspect: 'Diagramas', answer: ''),
    DatosDeTabla(aspect: 'Cuadros comparativos', answer: ''),
    DatosDeTabla(aspect: 'Subrayar', answer: ''),
    DatosDeTabla(aspect: 'Mapas mentales', answer: ''),
    DatosDeTabla(aspect: 'Mapas conceptuales', answer: '')
  ];

  String? _selectedPregunta28;
  String? _selectedPregunta29;
  final _pregunta30Controller = TextEditingController();
  String? _selectedPregunta31;
  String? _selectedPregunta32;
  String? _selectedPregunta33;
  String? _selectedPregunta34;
  String? _selectedPregunta35;
  String? _selectedPregunta36;
  List<DatosDeTabla> tablapregunta37 = [
    DatosDeTabla(aspect: 'Biblioteca', answer: ''),
    DatosDeTabla(aspect: 'Centro de computo', answer: ''),
    DatosDeTabla(aspect: 'Laboratorios', answer: ''),
    DatosDeTabla(aspect: 'Aulas', answer: ''),
    DatosDeTabla(aspect: 'Baños', answer: ''),
    DatosDeTabla(aspect: 'Cafeterías o comedor', answer: ''),
    DatosDeTabla(aspect: 'Limpieza del programa académico', answer: ''),
  ];
  final _pregunta38Controller = TextEditingController();
  final _pregunta39Controller = TextEditingController();
  String? _selectedPregunta40;
  List<DatosDeTabla> tablapregunta41 = [
    DatosDeTabla(aspect: 'Cursar un diplomado', answer: ''),
    DatosDeTabla(aspect: 'Realizar una especialidad', answer: ''),
    DatosDeTabla(aspect: 'Hacer una maestría', answer: ''),
    DatosDeTabla(aspect: 'Realizar un doctorado', answer: ''),
  ];

  void rebuild() {
    setState(() {});
  }

  


  @override
  Widget build(BuildContext context) {
    WidgetBuilderHelper helper = WidgetBuilderHelper(context, rebuild);

    return AppWithDrawer(
      title: 'AreaProfesional',
      content: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(pregunta12),
                Column(
                  children: [
                    for (var option in respuesta12)
                      helper.buildRadioButton(
                          option, option, _selected_pregunta12, (value) {
                        setState(() {
                          _selected_pregunta12 = value;
                        });
                      }),
                  ],
                ),
                buildText(pregunta13),
                helper.buildInputField(
                  'Materia(s)',
                  _pregunta13Controller,
                ),
                const SizedBox(
                  height: 15,
                ),
                buildText(pregunta14),
                helper.buildInputField(
                  "Materia",
                  _pregunta14Controller,
                ),
                const SizedBox(
                  height: 15,
                ),
                buildText(pregunta15),
                
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    dataRowHeight: 60,
                    columns: [
                      const DataColumn(label: Text('Aspecto')),
                      for (var label in respuesta15fila)
                        DataColumn(label: Text(label)),
                    ],
                    rows: tablapregunta15.map((experiencia) {
                      return DataRow(cells: [
                        DataCell(SizedBox(
                          width: 150,
                          child: Text(experiencia.aspect),
                        )),
                        for (var label in respuesta15fila)
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
                buildText(pregunta16),
                Row(
                  children: [
                    for (var option in respuesta16)
                      helper.buildRadioButton(
                          option, option, _selectedPregunta16, (value) {
                        setState(() {
                          _selectedPregunta16 = value;
                        });
                      }),
                  ],
                ),
                buildText(pregunta17),
                helper.buildDropdown(
                  'Seleccione uno:',
                  _selectedPregunta17,
                  respuesta17,
                  (String? newValue) {
                    setState(() {
                      _selectedPregunta17 = newValue;
                    });
                  },
                ),
                buildText(pregunta18),
                helper.buildDropdown(
                  'Seleccione uno:',
                  _selectedPregunta18,
                  respuesta18,
                  (String? newValue) {
                    setState(() {
                      _selectedPregunta18 = newValue;
                    });
                  },
                ),
                buildText(pregunta19),
                Row(
                  children: [
                    for (var option in respuesta19)
                      helper.buildRadioButton(
                          option, option, _selectedPregunta19, (value) {
                        setState(() {
                          _selectedPregunta19 = value;
                        });
                      }),
                  ],
                ),
                buildText(pregunta20),
                helper.buildDropdown(
                  'Seleccione uno:',
                  _selectedPregunta20,
                  respuesta20,
                  (String? newValue) {
                    setState(() {
                      _selectedPregunta20 = newValue;
                    });
                  },
                ),
                buildText(pregunta21),
                
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    dataRowHeight: 60,
                    columns: [
                      const DataColumn(label: Text('Aspecto')),
                      for (var label in respuesta21fila)
                        DataColumn(label: Text(label)),
                    ],
                    rows: tablapregunta21.map((experiencia) {
                      return DataRow(cells: [
                        DataCell(SizedBox(
                          width: 150,
                          child: Text(experiencia.aspect),
                        )),
                        for (var label in respuesta21fila)
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
                buildText(pregunta22),
                Column(
                  children: [
                    for (var option in respuesta22)
                      helper.buildRadioButton(
                          option, option, _selectedPregunta22, (value) {
                        setState(() {
                          _selectedPregunta22 = value;
                        });
                      }),
                  ],
                ),
                buildText(pregunta23),
                Column(
                  children: [
                    for (var option in respuesta23)
                      helper.buildRadioButton(
                          option, option, _selectedPregunta23, (value) {
                        setState(() {
                          _selectedPregunta23 = value;
                        });
                      }),
                  ],
                ),
                buildText(pregunta24),
                Column(
                  children: [
                    for (var option in respuesta24)
                      helper.buildRadioButton(
                          option, option, _selectedPregunta24, (value) {
                        setState(() {
                          _selectedPregunta24 = value;
                        });
                      }),
                  ],
                ),
                buildText(pregunta25),
                
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    dataRowHeight: 60,
                    columns: [
                      const DataColumn(label: Text('Aspecto')),
                      for (var label in respuesta25fila)
                        DataColumn(label: Text(label)),
                    ],
                    rows: tablapregunta25.map((experiencia) {
                      return DataRow(cells: [
                        DataCell(SizedBox(
                          width: 150,
                          child: Text(experiencia.aspect),
                        )),
                        for (var label in respuesta25fila)
                          DataCell(Radio(
                            value: label,
                            groupValue: experiencia.answer,
                            fillColor: MaterialStateColor.resolveWith(
                              (states) {
                                if (states.contains(MaterialState.selected)) {
                                  return Theme.of(context)
                                      .colorScheme
                                      .onBackground;
                                } else {
                                  return Colors.white;
                                }
                              },
                            ),
                            onChanged: (value) {
                              experiencia.answer = value as String;
                            },
                          )),
                      ]);
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                buildText(pregunta26), //completar
                Column(
                  children: [
                    for (var option in respuesta26)
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

                buildText(pregunta27),
                
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    dataRowHeight: 60,
                    columns: [
                      const DataColumn(label: Text('Aspecto')),
                      for (var label in respuesta27fila)
                        DataColumn(label: Text(label)),
                    ],
                    rows: tablapregunta27.map((experiencia) {
                      return DataRow(cells: [
                        DataCell(SizedBox(
                          width: 150,
                          child: Text(experiencia.aspect),
                        )),
                        for (var label in respuesta27fila)
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
                buildText(pregunta28),
                helper.buildDropdown(
                  'Seleccione uno:',
                  _selectedPregunta28,
                  respuesta28,
                  (String? newValue) {
                    setState(() {
                      _selectedPregunta28 = newValue;
                    });
                  },
                ),
                buildText(pregunta29),
                Row(
                  children: [
                    for (var option in respuesta29)
                      helper.buildRadioButton(
                          option, option, _selectedPregunta29, (value) {
                        setState(() {
                          _selectedPregunta29 = value;
                        });
                      }),
                  ],
                ),
                buildText(pregunta30),
                helper.buildInputField(
                  "Material",
                  _pregunta30Controller,
                ),
                const SizedBox(
                  height: 15,
                ),
                buildText(pregunta31),
                Row(
                  children: [
                    for (var option in respuesta31)
                      helper.buildRadioButton(
                          option, option, _selectedPregunta31, (value) {
                        setState(() {
                          _selectedPregunta31 = value;
                        });
                      }),
                  ],
                ),
                if (_selectedPregunta31 == "Si") buildText(pregunta32),
                if (_selectedPregunta31 == "Si")
                  Column(
                    children: [
                      for (var option in respuesta32)
                        helper.buildRadioButton(
                            option, option, _selectedPregunta32, (value) {
                          setState(() {
                            _selectedPregunta32 = value;
                          });
                        }),
                    ],
                  ),
                buildText(pregunta33),
                Column(
                  children: [
                    for (var option in respuesta33)
                      helper.buildRadioButton(
                          option, option, _selectedPregunta33, (value) {
                        setState(() {
                          _selectedPregunta33 = value;
                        });
                      }),
                  ],
                ),
                buildText(pregunta34),
                Column(
                  children: [
                    for (var option in respuesta34)
                      helper.buildRadioButton(
                          option, option, _selectedPregunta34, (value) {
                        setState(() {
                          _selectedPregunta34 = value;
                        });
                      }),
                  ],
                ),
                buildText(pregunta35),
                helper.buildDropdown(
                  'Seleccione uno:',
                  _selectedPregunta35,
                  respuesta35,
                  (String? newValue) {
                    setState(() {
                      _selectedPregunta35 = newValue;
                    });
                  },
                ),
                buildText(pregunta36),
                helper.buildDropdown(
                  'Seleccione uno:',
                  _selectedPregunta36,
                  respuesta36,
                  (String? newValue) {
                    setState(() {
                      _selectedPregunta36 = newValue;
                    });
                  },
                ),
                buildText(pregunta37),
                
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    dataRowHeight: 60,
                    columns: [
                      const DataColumn(label: Text('Aspecto')),
                      for (var label in respuesta37fila)
                        DataColumn(label: Text(label)),
                    ],
                    rows: tablapregunta37.map((experiencia) {
                      return DataRow(cells: [
                        DataCell(SizedBox(
                          width: 150,
                          child: Text(experiencia.aspect),
                        )),
                        for (var label in respuesta37fila)
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
                buildText(pregunta38),
                helper.buildInputField(
                  "Materia",
                  _pregunta38Controller,
                ),
                const SizedBox(
                  height: 15,
                ),
                buildText(pregunta39),
                helper.buildInputField(
                  "Materia",
                  _pregunta39Controller,
                ),
                const SizedBox(
                  height: 15,
                ),
                buildText(pregunta40),
                helper.buildDropdown(
                  'Seleccione uno:',
                  _selectedPregunta40,
                  respuesta40,
                  (String? newValue) {
                    setState(() {
                      _selectedPregunta40 = newValue;
                    });
                  },
                ),
                buildText(pregunta41),
                
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    dataRowHeight: 60,
                    columns: [
                      const DataColumn(label: Text('Aspecto')),
                      for (var label in respuesta41fila)
                        DataColumn(label: Text(label)),
                    ],
                    rows: tablapregunta41.map((experiencia) {
                      return DataRow(cells: [
                        DataCell(SizedBox(
                          width: 150,
                          child: Text(experiencia.aspect),
                        )),
                        for (var label in respuesta41fila)
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
               
                const SizedBox(height: 25),

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
                      onTap: () {
                        debugPrint(_selected_pregunta12);
                        debugPrint(_pregunta13Controller.text);
                        debugPrint(_pregunta14Controller.text);
                        for (DatosDeTabla datos in tablapregunta15) {
                          debugPrint(
                              "Aspect ${datos.aspect}, Answer: ${datos.answer}");
                        }
                      },
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
                                color: Theme.of(context).colorScheme.background,
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
}
