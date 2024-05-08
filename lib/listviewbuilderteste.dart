import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'exercicios.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async
{
  final path = await _localPath;
  return File('$path/exercicios.json');
}

  Future<Exercicios> lerJson() async {

    File jsonFile = await _localFile;
    if(jsonFile.existsSync()){

      final jsonString = jsonFile.readAsStringSync();
      final Map<String, dynamic> jsonResponse = json.decode(jsonString);
      Exercicios exercicios = Exercicios.fromJson(jsonResponse);

      return exercicios;

    } else {

      jsonFile.createSync();
      jsonFile.writeAsStringSync('{"exercicios" : {"Triceps/Ombro/Peito" : [{"nome" : "Supino inclinado (articulado)","series" : "6","repeticoes" : "15","peso" : "30"},{"nome" : "Crucifixo na maquina","series" : "6","repeticoes" : "12","peso" : "25"},{"nome" : "Biceps rosca scott (maquina)","series" : "3","repeticoes" : "12","peso" : "30"},{"nome" : "Pulley anterior pronado","series" : "3","repeticoes" : "15","peso" : "26"},{"nome" : "Abdominal na maquina","series" : "3","repeticoes" : "12","peso" : "55"},{"nome" : "Elevacao frontal (polia)","series" : "3","repeticoes" : "12","peso" : "2,5"},{"nome" : "Triceps polia alta (pronado)","series" : "3","repeticoes" : "15","peso" : "10"},{"nome" : "Triceps arremesso","series" : "3","repeticoes" : "12","peso" : "5"},{"nome" : "Triceps francês","series" : "3","repeticoes" : "10","peso" : "5"},{"nome" : "Supino inclinado (halter) 30°","series" : "3","repeticoes" : "10","peso" : "8"},{"nome" : "Desenvolvimento banco (halter) 90°","series" : "4","repeticoes" : "15","peso" : "4"},{"nome" : "Elevacao lateral (halter)","series" : "4","repeticoes" : "10","peso" : "4"}],"Braco/Costas" : [{"nome" : "Pulley anterior pronado","series" : "6","repeticoes" : "15","peso" : "26"},{"nome" : "Remada maquina (unilateral)","series" : "6","repeticoes" : "12 + 10º","peso" : "30"},{"nome" : "Crucifixo inverso na maquina","series" : "6","repeticoes" : "15","peso" : "15"},{"nome" : "Biceps rosca scott (maquina)","series" : "6","repeticoes" : "12","peso" : "30"},{"nome" : "Supino inclinado (articulado)","series" : "3","repeticoes" : "15","peso" : "30"},{"nome" : "Crucifixo na maquina","series" : "3","repeticoes" : "12","peso" : "25"},{"nome" : "Abdominal na maquina","series" : "3","repeticoes" : "12","peso" : "55"},{"nome" : "Facepull","series" : "3","repeticoes" : "12","peso" : "2,5"},{"nome" : "Rosca martelo corda (polia baixa)","series" : "3","repeticoes" : "12","peso" : "10"},{"nome" : "Encolhimento de ombro com halteres","series" : "3","repeticoes" : "10","peso" : "10"},{"nome" : "Remada curvada (barra)","series" : "4","repeticoes" : "12","peso" : "5"},{"nome" : "Biceps rosca direta (barra w)","series" : "3","repeticoes" : "15","peso" : "2,5"}],"Perna" : [{"nome" : "Banco externsor","series" : "6","repeticoes" : "15","peso" : "30"},{"nome" : "Banco flexor","series" : "6","repeticoes" : "15","peso" : "45"},{"nome" : "Leg press 45°","series" : "4","repeticoes" : "12","peso" : "7,5"},{"nome" : "Panturrilha no hack","series" : "4","repeticoes" : "15","peso" : "7,5"},{"nome" : "Banco abdutor","series" : "6","repeticoes" : "12","peso" : "35"},{"nome" : "Banco adutor","series" : "6","repeticoes" : "12","peso" : "50"},{"nome" : "Mesa flexora","series" : "4","repeticoes" : "12","peso" : "25"},{"nome" : "Agachamento guiado (smith)","series" : "3","repeticoes" : "12","peso" : "5"},{"nome" : "Stiff (barra)","series" : "3","repeticoes" : "12","peso" : "5"},{"nome" : "Pulley anterior pronado","series" : "3","repeticoes" : "15","peso" : "26"},{"nome" : "Remada maquina (unilateral)","series" : "3","repeticoes" : "12 + 10º","peso" : "30"},{"nome" : "Crucifixo inverso na maquina","series" : "3","repeticoes" : "15","peso" : "15"},{"nome" : "Biceps rosca scott (maquina)","series" : "3","repeticoes" : "12","peso" : "30"},{"nome" : "Supino inclinado (articulado)","series" : "3","repeticoes" : "15","peso" : "30"},{"nome" : "Crucifixo na maquina","series" : "3","repeticoes" : "12","peso" : "25"},{"nome" : "Abdominal na maquina","series" : "3","repeticoes" : "12","peso" : "55" }]}}');
      String jsonString = jsonFile.readAsStringSync();
      Map<String, dynamic> jsonResponse = json.decode(jsonString);
      Exercicios exercicios = Exercicios.fromJson(jsonResponse);

      return exercicios;
    }
  }

class BuilderTeste extends StatefulWidget {
  const BuilderTeste({Key? key}) : super(key: key);

  @override
  State<BuilderTeste> createState() => _BuilderTesteState();
}

class _BuilderTesteState extends State<BuilderTeste> {

  @override
  void initState(){
    lerJson();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
          future: lerJson(),
          builder: (context, data){
            if(data.hasError){
              return Center(child: Text("${data.error}", style: Theme.of(context).textTheme.headline5!.copyWith(color: const Color.fromRGBO(24, 25, 26, 1.0))));
            }
            else if (data.hasData) {
              var exercicios = data.data as Exercicios;
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                  itemCount: exercicios.bracoCostas == null
                      ? 0
                      : exercicios.bracoCostas!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                      child: Container(
                        height: 75,
                        decoration: BoxDecoration(
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
                                      "${exercicios.bracoCostas![index].nome}",
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${exercicios.bracoCostas![index].repeticoes}  ",
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                      if (exercicios.bracoCostas![index].series == "6")
                                        Text(
                                            "2x${((int.parse(exercicios.bracoCostas![index].peso.toString()) * 2)/3).round()}  "
                                            "2x${(((int.parse(exercicios.bracoCostas![index].peso.toString()) + (int.parse(exercicios.bracoCostas![index].peso.toString()) * 2)/3)/2)).round()}  "
                                            "2x${int.parse(exercicios.bracoCostas![index].peso.toString())}",
                                          style: TextStyle(color: Colors.white70),
                                        )
                                      else Text(
                                          "${exercicios.bracoCostas![index].series}x${exercicios.bracoCostas![index].peso}",
                                          style: TextStyle(color: Colors.white70),
                                      )
                                    ],
                                  )
                                )
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      color: Colors.white70,
                                      onPressed: () {},
                                      icon: Icon(Icons.edit_rounded)
                                  ),
                                  IconButton(
                                    color: Colors.white70,
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.check_box_rounded,
                                    ),
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
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
    );
  }
}
