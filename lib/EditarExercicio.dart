import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class EditarExercicio extends StatefulWidget {
  final Map<String, dynamic> exercicio;
  final String categoria;
  final int index;

  const EditarExercicio({
    Key? key,
    required this.exercicio,
    required this.categoria,
    required this.index,
  }) : super(key: key);

  @override
  State<EditarExercicio> createState() => _EditarExercicioState();
}

class _EditarExercicioState extends State<EditarExercicio> {
  late TextEditingController nomeController;
  late TextEditingController seriesController;
  late TextEditingController repeticoesController;
  late TextEditingController pesoController;

  @override
  void initState() {
    super.initState();
    nomeController = TextEditingController(text: widget.exercicio['nome']);
    seriesController = TextEditingController(text: widget.exercicio['series']);
    repeticoesController = TextEditingController(text: widget.exercicio['repeticoes']);
    pesoController = TextEditingController(text: widget.exercicio['peso']);
  }

  Future<void> salvarArquivoJSON(Map<String, dynamic> novoExercicio) async {
    final diretorio = await getApplicationDocumentsDirectory();
    final arquivo = File('${diretorio.path}/exercicios.json');

    if (await arquivo.exists()) {
      final conteudo = await arquivo.readAsString();
      final jsonCompleto = json.decode(conteudo);

      final listaCategoria = jsonCompleto['exercicios'][widget.categoria] as List;
      listaCategoria[widget.index] = novoExercicio;

      jsonCompleto['exercicios'][widget.categoria] = listaCategoria;
      await arquivo.writeAsString(json.encode(jsonCompleto));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Editar Exercício',
          style: TextStyle(color: Colors.white70),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check, color: Colors.green),
            onPressed: () async {
              final novoExercicio = {
                'nome': nomeController.text,
                'series': seriesController.text,
                'repeticoes': repeticoesController.text,
                'peso': pesoController.text,
              };

              await salvarArquivoJSON(novoExercicio);
              Navigator.pop(context, novoExercicio);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            campoTexto(
              controller: nomeController,
              label: 'Nome do Exercício',
            ),
            SizedBox(height: 16),
            campoTexto(
              controller: seriesController,
              label: 'Séries',
              tipoTeclado: TextInputType.number,
            ),
            SizedBox(height: 16),
            campoTexto(
              controller: repeticoesController,
              label: 'Repetições',
            ),
            SizedBox(height: 16),
            campoTexto(
              controller: pesoController,
              label: 'Peso (kg)',
              tipoTeclado: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }

  Widget campoTexto({
    required TextEditingController controller,
    required String label,
    TextInputType tipoTeclado = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: tipoTeclado,
      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.orange),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange.withOpacity(0.7)),
        ),
      ),
    );
  }
}