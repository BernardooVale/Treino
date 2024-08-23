import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'inicio.dart';
import 'exercicios.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/exercicios.json');
}

Future<Exercicios> lerJson() async {

  final jsonFile = await _localFile;
  if (jsonFile.existsSync()) {
    final jsonString = jsonFile.readAsStringSync();
    final Map<String, dynamic> jsonResponse = json.decode(jsonString);
    return Exercicios.fromJson(jsonResponse);
  } else {
    jsonFile.createSync();
    jsonFile.writeAsStringSync(
        '{"exercicios" :{"Triceps/Ombro/Peito" : [{"nome" : "Rosca martelo corda (polia baixa)","series" : "3","repeticoes" : "12","peso" : "10"},{"nome" : "Triceps francês","series" : "3","repeticoes" : "10","peso" : "5"},{"nome" : "Elevacao frontal (polia)","series" : "3","repeticoes" : "12","peso" : "2,5"},{"nome" : "Triceps arremesso","series" : "3","repeticoes" : "12","peso" : "5"},{"nome" : "Triceps polia alta (pronado)","series" : "3","repeticoes" : "15","peso" : "10"},{"nome" : "Biceps rosca scott (maquina)","series" : "3","repeticoes" : "12","peso" : "30"},{"nome" : "Crucifixo na maquina","series" : "6","repeticoes" : "12","peso" : "30"},{"nome" : "Supino inclinado (articulado)","series" : "6","repeticoes" : "15","peso" : "30"},{"nome" : "Abdominal na maquina","series" : "3","repeticoes" : "12","peso" : "55"},{"nome" : "Pulley anterior pronado","series" : "3","repeticoes" : "15","peso" : "26"},{"nome" : "Supino inclinado (halter) 30°","series" : "3","repeticoes" : "10","peso" : "9"},{"nome" : "Desenvolvimento banco (halter) 90°","series" : "4","repeticoes" : "15","peso" : "5"},{"nome" : "Elevacao lateral (halter)","series" : "4","repeticoes" : "10","peso" : "4"}],"Braco/Costas" : [{"nome" : "Rosca martelo corda (polia baixa)","series" : "3","repeticoes" : "12","peso" : "10"},{"nome" : "Triceps polia alta (pronado)","series" : "3","repeticoes" : "15","peso" : "10"},{"nome" : "Biceps rosca scott (maquina)","series" : "6","repeticoes" : "12","peso" : "30"},{"nome" : "Crucifixo na maquina","series" : "3","repeticoes" : "12","peso" : "30"},{"nome" : "Crucifixo inverso na maquina","series" : "6","repeticoes" : "15","peso" : "15"},{"nome" : "Pulley anterior pronado","series" : "6","repeticoes" : "15","peso" : "26"},{"nome" : "Abdominal na maquina","series" : "3","repeticoes" : "12","peso" : "55"},{"nome" : "Remada maquina (unilateral)","series" : "6","repeticoes" : "12","peso" : "30"},{"nome" : "Facepull","series" : "3","repeticoes" : "12","peso" : "2,5"},{"nome" : "Encolhimento de ombro com halteres","series" : "3","repeticoes" : "10","peso" : "18"},{"nome" : "Biceps rosca direta (barra w)","series" : "3","repeticoes" : "15","peso" : "15"},{"nome" : "Remada curvada (barra)","series" : "4","repeticoes" : "12","peso" : "20"}],"Perna" : [{"nome" : "Agachamento guiado (smith)","series" : "3","repeticoes" : "12","peso" : "5"},{"nome" : "Banco abdutor","series" : "6","repeticoes" : "12","peso" : "35"},{"nome" : "Banco adutor","series" : "6","repeticoes" : "12","peso" : "50"},{"nome" : "Leg press 45°","series" : "4","repeticoes" : "12","peso" : "7,5"},{"nome" : "Banco externsor","series" : "6","repeticoes" : "15","peso" : "30"},{"nome" : "Banco flexor","series" : "6","repeticoes" : "15","peso" : "45"},{"nome" : "Mesa flexora","series" : "4","repeticoes" : "12","peso" : "25"},{"nome" : "Panturrilha no hack","series" : "4","repeticoes" : "15","peso" : "7,5"},{"nome" : "Stiff (barra)","series" : "3","repeticoes" : "12","peso" : "5"},{"nome" : "Rosca martelo corda (polia baixa)","series" : "3","repeticoes" : "12","peso" : "10"},{"nome" : "Triceps polia alta (pronado)","series" : "3","repeticoes" : "15","peso" : "10"},{"nome" : "Biceps rosca scott (maquina)","series" : "3","repeticoes" : "12","peso" : "30"},{"nome" : "Crucifixo na maquina","series" : "3","repeticoes" : "12","peso" : "25"},{"nome" : "Abdominal na maquina","series" : "3","repeticoes" : "12","peso" : "55"},{"nome" : "Pulley anterior pronado","series" : "3","repeticoes" : "15","peso" : "26"}]}}'
    );
    final jsonString = jsonFile.readAsStringSync();
    final Map<String, dynamic> jsonResponse = json.decode(jsonString);
    return Exercicios.fromJson(jsonResponse);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final exercicios = await lerJson();
  runApp(
      MaterialApp(
        title: "Treino",
        home: Inicio(exercicios: exercicios))
      );
}

