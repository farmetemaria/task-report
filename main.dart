final List<Map<String, dynamic>> dadosTarefas = [
  {
    'id': 1,
    'titulo': '  Corrigir bug login  ',
    'responsavel': 'Ana',
    'status': 'concluida',
    'prioridade': 'alta',
    'valor': 'R\$ 120,00',
    'horas': '2',
  },
  {
    'id': 2,
    'titulo': 'Criar tela de perfil',
    'responsavel': '  Bruno  ',
    'status': 'em andamento',
    'prioridade': 'media',
    'valor': 'R\$ 250,50',
    'horas': '5',
  },
  {
    'id': 3,
    'titulo': null,
    'responsavel': 'Carla',
    'status': 'pendente',
    'prioridade': 'baixa',
    'valor': 'R\$ 80,00',
    'horas': null,
  },
  {
    'id': 4,
    'titulo': '  Ajustar navegação  ',
    'responsavel': null,
    'status': 'concluida',
    'prioridade': 'alta',
    'valor': 'R\$ 150,75',
    'horas': '3',
  },
  {
    'id': 5,
    'titulo': 'Revisar regras de negócio',
    'responsavel': 'Daniel',
    'status': 'cancelada',
    'prioridade': 'media',
    'valor': 'R\$ 0,00',
    'horas': '0',
  },
  {
    'id': 6,
    'titulo': 'Implementar validação de dados',
    'responsavel': 'Eduarda',
    'status': 'concluida',
    'prioridade': 'alta',
    'valor': 'R\$ 200,00',
    'horas': '4',
  },
  {
    'id': 7,
    'titulo': 'Organizar documentação ',
    'responsavel': 'Felipe',
    'status': 'pendente',
    'prioridade': 'baixa',
    'valor': 'R\$ 90,00',
    'horas': '2',
  },
];

// RF13 - Classe base
class ItemTrabalho {
  int id;
  String titulo;

  ItemTrabalho({required this.id, required this.titulo});

  void exibirResumo() {
    print('Item $id - $titulo');
  }
}

// RF13 - Classe filha
class Tarefa extends ItemTrabalho {
  String responsavel;
  String status;
  String prioridade;
  double valor;
  int horas;
  List<String> dadosIncompletos;

  Tarefa({
    required int id,
    required String titulo,
    required this.responsavel,
    required this.status,
    required this.prioridade,
    required this.valor,
    required this.horas,
    required this.dadosIncompletos,
  }) : super(id: id, titulo: titulo);

  // RF13 - Polimorfismo com @override
  @override
  void exibirResumo() {
    print('Tarefa $id - $titulo | Status: $status | Valor: R\$ ${valor.toStringAsFixed(2)}');
  }

  void exibirDadosCompletos() {
    print('ID: $id');
    print('Título: $titulo');
    print('Responsável: $responsavel');
    print('Status: $status');
    print('Prioridade: $prioridade');
    print('Valor: R\$ ${valor.toStringAsFixed(2)}');
    print('Horas: $horas');
    print('-----------------------------');
  }
}

// RF01 - Transformar mapa em objeto Tarefa
Tarefa converterMapParaTarefa(Map<String, dynamic> item) {
  int id = item['id'];
  List<String> dadosIncompletos = identificarProblemasDoMapa(item);

  print('Tratando dados nulos para tarefa ID: $id');
  print('Removendo espaços em branco para tarefa ID: $id');

  String titulo = tratarTexto(item['titulo'], 'Sem título');
  String responsavel = tratarTexto(item['responsavel'], 'Não informado');
  String status = tratarTexto(item['status'], 'sem status');
  String prioridade = tratarTexto(item['prioridade'], 'sem prioridade');
  double valor = converterValor(item['valor']);
  int horas = converterHoras(item['horas']);

  return Tarefa(
    id: id,
    titulo: titulo,
    responsavel: responsavel,
    status: status,
    prioridade: prioridade,
    valor: valor,
    horas: horas,
    dadosIncompletos: dadosIncompletos,
  );
}

// RF02 e RF03 - Tratar nulos e remover espaços desnecessários
String tratarTexto(dynamic texto, String valorPadrao) {
  if (texto == null) {
    return valorPadrao;
  }

  String textoTratado = texto.toString().trim();
  return textoTratado.isEmpty ? valorPadrao : textoTratado;
}

