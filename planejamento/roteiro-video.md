# Roteiro do vídeo - TaskReport Dart

Tempo máximo: 5 minutos.

## 1. Abertura

Olá, meu nome é Maria e este é o projeto TaskReport Dart, desenvolvido para o mini-projeto avaliativo do Módulo 01, Semana 07.

O objetivo do sistema é simular o tratamento de dados de tarefas recebidos de uma API. Esses dados chegam com alguns problemas, como campos nulos, espaços extras e valores em texto, então o sistema precisa transformar tudo em objetos confiáveis e gerar um relatório final.

## 2. Mostrar a estrutura do projeto

Aqui está a estrutura do projeto:

- `main.dart`, onde está toda a lógica em Dart;
- `README.md`, com a explicação do projeto;
- pasta `planejamento`, onde está o Kanban e este roteiro do vídeo.

O projeto foi feito em Dart puro, sem Flutter UI, sem banco de dados e sem consumo real de API.

## 3. Explicar a base simulada da API

No começo do arquivo `main.dart`, eu tenho a variável `dadosTarefas`.

Ela é uma `List<Map<String, dynamic>>`, ou seja, uma lista de mapas. Cada mapa representa uma tarefa que teria vindo de uma API.

Alguns dados vêm com inconsistências de propósito:

- título com espaços extras;
- responsável com espaços extras;
- título nulo;
- responsável nulo;
- horas nulas;
- valor monetário como texto, por exemplo `R$ 120,00`.

## 4. Explicar a conversão dos mapas em objetos

Depois, o sistema transforma cada mapa em um objeto da classe `Tarefa`.

Essa conversão acontece na função `converterMapParaTarefa`.

Nela eu trato os dados antes de criar o objeto:

- uso `tratarTexto` para remover espaços e substituir valores nulos;
- uso `converterValor` para transformar o valor monetário em `double`;
- uso `converterHoras` para transformar horas em `int`;
- uso `identificarProblemasDoMapa` para guardar quais dados vieram incompletos na lista original.

Na função `main`, eu uso o método `map` para transformar todos os mapas em objetos:

```dart
List<Tarefa> tarefas = dadosTarefas.map(converterMapParaTarefa).toList();
```

## 5. Explicar POO

O projeto também aplica Programação Orientada a Objetos.

Primeiro, eu criei a classe base `ItemTrabalho`, que tem os atributos `id` e `titulo`, além do método `exibirResumo`.

Depois, criei a classe `Tarefa`, que herda de `ItemTrabalho` usando `extends`.

A classe `Tarefa` adiciona outros atributos:

- `responsavel`;
- `status`;
- `prioridade`;
- `valor`;
- `horas`;
- `dadosIncompletos`.

Também usei construtor para inicializar os objetos e usei `@override` para sobrescrever o método `exibirResumo`.

Isso demonstra herança e polimorfismo.

## 6. Explicar encapsulamento

O encapsulamento aparece na classe `RelatorioTarefas`.

Ela recebe uma lista de tarefas, mas guarda essa lista no atributo privado `_tarefas`.

Assim, a lista fica protegida dentro da classe, e as informações são acessadas por métodos e getters, como:

- `quantidadeTotal`;
- `quantidadePorStatus`;
- `gerarRelatorioFinal`.

## 7. Explicar filtros, cálculos e coleções

O sistema usa várias funções para analisar as tarefas:

- `filtrarTarefasPorStatus`, usando `where`;
- `somarValoresTarefasConcluidas`, usando `where`, `map` e `reduce`;
- `calcularMediaValorTarefasPendentes`;
- `calcularTotalHorasPorStatus`, usando `Map<String, int>`;
- `obterStatusUnicos`, usando `Set`;
- `identificarTarefasComDadosIncompletos`.

Também usei `every` para verificar se todas as tarefas possuem horas válidas.

Então, no projeto aparecem `List`, `Map`, `Set`, funções, loops, if, operador ternário e métodos avançados de coleção.

## 8. Executar o projeto

Agora vou executar o projeto no terminal com:

```bash
dart run main.dart
```

Na saída, o sistema mostra primeiro todas as tarefas convertidas.

Depois, mostra as tarefas concluídas, soma os valores das concluídas, calcula a média das pendentes, totaliza horas por status, lista status únicos e identifica tarefas incompletas.

No final, aparece o `RELATÓRIO FINAL DE TAREFAS`.

Os principais resultados são:

- total de tarefas analisadas: 7;
- tarefas concluídas: 3;
- tarefas pendentes: 2;
- tarefas em andamento: 1;
- tarefas canceladas: 1;
- valor total das concluídas: R$ 470.75;
- média das pendentes: R$ 85.00;
- total de horas concluídas: 9;
- tarefas incompletas: IDs 3 e 4.

## 9. Explicar organização com Kanban e Git

Para organizar o projeto, usei um Kanban em Markdown no arquivo `planejamento/tarefas-kanban.md`.

Ele tem as colunas:

- Backlog;
- A Fazer;
- Em Andamento;
- Concluído.

Também organizei o Git com branches:

- `main`;
- `develop`;
- `feat/conversao-dados`;
- `feat/relatorio-tarefas`;
- `docs/readme-video`.

E fiz commits com mensagens descritivas para registrar a evolução do projeto.

## 10. Fechamento

Como melhoria futura, eu poderia separar o código em mais arquivos, criar testes automatizados e depois evoluir esse projeto para uma interface Flutter.

Mas para este mini-projeto, o foco foi cumprir a lógica em Dart puro: transformar dados, tratar inconsistências, aplicar POO e gerar o relatório final.

Obrigada.

## Checklist rápido antes de gravar

- [ ] Abrir o `main.dart`
- [ ] Mostrar `dadosTarefas`
- [ ] Mostrar `converterMapParaTarefa`
- [ ] Mostrar `ItemTrabalho` e `Tarefa`
- [ ] Mostrar `RelatorioTarefas`
- [ ] Mostrar `tarefas-kanban.md`
- [ ] Mostrar branches e commits no GitHub ou no terminal
- [ ] Rodar `dart run main.dart`
- [ ] Mostrar o relatório final
- [ ] Falar uma melhoria futura
