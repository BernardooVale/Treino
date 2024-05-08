import 'package:flutter/material.dart';
import 'package:treino/listviewbuilderteste.dart';

import 'barra_navegacao.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

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
      body: pagina == 0 ? Column()
            : pagina == 1 ? BuilderTeste()
            : Column(),
      bottomNavigationBar: BarraNavegacao(mudancaPagina: _mudancaPagina),
    );
  }
}