// RF04 - Converter valor monetário para número
double converterValor(dynamic valor) {
  if (valor == null) {
    return 0.0;
  }

  String valorLimpo = valor
      .toString()
      .replaceAll('R\$', '')
      .replaceAll(' ', '')
      .replaceAll(',', '.')
      .trim();

  return double.tryParse(valorLimpo) ?? 0.0;
}

// RF05 - Converter horas para número inteiro
int converterHoras(dynamic horas) {
  if (horas == null) {
    return 0;
  }

  return int.tryParse(horas.toString().trim()) ?? 0;
}

// RF11 - Identificar dados incompletos na lista original
List<String> identificarProblemasDoMapa(Map<String, dynamic> item) {
  List<String> problemas = [];

  if (item['titulo'] == null || item['titulo'].toString().trim().isEmpty) {
    problemas.add('título ausente');
  }

  if (item['responsavel'] == null ||
      item['responsavel'].toString().trim().isEmpty) {
    problemas.add('responsável ausente');
  }

  if (item['status'] == null || item['status'].toString().trim().isEmpty) {
    problemas.add('status ausente');
  }

  if (item['valor'] == null || converterValor(item['valor']) == 0.0 && item['valor'].toString().trim() != 'R\$ 0,00') {
    problemas.add('valor inválido');
  }

  if (item['horas'] == null || item['horas'].toString().trim().isEmpty) {
    problemas.add('horas ausentes');
  }

  return problemas;
}

// RF07 - Filtrar tarefas por status
List<Tarefa> filtrarTarefasPorStatus(List<Tarefa> tarefas, String status) {
  print('Filtrando tarefas com status: $status');
  return tarefas.where((tarefa) => tarefa.status == status).toList();
}

// RF08 - Somar valores das tarefas concluídas
double somarValoresTarefasConcluidas(List<Tarefa> tarefas) {
  print('Somando valores das tarefas concluídas');
  List<double> valoresConcluidos = tarefas
      .where((tarefa) => tarefa.status == 'concluida')
      .map((tarefa) => tarefa.valor)
      .toList();

  if (valoresConcluidos.isEmpty) {
    return 0.0;
  }

  return valoresConcluidos.reduce((soma, valor) => soma + valor);
}

// RF09 - Calcular média de valor das tarefas pendentes
double calcularMediaValorTarefasPendentes(List<Tarefa> tarefas) {
  print('Calculando média de valor das tarefas pendentes');
  List<Tarefa> tarefasPendentes = tarefas
      .where((tarefa) => tarefa.status == 'pendente')
      .toList();

  if (tarefasPendentes.isEmpty) {
    return 0.0;
  }

  double soma = 0.0;
  for (var tarefa in tarefasPendentes) {
    soma += tarefa.valor;
  }

  return soma / tarefasPendentes.length;
}

// RF10 - Calcular total de horas por status
Map<String, int> calcularTotalHorasPorStatus(List<Tarefa> tarefas) {
  print('Calculando total de horas por status');
  Map<String, int> totalHorasPorStatus = {};

  for (var tarefa in tarefas) {
    if (totalHorasPorStatus.containsKey(tarefa.status)) {
      totalHorasPorStatus[tarefa.status] =
          totalHorasPorStatus[tarefa.status]! + tarefa.horas;
    } else {
      totalHorasPorStatus[tarefa.status] = tarefa.horas;
    }
  }

  return totalHorasPorStatus;
}

// RF11 - Identificar tarefas com dados incompletos
List<Tarefa> identificarTarefasComDadosIncompletos(List<Tarefa> tarefas) {
  print('Identificando tarefas com dados incompletos');
  return tarefas
      .where((tarefa) => tarefa.dadosIncompletos.isNotEmpty)
      .toList();
}

// RF12 - Exibir status únicos usando Set
Set<String> obterStatusUnicos(List<Tarefa> tarefas) {
  print('Obtendo status únicos');
  Set<String> statusUnicos = {};

  for (var tarefa in tarefas) {
    statusUnicos.add(tarefa.status);
  }

  return statusUnicos;
}

// RF14 - Encapsulamento
class RelatorioTarefas {
  final List<Tarefa> _tarefas;

  RelatorioTarefas(this._tarefas);

