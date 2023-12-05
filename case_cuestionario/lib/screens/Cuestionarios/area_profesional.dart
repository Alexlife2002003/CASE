import 'package:case_cuestionario/Datos/datosAreaProfesional.dart';
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
  String? _selectedPregunta40;
  List<DatosDeTabla> tablapregunta41 = [
    DatosDeTabla(aspect: 'Cursar un diplomado', answer: ''),
    DatosDeTabla(aspect: 'Realizar una especialidad', answer: ''),
    DatosDeTabla(aspect: 'Hacer una maestría', answer: ''),
    DatosDeTabla(aspect: 'Realizar un doctorado', answer: ''),
  ];


  Widget buildRadioButton(String label, String value, String? groupValue,
      Function(String?) onChanged) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: Theme.of(context).colorScheme.onBackground,
          fillColor: MaterialStateColor.resolveWith(
            (states) {
              if (states.contains(MaterialState.selected)) {
                return Theme.of(context).colorScheme.onBackground;
              } else {
                return Theme.of(context).colorScheme.onBackground;
              }
            },
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 18)),
        SizedBox(
          width: 25,
        )
      ],
    );
  }

  Widget buildInputField(String text, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          border: Border.all(color: Colors.white, width: .2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: TextField(
            style: const TextStyle(color: Colors.black),
            keyboardType: TextInputType.text,
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: text,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 20,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCustomDataTable(
      List<DatosDeTabla> data, List<String> columnLabels) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        dataRowHeight: 60,
        columns: [
          DataColumn(label: Text('Aspecto')),
          for (var label in columnLabels) DataColumn(label: Text(label)),
        ],
        rows: data.map((experiencia) {
          return DataRow(cells: [
            DataCell(SizedBox(
              width: 150,
              child: Text(experiencia.aspect),
            )),
            for (var label in columnLabels)
              DataCell(Radio(
                value: label,
                groupValue: experiencia.answer,
                fillColor: MaterialStateColor.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.selected)) {
                      return Theme.of(context).colorScheme.onBackground;
                    } else {
                      return Colors.white;
                    }
                  },
                ),
                onChanged: (value) {
                  setState(() {
                    experiencia.answer = value as String;
                  });
                },
              )),
          ]);
        }).toList(),
      ),
    );
  }

  Widget buildDropdown(String label, String? value, List<String> items,
      Function(String?) onChanged) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onBackground,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: DropdownButtonFormField<String>(
            value: _selectedPregunta17,
            decoration: InputDecoration.collapsed(hintText: label),
            dropdownColor: Theme.of(context).colorScheme.onBackground,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            onChanged: (String? newValue) {
              setState(() {
                value = newValue;
              });
            },
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.background),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      buildRadioButton(option, option, _selected_pregunta12,
                          (value) {
                        setState(() {
                          _selected_pregunta12 = value;
                        });
                      }),
                  ],
                ),
                buildText(pregunta13),
                buildInputField('Materia(s)', _pregunta13Controller),
                const SizedBox(
                  height: 15,
                ),
                buildText(pregunta14),
                buildInputField("Materia", _pregunta14Controller),
                const SizedBox(
                  height: 15,
                ),
                buildText(pregunta15),
                buildCustomDataTable(tablapregunta15, respuesta15fila),
                const SizedBox(
                  height: 15,
                ),
                buildText(pregunta16),
                Row(
                  children: [
                    for (var option in respuesta16)
                      buildRadioButton(option, option, _selectedPregunta16,
                          (value) {
                        setState(() {
                          _selectedPregunta16 = value;
                        });
                      }),
                  ],
                ),
                buildText(pregunta17),
                buildDropdown(
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
                buildDropdown(
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
                      buildRadioButton(option, option, _selectedPregunta19,
                          (value) {
                        setState(() {
                          _selectedPregunta19 = value;
                        });
                      }),
                  ],
                ),
                buildText(pregunta20),
                buildDropdown(
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
                buildCustomDataTable(tablapregunta21, respuesta21fila),
                SizedBox(
                  height: 15,
                ),
                buildText(pregunta22),
                Column(
                  children: [
                    for (var option in respuesta22)
                      buildRadioButton(option, option, _selectedPregunta22,
                          (value) {
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
                      buildRadioButton(option, option, _selectedPregunta23,
                          (value) {
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
                      buildRadioButton(option, option, _selectedPregunta24,
                          (value) {
                        setState(() {
                          _selectedPregunta24 = value;
                        });
                      }),
                  ],
                ),
                buildText(pregunta25),
                buildCustomDataTable(tablapregunta25, respuesta25fila),
                SizedBox(
                  height: 15,
                ),
                buildText(pregunta26), //completar
                buildText(pregunta27),
                buildCustomDataTable(tablapregunta27, respuesta27fila),
                SizedBox(
                  height: 15,
                ),
                buildText(pregunta28),
                buildDropdown(
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
                      buildRadioButton(option, option, _selectedPregunta29,
                          (value) {
                        setState(() {
                          _selectedPregunta29 = value;
                        });
                      }),
                  ],
                ),
                buildText(pregunta30),
                buildInputField("Material", _pregunta30Controller),
                const SizedBox(
                  height: 15,
                ),
                buildText(pregunta31),
                Row(
                  children: [
                    for (var option in respuesta31)
                      buildRadioButton(option, option, _selectedPregunta31,
                          (value) {
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
                        buildRadioButton(option, option, _selectedPregunta32,
                            (value) {
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
                      buildRadioButton(option, option, _selectedPregunta33,
                          (value) {
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
                      buildRadioButton(option, option, _selectedPregunta34,
                          (value) {
                        setState(() {
                          _selectedPregunta34 = value;
                        });
                      }),
                  ],
                ),
                buildText(pregunta35),
                buildDropdown(
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
                buildDropdown(
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
                buildCustomDataTable(tablapregunta37, respuesta37fila),
                SizedBox(
                  height: 15,
                ),
                buildText(pregunta38), //completar programa academico
                buildText(pregunta39), // completar programa academico
                buildText(pregunta40),
                buildDropdown(
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
                buildCustomDataTable(tablapregunta41, respuesta41fila),
                SizedBox(
                  height: 15,
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
