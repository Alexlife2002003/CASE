import 'package:case_cuestionario/Datos/datosIncorporacion.dart';
import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:case_cuestionario/utils/widgets.dart';
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
  String? selectedModoEnterar; // ¿Cómo te enteraste de la Licenciatura?
  String?
      selectedImportanciaActividades; //¿Qué nivel de importancia tienen las actividades escolares dentro de tu familia
  String?
      selectedEspacioEstudiar; //¿Cuentas en tu casa con un espacio para estudiar y hacer tus trabajos escolares?
  bool escritorio = false;
  bool internet = false;
  bool impresora = false;
  bool calculadora = false;
  bool computadora = false;
  bool tablet = false;
  bool todas = false;
  String?
      selectedRecursosEconomicos; //Los recursos económicos con los que cuentas para realizar tus estudios son:
  String?
      selectedTransporte; //¿Qué medio de trasporte utilizas para trasladarte a la escuela? ¿Qué medio de trasporte utilizas para trasladarte a la escuela?
  String?
      selectedTiempo; // ¿Cuánto tiempo haces para llegar a la escuela desde tu domicilio actual?
  String? selectedConocesCebuaz; //¿Conoces el CEBUAZ?
  String? selectedUsasCebuaz; //¿Usas el CEBUAZ?

// En comparación con tu experiencia en el Bachillerato ¿Qué tanto ha cambiado tu vida durante tu estancia en la Universidad?
  List<Experiencia> experiencias = [
    Experiencia(aspect: 'Exigencia académica', experiencia: ''),
    Experiencia(aspect: 'Ambiente social y cultural', experiencia: ''),
    Experiencia(aspect: 'Relación con la familia', experiencia: ''),
    Experiencia(aspect: 'Relación con los maestros', experiencia: ''),
    Experiencia(aspect: 'Relación con los compañeros', experiencia: ''),
  ];
  String?
      selectedSatisfecha; //¿Hasta qué punto consideras satisfechas tus expectativas al iniciar la carrera?

  Widget buildCheckboxRow(
      String label, bool value, ValueChanged<bool?> onChanged) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith((states) {
            return states.contains(MaterialState.selected)
                ? Theme.of(context).colorScheme.onBackground
                : Theme.of(context).colorScheme.background;
          }),
          value: value,
          onChanged: onChanged,
          side: BorderSide(
            color: Theme.of(context).colorScheme.onBackground,
            width: 2.0,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 18)),
      ],
    );
  }

  Widget buildText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
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
        Text(label, style: const TextStyle(fontSize: 18)),
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
                buildText(pregunta1),
                Container(
                  width: 300,
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedModoEnterar,
                    decoration: const InputDecoration.collapsed(
                        hintText: 'Seleccione uno'),
                    dropdownColor: Theme.of(context).colorScheme.onBackground,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedModoEnterar = newValue;
                      });
                    },
                    items: como_se_entero
                        .map<DropdownMenuItem<String>>((String value) {
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
                const SizedBox(
                  height: 15,
                ),
                buildText(pregunta2),
                Column(
                  children: [
                    for (var importancia in nivel_importancia)
                      buildRadioButton(importancia, importancia,
                          selectedImportanciaActividades, (value) {
                        setState(() {
                          selectedImportanciaActividades = value;
                        });
                      }),
                  ],
                ),
                buildText(pregunta3),
                Row(
                  children: [
                    buildRadioButton('Si', 'Si', selectedEspacioEstudiar,
                        (value) {
                      setState(() {
                        selectedEspacioEstudiar = value;
                      });
                    }),
                    const SizedBox(width: 25),
                    buildRadioButton('No', 'No', selectedEspacioEstudiar,
                        (value) {
                      setState(() {
                        selectedEspacioEstudiar = value;
                      });
                    }),
                  ],
                ),
                buildText(pregunta4),
                Column(
                  children: [
                    buildCheckboxRow('escritorio', escritorio, (value) {
                      setState(() {
                        escritorio = value!;
                      });
                    }),
                    buildCheckboxRow('internet', internet, (value) {
                      setState(() {
                        internet = value!;
                      });
                    }),
                    buildCheckboxRow('impresora', impresora, (value) {
                      setState(() {
                        impresora = value!;
                      });
                    }),
                    buildCheckboxRow('calculadora', calculadora, (value) {
                      setState(() {
                        calculadora = value!;
                      });
                    }),
                    buildCheckboxRow('computadora', computadora, (value) {
                      setState(() {
                        computadora = value!;
                      });
                    }),
                    buildCheckboxRow('tablet', tablet, (value) {
                      setState(() {
                        tablet = value!;
                      });
                    }),
                    buildCheckboxRow('todas las anteriores', todas, (value) {
                      setState(() {
                        todas = value!;
                      });
                    }),
                  ],
                ),
                buildText(pregunta5),
                Column(
                  children: [
                    for (var option in recursos_economicos)
                      buildRadioButton(
                          option, option, selectedRecursosEconomicos, (value) {
                        setState(() {
                          selectedRecursosEconomicos = value;
                        });
                      }),
                  ],
                ),
                buildText(
                    pregunta6),
                Container(
                  width: 300,
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedTransporte,
                    decoration: const InputDecoration.collapsed(
                        hintText: 'Seleccione uno'),
                    dropdownColor: Theme.of(context).colorScheme.onBackground,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedTransporte = newValue;
                      });
                    },
                    items: transporte
                        .map<DropdownMenuItem<String>>((String value) {
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
                const SizedBox(
                  height: 15,
                ),
                buildText(
                    pregunta7),
                Container(
                  width: 300,
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedTiempo,
                    decoration: const InputDecoration.collapsed(
                        hintText: 'Seleccione uno'),
                    dropdownColor: Theme.of(context).colorScheme.onBackground,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedTiempo = newValue;
                      });
                    },
                    items: tiempo_transporte
                        .map<DropdownMenuItem<String>>((String value) {
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
                const SizedBox(
                  height: 15,
                ),
                buildText(pregunta8),
                Row(
                  children: [
                    buildRadioButton('Si', 'Si', selectedConocesCebuaz,
                        (value) {
                      setState(() {
                        selectedConocesCebuaz = value;
                      });
                    }),
                    const SizedBox(width: 25),
                    buildRadioButton('No', 'No', selectedConocesCebuaz,
                        (value) {
                      setState(() {
                        selectedConocesCebuaz = value;
                      });
                    }),
                  ],
                ),
                buildText(pregunta9),
                Row(
                  children: [
                    buildRadioButton('Si', 'Si', selectedUsasCebuaz, (value) {
                      setState(() {
                        selectedUsasCebuaz = value;
                      });
                    }),
                    const SizedBox(width: 25),
                    buildRadioButton('No', 'No', selectedUsasCebuaz, (value) {
                      setState(() {
                        selectedUsasCebuaz = value;
                      });
                    }),
                  ],
                ),
                buildText(
                    pregunta10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Aspecto')),
                      DataColumn(label: Text('Es mejor')),
                      DataColumn(label: Text('Es igual')),
                      DataColumn(label: Text('Es peor')),
                    ],
                    rows: experiencias.map((experiencia) {
                      return DataRow(cells: [
                        DataCell(SizedBox(
                          width: 150,
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
                const SizedBox(
                  width: 15,
                ),
                buildText(
                    pregunta11),
                Column(
                  children: [
                    for (var option in experiencia_obtenida)
                      buildRadioButton(option, option, selectedSatisfecha,
                          (value) {
                        setState(() {
                          selectedSatisfecha = value;
                        });
                      }),
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
                            if (selectedModoEnterar == null) {
                              showSnackbar(
                                  context,
                                  '¡Dejaste como te enteraste de la licenciatura sin contestar!',
                                  Theme.of(context).colorScheme.error);
                              return;
                            }
                            if (selectedImportanciaActividades == null) {
                              showSnackbar(
                                  context,
                                  '¡Dejaste el nivel de importancia sin contestar!',
                                  Theme.of(context).colorScheme.error);
                              return;
                            }
                            if (selectedEspacioEstudiar == null) {
                              showSnackbar(
                                  context,
                                  '¡Dejaste el espacio para estudiar sin contestar!',
                                  Theme.of(context).colorScheme.error);
                              return;
                            }
                            debugPrint(selectedModoEnterar);
                            debugPrint(selectedImportanciaActividades);
                            debugPrint(selectedEspacioEstudiar);
                            //En duda
                            if (escritorio == false &&
                                internet == false &&
                                impresora == false &&
                                calculadora == false &&
                                computadora == false &&
                                tablet == false &&
                                todas == false) {
                              showSnackbar(
                                  context,
                                  '¡Dejaste los medios con los que cuentas sin contestar!',
                                  Theme.of(context).colorScheme.error);
                              return;
                            }
                            debugPrint("escritorio $escritorio");
                            debugPrint("internet $internet");
                            debugPrint("impresora $impresora");
                            debugPrint("calculadora $calculadora");
                            debugPrint("computadora $computadora");
                            debugPrint("tablet $tablet");
                            debugPrint("todas $todas");
                            if (selectedRecursosEconomicos == null) {
                              showSnackbar(
                                  context,
                                  '¡Dejaste los recursos economicos sin contestar!',
                                  Theme.of(context).colorScheme.error);
                              return;
                            }
                            debugPrint(selectedRecursosEconomicos);
                            if (selectedTransporte == null) {
                              showSnackbar(
                                  context,
                                  '¡Dejaste el medio de transporte sin contestar!',
                                  Theme.of(context).colorScheme.error);
                              return;
                            }
                            debugPrint(selectedTransporte);
                            if (selectedTiempo == null) {
                              showSnackbar(
                                  context,
                                  '¡Dejaste el tiempo para llegar a la escuela sin contestar!',
                                  Theme.of(context).colorScheme.error);
                              return;
                            }
                            debugPrint(selectedTiempo);
                            if (selectedConocesCebuaz == null) {
                              showSnackbar(
                                  context,
                                  '¡Dejaste si conoces el CEBUAZ sin contestar!',
                                  Theme.of(context).colorScheme.error);
                              return;
                            }
                            debugPrint(selectedConocesCebuaz);
                            if (selectedUsasCebuaz == null) {
                              showSnackbar(
                                  context,
                                  '¡Dejaste si usas el CEBUAZ sin contestar!',
                                  Theme.of(context).colorScheme.error);
                              return;
                            }
                            debugPrint(selectedUsasCebuaz);

                            for (Experiencia experiencia in experiencias) {
                              debugPrint(
                                  'Aspect: ${experiencia.aspect}, Experiencia: ${experiencia.experiencia}');
                              if (experiencia.experiencia.isEmpty) {
                                showSnackbar(
                                    context,
                                    '¡Dejaste incompleto el cuadro de experiencias sin contestar!',
                                    Theme.of(context).colorScheme.error);
                                return;
                              }
                            }
                            if (selectedSatisfecha == null) {
                              showSnackbar(
                                  context,
                                  '¡Dejaste si tus expecatitivas al iniciar la carrera fueron satisfechas sin contestar!',
                                  Theme.of(context).colorScheme.error);
                            }
                            debugPrint(selectedSatisfecha);
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
