import 'package:flutter/material.dart';

class ContainerTeste extends StatefulWidget {
  const ContainerTeste({Key? key}) : super(key: key);

  @override
  State<ContainerTeste> createState() => _ContainerTesteState();
}

class _ContainerTesteState extends State<ContainerTeste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 75),
        child: Column(
          children: [
            Container(
              height: 75,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.orange,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Biceps rosca scott (maquina)",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "12 rep  2x20kg  2x20kg  2x20kg",
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.edit_rounded)
                      ),
                      IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.check_box_rounded,
                          ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
