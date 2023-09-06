import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({Key? key}) : super(key: key);

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  TextEditingController nomeController = TextEditingController(text: "");
  TextEditingController dataNascimentoController =
      TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var niveis = [];
  var nivelSelecionado;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Dados"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextLabel(texto: "Nome"),
            TextField(
              controller: nomeController,
            ),
            const TextLabel(texto: "Data de nasicmento"),
            TextField(
              controller: dataNascimentoController,
              readOnly: true,
              onTap: () async {
                var data = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000, 1, 1),
                    firstDate: DateTime(1900, 1, 1),
                    lastDate: DateTime(2050, 12, 31));
                if (data != null) {
                  dataNascimentoController.text = data.toString();
                  dataNascimento = data;
                }
              },
            ),
            const TextLabel(texto: "Nivel de experiência"),
            Column(
              children: niveis
                  .map(
                    (nivel) => RadioListTile(
                        dense: true,
                        title: Text(nivel.toString()),
                        selected: nivelSelecionado == nivel,
                        value: nivel,
                        groupValue: nivelSelecionado,
                        onChanged: (nivel) {
                          setState(() {
                            nivelSelecionado = nivel.toString();
                          });
                        }),
                  )
                  .toList(),
            ),
            TextButton(
                onPressed: () {
                  debugPrint(nomeController.text);
                  print(dataNascimento);
                },
                child: const Text("Salvar")),
          ],
        ),
      ),
    );
  }
}
