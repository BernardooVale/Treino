import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'exercicios.dart';
import 'EditarExercicio.dart';

class Construtor extends StatefulWidget {
  final int dia;
  final Exercicios exercicios;
  const Construtor({Key? key, required this.exercicios, required this.dia}) : super(key: key);

  @override
  State<Construtor> createState() => _ConstrutorState();
}

class _ConstrutorState extends State<Construtor> {

  Map<int, bool> selecionados0 = {};
  Map<int, bool> selecionados1 = {};
  Map<int, bool> selecionados2 = {};

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var exerciciosLista = widget.dia == 0 ? widget.exercicios.tricepsOmbroPeito : widget.dia == 1 ? widget.exercicios.bracoCostas : widget.exercicios.perna;
    String categoria = widget.dia == 0 ? "Triceps/Ombro/Peito" : widget.dia == 1 ? "Braco/Costas" : "Perna";

    return ListView.builder(
        physics: BouncingScrollPhysics(),
            itemCount: exerciciosLista == null ?
            0 :
            exerciciosLista.length,
            itemBuilder: (context, index){
              var exercicio = exerciciosLista![index];
              bool selecionado = widget.dia == 0 ? selecionados0[index] ?? false : widget.dia == 1 ? selecionados1[index] ?? false : selecionados2[index] ?? false;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Container(
                  height: 75,
                  decoration: BoxDecoration(
                    color: selecionado ? Colors.orange : Colors.transparent,
                    border: Border.all(
                      color: Colors.orange,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${exercicio.nome}",
                              style: TextStyle(color: selecionado ? Colors.black38 : Colors.white70),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "${exercicio.repeticoes} rep | ",
                                      style: TextStyle(color: selecionado ? Colors.black38 : Colors.white70),
                                    ),
                                    if (exercicio.series == "6")
                                      Text(
                                        "2x ${((int.parse(exercicio.peso.toString()) * 2)/3).round()}kg  "
                                            "2x ${(((int.parse(exercicio.peso.toString()) + (int.parse(exercicio.peso.toString()) * 2)/3)/2)).round()}kg  "
                                            "2x ${int.parse(exercicio.peso.toString())}kg",
                                        style: TextStyle(color: selecionado ? Colors.black38 : Colors.white70),
                                      )
                                    else Text(
                                      "${exercicio.series}x ${exercicio.peso}kg",
                                      style: TextStyle(color: selecionado ? Colors.black38 : Colors.white70),
                                    )
                                  ],
                                )
                            )
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              color: selecionado ? Colors.black38 : Colors.white70,
                              onPressed: () async {
                                final resultado = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditarExercicio(
                                      exercicio: exercicio.toJson(), // Converte para Map<String, dynamic>
                                      categoria: categoria, // Passa a categoria correspondente
                                      index: index, // Passa o índice do exercício na lista
                                    ),
                                  ),
                                );

                                // Atualiza a lista de exercícios caso a edição seja salva
                                if (resultado != null) {
                                  setState(() {
                                    exerciciosLista![index] = Exercicio.fromJson(resultado);
                                  });
                                }
                              },
                              icon: Icon(Icons.edit_rounded),
                            ),

                            IconButton(
                              color: selecionado ? Colors.black38 : Colors.white70,
                              onPressed: () {
                                setState(() {
                                  widget.dia == 0 ? selecionados0[index] = !selecionado : widget.dia == 1 ? selecionados1[index] = !selecionado : selecionados2[index] = !selecionado;
                                });
                              },
                              icon: selecionado ? Icon(Icons.check_box_outlined) : Icon(Icons.check_box_rounded,),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
        );
  }
}
