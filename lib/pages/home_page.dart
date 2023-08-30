import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/service/gerador_numero_aleatorio_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroGerado = 0;
  var quantidadeDeClicks = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Meu app",
        //style: GoogleFonts.pacifico(),
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Foi clicado $quantidadeDeClicks vezes",
            style: GoogleFonts.acme(fontSize: 20),
          )),
          Center(
              child: Text(
            "O número gerado foi: $numeroGerado",
            style: GoogleFonts.acme(fontSize: 20),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_box),
          onPressed: () {
            setState(() {
              quantidadeDeClicks = quantidadeDeClicks + 1;
              numeroGerado =
                  GeradorNumeroAleatorioService.gerarNumeroAleatorio(100);
            });
          }),
    );
  }
}