  int get quantidadeTotal => _tarefas.length;

  int quantidadePorStatus(String status) {
    return _tarefas.where((tarefa) => tarefa.status == status).length;
  }

  void gerarRelatorioFinal() {
    double valorTotalConcluidas = somarValoresTarefasConcluidas(_tarefas);
    double mediaPendentes = calcularMediaValorTarefasPendentes(_tarefas);
    Map<String, int> horasPorStatus = calcularTotalHorasPorStatus(_tarefas);
    Set<String> statusUnicos = obterStatusUnicos(_tarefas);
    List<Tarefa> tarefasIncompletas = identificarTarefasComDadosIncompletos(
      _tarefas,
    );

    print('');
    print('RELATÓRIO FINAL DE TAREFAS');
    print('');
    print('Total de tarefas analisadas: $quantidadeTotal');
    print('Tarefas concluídas: ${quantidadePorStatus('concluida')}');
    print('Tarefas pendentes: ${quantidadePorStatus('pendente')}');
    print('Tarefas em andamento: ${quantidadePorStatus('em andamento')}');
    print('Tarefas canceladas: ${quantidadePorStatus('cancelada')}');
    print('');
    print('Valor total das concluídas: R\$ ${valorTotalConcluidas.toStringAsFixed(2)}');
    print('Média de valor das pendentes: R\$ ${mediaPendentes.toStringAsFixed(2)}');
    print('Total de horas concluídas: ${horasPorStatus['concluida'] ?? 0}');
    print('');
    print('Horas por status:');
    for (var entry in horasPorStatus.entries) {
      print('${entry.key}: ${entry.value} horas');
    }
    print('');
    print('Status encontrados:');
    for (var status in statusUnicos) {
      print(status);
    }
    print('');
    print('Tarefas com dados incompletos:');
    for (var tarefa in tarefasIncompletas) {
      print('ID ${tarefa.id} - ${tarefa.dadosIncompletos.join(' ou ')}');
    }
  }
}

void main(List<String> args) {
  // RF01 e métodos avançados: map transforma a lista de mapas em objetos.
  List<Tarefa> tarefas = dadosTarefas.map(converterMapParaTarefa).toList();

  // RF06 - Exibir todas as tarefas convertidas
  print('');
  print('TAREFAS CONVERTIDAS');
  for (var tarefa in tarefas) {
    tarefa.exibirDadosCompletos();
  }

  List<Tarefa> tarefasFiltradas = filtrarTarefasPorStatus(tarefas, 'concluida');

  print('');
  print('Tarefas com status "concluida":');
  for (var tarefa in tarefasFiltradas) {
    tarefa.exibirResumo();
  }

  double soma = somarValoresTarefasConcluidas(tarefas);
  print('Soma dos valores das tarefas concluídas: R\$ ${soma.toStringAsFixed(2)}');

  double media = calcularMediaValorTarefasPendentes(tarefas);
  String mensagemMedia = media > 0
      ? 'Média dos valores das tarefas pendentes: R\$ ${media.toStringAsFixed(2)}'
      : 'Não existem tarefas pendentes para calcular média.';
  print(mensagemMedia);

  Map<String, int> totalHorasPorStatus = calcularTotalHorasPorStatus(tarefas);
  print('Total de horas por status:');
  for (var entry in totalHorasPorStatus.entries) {
    print('  ${entry.key}: ${entry.value} horas');
  }

  List<Tarefa> tarefasIncompletas = identificarTarefasComDadosIncompletos(
    tarefas,
  );
  print('Tarefas com dados incompletos:');
  for (var tarefa in tarefasIncompletas) {
    print('ID: ${tarefa.id} - ${tarefa.dadosIncompletos.join(' ou ')}');
  }

  Set<String> statusUnicos = obterStatusUnicos(tarefas);
  print('Status encontrados:');
  for (var status in statusUnicos) {
    print('  $status');
  }

  bool todasTarefasPossuemHorasValidas = tarefas.every(
    (tarefa) => tarefa.horas >= 0,
  );
  print('Todas as tarefas possuem horas válidas? $todasTarefasPossuemHorasValidas');

  RelatorioTarefas relatorio = RelatorioTarefas(tarefas);
  relatorio.gerarRelatorioFinal();
}
