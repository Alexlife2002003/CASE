import 'package:case_cuestionario/utils/AppDrawer.dart';
import 'package:flutter/material.dart';

class Experiencia {
  String aspect;
  String experiencia;

  Experiencia({required this.aspect, required this.experiencia});
}

class Incorporacion extends StatefulWidget {
  const Incorporacion({super.key});

  @override
  State<Incorporacion> createState() => _IncorporacionState();
}

class _IncorporacionState extends State<Incorporacion> {
  String? selectedModoEnterar;
  String? selectedImportanciaActividades;
  String? selectedEspacioEstudiar;
  String? selectedTransporte;
  String? selectedTiempo;
  String? selectedConocesCebuaz;
  String? selectedUsasCebuaz;
  String? selectedSatisfecha;
  List<Experiencia> experiencias = [
    Experiencia(aspect: 'Exigencia académica', experiencia: ''),
    Experiencia(aspect: 'Ambiente social y cultural', experiencia: ''),
    Experiencia(aspect: 'Relación con la familia', experiencia: ''),
    Experiencia(aspect: 'Relación con los maestros', experiencia: ''),
    Experiencia(aspect: 'Relación con los compañeros', experiencia: ''),
  ];

  String? selectedRecursosEconomicos;
  @override
  Widget buildText(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

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
        Text(label, style: TextStyle(fontSize: 18)),
      ],
    );
  }

  Widget buildRadio(
      String value, String? groupValue, Function(String?) onChanged) {
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppWithDrawer(
      title: 'Incorporacion',
      content: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText('¿Cómo te enteraste de la Licenciatura?*'),
                Container(
                  width: 300,
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedModoEnterar,
                    decoration:
                        InputDecoration.collapsed(hintText: 'Seleccione uno'),
                    dropdownColor: Theme.of(context).colorScheme.onBackground,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedModoEnterar = newValue;
                      });
                    },
                    items: <String>[
                      'Redes Sociales',
                      'Página de la UAZ',
                      'Tríptico',
                      'Expoorienta CASE-BUAZ',
                      'Familiar o conocido',
                      'Otra',
                    ].map<DropdownMenuItem<String>>((String value) {
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
                ),
                buildText(
                    '¿Qué nivel de importancia tienen las actividades escolares dentro de tu familia?*'),
                Column(
                  children: [
                    for (var importancia in [
                      'Muy alto',
                      'Alto',
                      'Medio',
                      'Bajo'
                    ])
                      buildRadioButton('$importancia', importancia,
                          selectedImportanciaActividades, (value) {
                        setState(() {
                          selectedImportanciaActividades = value;
                        });
                      }),
                  ],
                ),
                buildText(
                    '¿Cuentas en tu casa con un espacio para estudiar y hacer tus trabajos escolares?*'),
                Row(
                  children: [
                    buildRadioButton('Si', 'Si', selectedEspacioEstudiar,
                        (value) {
                      setState(() {
                        selectedEspacioEstudiar = value;
                      });
                    }),
                    SizedBox(width: 25),
                    buildRadioButton('No', 'No', selectedEspacioEstudiar,
                        (value) {
                      setState(() {
                        selectedEspacioEstudiar = value;
                      });
                    }),
                  ],
                ),
                buildText(
                    'De los siguientes medios, ¿con cuáles cuentas para estudiar?* (Selecciona todos los que correspondan.)'),
                buildText(
                    'Los recursos económicos con los que cuentas para realizar tus estudios son:'),
                Column(
                  children: [
                    for (var option in [
                      'Suficientes',
                      'Insuficientes',
                      'Nulos',
                    ])
                      buildRadioButton(
                          '$option', option, selectedRecursosEconomicos,
                          (value) {
                        setState(() {
                          selectedRecursosEconomicos = value;
                        });
                      }),
                  ],
                ),
                buildText(
                    '¿Qué medio de transporte utilizas para trasladarte a la escuela?*'),
                Container(
                  width: 300,
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedTransporte,
                    decoration:
                        InputDecoration.collapsed(hintText: 'Seleccione uno'),
                    dropdownColor: Theme.of(context).colorScheme.onBackground,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedTransporte = newValue;
                      });
                    },
                    items: <String>[
                      'Autobús',
                      'Taxi',
                      'Auto propio',
                      'Caminando',
                      'Otro',
                    ].map<DropdownMenuItem<String>>((String value) {
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
                ),
                buildText(
                    '¿Cuánto tiempo haces para llegar a la escuela desde tu domicilio actual?*'),
                Container(
                  width: 300,
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedTiempo,
                    decoration:
                        InputDecoration.collapsed(hintText: 'Seleccione uno'),
                    dropdownColor: Theme.of(context).colorScheme.onBackground,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedTiempo = newValue;
                      });
                    },
                    items: <String>[
                      'Menos de 1/2 hora',
                      'De 1/2 hora a 1 hora',
                      'De 1 hora a 2 horas',
                      'Más de 2 horas',
                      'Otro',
                    ].map<DropdownMenuItem<String>>((String value) {
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
                ),
                buildText('¿Conoces el CEBUAZ?*'),
                Row(
                  children: [
                    buildRadioButton('Si', 'Si', selectedConocesCebuaz,
                        (value) {
                      setState(() {
                        selectedConocesCebuaz = value;
                      });
                    }),
                    SizedBox(width: 25),
                    buildRadioButton('No', 'No', selectedConocesCebuaz,
                        (value) {
                      setState(() {
                        selectedConocesCebuaz = value;
                      });
                    }),
                  ],
                ),
                buildText('¿Usas el CEBUAZ?*'),
                Row(
                  children: [
                    buildRadioButton('Si', 'Si', selectedUsasCebuaz, (value) {
                      setState(() {
                        selectedUsasCebuaz = value;
                      });
                    }),
                    SizedBox(width: 25),
                    buildRadioButton('No', 'No', selectedUsasCebuaz, (value) {
                      setState(() {
                        selectedUsasCebuaz = value;
                      });
                    }),
                  ],
                ),
                buildText(
                    'En comparación con tu experiencia en el Bachillerato, ¿qué tanto ha cambiado tu vida durante tu estancia en la Universidad?'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Aspecto')),
                      DataColumn(label: Text('Es mejor')),
                      DataColumn(label: Text('Es igual')),
                      DataColumn(label: Text('Es peor')),
                    ],
                    rows: experiencias.map((experiencia) {
                      return DataRow(cells: [
                        DataCell(Container(
                          width: 150, // Fixed width for each cell
                          child: Text(experiencia.aspect),
                        )),
                        DataCell(Radio(
                          value: 'Es mejor',
                          groupValue: experiencia.experiencia,
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
                            setState(() {
                              experiencia.experiencia = value as String;
                            });
                          },
                        )),
                        DataCell(Radio(
                          value: 'Es igual',
                          groupValue: experiencia.experiencia,
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
                            setState(() {
                              experiencia.experiencia = value as String;
                            });
                          },
                        )),
                        DataCell(Radio(
                          value: 'Es peor',
                          groupValue: experiencia.experiencia,
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
                            setState(() {
                              experiencia.experiencia = value as String;
                            });
                          },
                        )),
                      ]);
                    }).toList(),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                buildText(
                    'En relación con tu experiencia obtenida hasta la fecha en el Programa Académico, ¿hasta qué punto consideras satisfechas tus expectativas al iniciar la carrera?'),
                Column(
                  children: [
                    for (var option in [
                      'Muy satisfactoria',
                      'Satisfactoria',
                      'Poco Satisfactoria',
                      'Nada satisfactoria'
                    ])
                      buildRadioButton('$option', option, selectedSatisfecha,
                          (value) {
                        setState(() {
                          selectedSatisfecha = value;
                        });
                      }),
                    SizedBox(height: 25),
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
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  'Guardar',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
