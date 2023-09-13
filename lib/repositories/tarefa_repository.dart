import 'package:trilhaapp/model/tarefa.dart';

class TarefaRepository {
  final List<Tarefa> _tarefas = [];

  void adicionar(Tarefa tarefa) {
    Future.delayed(const Duration(seconds: 1));

    _tarefas.add(tarefa);
  }

  void alterar(String id, bool concluido) async {
    await Future.delayed(const Duration(seconds: 1));
    _tarefas
        .where((element) => element.getId() == id)
        .first
        .setconcluido(concluido);
  }

  List<Tarefa> listarTarefas() {
    Future.delayed(const Duration(seconds: 1));
    return _tarefas;
  }
}
