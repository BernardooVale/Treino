import 'package:flutter/material.dart';
import 'exercicios.dart';
import 'barra_navegacao.dart';
import 'construtor.dart';

class Inicio extends StatefulWidget {
  final Exercicios exercicios;

  const Inicio({Key? key, required this.exercicios}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int pagina = 0;

  void _mudancaPagina(int index) {
    setState(() {
      pagina = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Text(
          "Treino",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: pagina == 0 ?
        Construtor(exercicios: widget.exercicios, dia: 0) :
        pagina == 1 ?
          Construtor(exercicios: widget.exercicios, dia: 1) :
          Construtor(exercicios: widget.exercicios, dia: 2),
      bottomNavigationBar: BarraNavegacao(mudancaPagina: _mudancaPagina),
    );
  }
}
