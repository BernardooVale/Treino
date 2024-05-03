import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'inicio.dart' as inicio;

class BarraNavegacao extends StatefulWidget {
  final Function(int) mudancaPagina;
  const BarraNavegacao({Key? key, required this.mudancaPagina}) : super(key: key);

  @override
  State<BarraNavegacao> createState() => _BarraNavegacaoState();
}

class _BarraNavegacaoState extends State<BarraNavegacao> {
  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 15
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: GNav(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          color: Colors.white70,
          activeColor: Colors.deepOrange,
          gap: 10,
          onTabChange: (index){
            widget.mudancaPagina(index);
          },
          tabs: [
            GButton(
              text: "Triceps/Ombro/Peito",
              icon: Icons.vertical_align_top_rounded,
            ),
            GButton(
              text: "Braço/Costas",
              icon: Icons.call_missed_outgoing_rounded,
            ),
            GButton(
              text: "Perna",
              icon: Icons.vertical_align_bottom_rounded,
            )
          ],
        ),
      ),
    );
  }
}