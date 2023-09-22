// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  var nomeUsuarioController = TextEditingController();
  var alturaController = TextEditingController();

  late SharedPreferences storage;

  String? nomeUsuario;
  double? altura;
  bool receberPushNotification = false;
  bool temaEscuro = false;

  final CHAVE_NOME_USUARIO = "CHAVE_NOME_USUARIO";
  final CHAVE_ALTURA = "CHAVE_ALTURA";
  final CHAVE_RECEBER_NOTIFICACOES = "";
  final CHAVE_MODO_ESCURO = "";

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    storage = await SharedPreferences.getInstance();
    nomeUsuarioController.text = storage.getString(CHAVE_NOME_USUARIO) ?? "";
    alturaController.text = (storage.getDouble(CHAVE_ALTURA) ?? 0).toString();
    receberPushNotification =
        storage.getBool(CHAVE_RECEBER_NOTIFICACOES) ?? false;
    temaEscuro = storage.getBool(CHAVE_MODO_ESCURO) ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Configurações")),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: const InputDecoration(hintText: "Nome usuário"),
                controller: nomeUsuarioController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Altura"),
                controller: alturaController,
              ),
            ),
            SwitchListTile(
              title: const Text("Receber notificações"),
              onChanged: (bool value) {
                setState(() {
                  receberPushNotification = value;
                });
              },
              value: receberPushNotification,
            ),
            SwitchListTile(
              title: const Text("Tema escuro"),
              onChanged: (bool value) {
                setState(() {
                  temaEscuro = value;
                });
              },
              value: temaEscuro,
            ),
            TextButton(
                onPressed: () async {
                  try {
                    FocusManager.instance.primaryFocus?.unfocus();
                    await storage.setDouble(
                        CHAVE_ALTURA, double.parse(alturaController.text));
                  } catch (e) {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text("Meu App"),
                            content:
                                const Text("Favor informar uma altura válida!"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("OK"))
                            ],
                          );
                        });
                    return;
                  }
                  await storage.setString(
                      CHAVE_NOME_USUARIO, nomeUsuarioController.text);
                  await storage.setBool(
                      CHAVE_RECEBER_NOTIFICACOES, receberPushNotification);
                  await storage.setBool(CHAVE_MODO_ESCURO, temaEscuro);
                  Navigator.pop(context);
                },
                child: const Text("Salvar"))
          ],
        ),
      ),
    ));
  }
}
