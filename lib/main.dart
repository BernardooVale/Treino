import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'container_teste.dart';
import 'inicio.dart';
import 'exercicios.dart';
import 'listviewbuilderteste.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async
{
  final path = await _localPath;
  print(path);
  return File('$path/exercicios.json');
}

Future<void> lerJson() async {

  File jsonFile = await _localFile;
  if(jsonFile.existsSync()){
    final jsonString = jsonFile.readAsStringSync();
    print("Existe");
    print(jsonString);
    print(json.decode(jsonString));
    final Map<String, dynamic> jsonResponse = json.decode(jsonString);
    Exercicios exercicios = Exercicios.fromJson(jsonResponse);

  } else {
    print("n existe");
    jsonFile.createSync();
    jsonFile.writeAsStringSync('{"exercicios" : [{"Triceps/Ombro/Peito" : [{"nome" : "Supino inclinado (articulado)","series" : "6","repeticoes" : "15","peso" : "30"},{"nome" : "Crucifixo na maquina","series" : "6","repeticoes" : "12","peso" : "25"},{"nome" : "Biceps rosca scott (maquina)","series" : "3","repeticoes" : "12","peso" : "30"},{"nome" : "Pulley anterior pronado","series" : "3","repeticoes" : "15","peso" : "26"},{"nome" : "Abdominal na maquina","series" : "3","repeticoes" : "12","peso" : "55"},{"nome" : "Elevacao frontal (polia)","series" : "3","repeticoes" : "12","peso" : "2,5"},{"nome" : "Triceps polia alta (pronado)","series" : "3","repeticoes" : "15","peso" : "10"},{"nome" : "Triceps arremesso","series" : "3","repeticoes" : "12","peso" : "5"},{"nome" : "Triceps francês","series" : "3","repeticoes" : "10","peso" : "5"},{"nome" : "Supino inclinado (halter) 30°","series" : "3","repeticoes" : "10","peso" : "8"},{"nome" : "Desenvolvimento banco (halter) 90°","series" : "4","repeticoes" : "15","peso" : "4"},{"nome" : "Elevacao lateral (halter)","series" : "4","repeticoes" : "10","peso" : "4"}],"Braço/Costas" : [{"nome" : "Pulley anterior pronado","series" : "6","repeticoes" : "15","peso" : "26"},{"nome" : "Remada maquina (unilateral)","series" : "6","repeticoes" : "12 + 10º","peso" : "30"},{"nome" : "Crucifixo inverso na maquina","series" : "6","repeticoes" : "15","peso" : "15"},{"nome" : "Biceps rosca scott (maquina)","series" : "6","repeticoes" : "12","peso" : "30"},{"nome" : "Supino inclinado (articulado)","series" : "3","repeticoes" : "15","peso" : "30"},{"nome" : "Crucifixo na maquina","series" : "3","repeticoes" : "12","peso" : "25"},{"nome" : "Abdominal na maquina","series" : "3","repeticoes" : "12","peso" : "55"},{"nome" : "Facepull","series" : "3","repeticoes" : "12","peso" : "2,5"},{"nome" : "Rosca martelo corda (polia baixa)","series" : "3","repeticoes" : "12","peso" : "10"},{"nome" : "Encolhimento de ombro com halteres","series" : "3","repeticoes" : "10","peso" : "10"},{"nome" : "Remada curvada (barra)","series" : "4","repeticoes" : "12","peso" : "5"},{"nome" : "Biceps rosca direta (barra w)","series" : "3","repeticoes" : "15","peso" : "2,5"}],"Perna" : [{"nome" : "Banco externsor","series" : "6","repeticoes" : "15","peso" : "30"},{"nome" : "Banco flexor","series" : "6","repeticoes" : "15","peso" : "45"},{"nome" : "Leg press 45°","series" : "4","repeticoes" : "12","peso" : "7,5"},{"nome" : "Panturrilha no hack","series" : "4","repeticoes" : "15","peso" : "7,5"},{"nome" : "Banco abdutor","series" : "6","repeticoes" : "12","peso" : "35"},{"nome" : "Banco adutor","series" : "6","repeticoes" : "12","peso" : "50"},{"nome" : "Mesa flexora","series" : "4","repeticoes" : "12","peso" : "25"},{"nome" : "Agachamento guiado (smith)","series" : "3","repeticoes" : "12","peso" : "5"},{"nome" : "Stiff (barra)","series" : "3","repeticoes" : "12","peso" : "5"},{"nome" : "Pulley anterior pronado","series" : "3","repeticoes" : "15","peso" : "26"},{"nome" : "Remada maquina (unilateral)","series" : "3","repeticoes" : "12 + 10º","peso" : "30"},{"nome" : "Crucifixo inverso na maquina","series" : "3","repeticoes" : "15","peso" : "15"},{"nome" : "Biceps rosca scott (maquina)","series" : "3","repeticoes" : "12","peso" : "30"},{"nome" : "Supino inclinado (articulado)","series" : "3","repeticoes" : "15","peso" : "30"},{"nome" : "Crucifixo na maquina","series" : "3","repeticoes" : "12","peso" : "25"},{"nome" : "Abdominal na maquina","series" : "3","repeticoes" : "12","peso" : "55"}]}]}');
    print(jsonFile.readAsStringSync());
    print(json.decode(jsonFile.readAsStringSync()));
    final jsonString = jsonFile.readAsStringSync();
    final Map<String, dynamic> jsonResponse = json.decode(jsonString);
    Exercicios exercicios = Exercicios.fromJson(jsonResponse);
  }

}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //lerJson();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Treino',
      home: Inicio(),
    );
  }
}
