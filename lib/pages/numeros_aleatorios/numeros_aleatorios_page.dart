// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumerosAleatoriosSharedPreferencePage extends StatefulWidget {
  const NumerosAleatoriosSharedPreferencePage({super.key});

  @override
  State<NumerosAleatoriosSharedPreferencePage> createState() =>
      _NumerosAleatoriosSharedPreferencePageState();
}

class _NumerosAleatoriosSharedPreferencePageState
    extends State<NumerosAleatoriosSharedPreferencePage> {
  int? numeroGerado;
  int? quantidadeClicks;
  final CHAVE_NUMERO_ALEATORIO = "numero_gerado";
  final CHAVE_QUANTIDADE_CLICKS = "quantidade_clicks";
  late SharedPreferences storage;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      numeroGerado = storage.getInt(CHAVE_NUMERO_ALEATORIO);
      quantidadeClicks = storage.getInt(CHAVE_QUANTIDADE_CLICKS);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Gerador de Números aleatórios")),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              numeroGerado == null
                  ? "Nenhnum numero gerado"
                  : numeroGerado.toString(),
              style: const TextStyle(fontSize: 22),
            ),
            Text(
              quantidadeClicks == null
                  ? "Nenhum clique efetuado"
                  : quantidadeClicks.toString(),
              style: const TextStyle(fontSize: 22),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            storage = await SharedPreferences.getInstance();
            var random = Random();
            setState(() {
              numeroGerado = random.nextInt(1000);
              quantidadeClicks = (quantidadeClicks ?? 0) + 1;
            });
            storage.setInt(CHAVE_NUMERO_ALEATORIO, numeroGerado!);
            storage.setInt(CHAVE_QUANTIDADE_CLICKS, quantidadeClicks!);
          }),
    ));
  }
}
