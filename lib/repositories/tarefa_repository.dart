import 'package:trilhaapp/model/tarefa.dart';

class TarefaRepository {
  final List<Tarefa> _tarefas = [];

  Future<void> adicionar(Tarefa tarefa) async {
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

  Future<List<Tarefa>> listar() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tarefas;
  }
}
