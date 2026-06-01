# TaskReport Dart

## Sobre o projeto

O TaskReport Dart é um simulador de tratamento de dados de tarefas feito em Dart puro.

O projeto simula o retorno de uma API usando uma lista de mapas (`List<Map<String, dynamic>>`). A partir desses dados, o sistema transforma cada mapa em um objeto, trata inconsistências, converte valores, calcula informações por status e gera um relatório final no console.

## Objetivo

Praticar os principais conceitos do Módulo 01:

- lógica de programação;
- linguagem Dart;
- tipos de dados;
- estruturas de decisão;
- estruturas de repetição;
- funções;
- arrow functions;
- `List`;
- `Map`;
- `Set`;
- métodos de coleção;
- classes;
- objetos;
- atributos;
- métodos;
- construtores;
- encapsulamento;
- herança;
- polimorfismo com `@override`;
- GitHub;
- GitFlow simplificado;
- Kanban.

## Como executar

Execute o arquivo `main.dart` no terminal:

```bash
dart run main.dart
```

Também é possível copiar o conteúdo de `main.dart` para o DartPad, caso esse seja o ambiente orientado em aula.

## Estrutura do projeto

```text
task-report/
├── main.dart
├── README.md
└── planejamento/
    └── tarefas-kanban.md
```

## Tecnologias utilizadas

- Dart puro
- Git e GitHub
- Kanban em Markdown

## O que o sistema faz

- Recebe uma base simulada de tarefas em `List<Map<String, dynamic>>`.
- Converte os mapas em objetos da classe `Tarefa`.
- Trata campos nulos.
- Remove espaços extras dos textos.
- Converte valores monetários para `double`.
- Converte horas para `int`.
- Exibe todas as tarefas convertidas.
- Filtra tarefas por status.
- Soma os valores das tarefas concluídas.
- Calcula a média de valor das tarefas pendentes.
- Calcula o total de horas por status.
- Lista os status únicos usando `Set`.
- Identifica tarefas que vieram com dados incompletos na lista original.
- Gera um relatório final consolidado no console.

## Conceitos aplicados no código

- `List`: usada para armazenar a lista de mapas e a lista de objetos `Tarefa`.
- `Map`: usado para simular o retorno de uma API.
- `Set`: usado para listar os status sem repetição.
- `map`: usado para transformar mapas em objetos.
- `where`: usado para filtrar tarefas por status.
- `reduce`: usado para somar os valores das tarefas concluídas.
- `every`: usado para verificar se todas as tarefas possuem horas válidas.
- `for`: usado para exibir tarefas e montar totais.
- `if`: usado para tratar valores nulos e validar dados.
- operador ternário: usado para escolher a mensagem da média de tarefas pendentes.
- classe base `ItemTrabalho`: representa um item de trabalho com `id` e `titulo`.
- classe filha `Tarefa`: herda de `ItemTrabalho` e adiciona os dados da tarefa.
- `@override`: usado para sobrescrever o método `exibirResumo`.
- encapsulamento: aplicado na classe `RelatorioTarefas`, com o atributo privado `_tarefas`.

## Relatório final gerado

Ao executar o projeto, o sistema apresenta um relatório com:

- total de tarefas analisadas;
- quantidade de tarefas concluídas;
- quantidade de tarefas pendentes;
- quantidade de tarefas em andamento;
- quantidade de tarefas canceladas;
- valor total das tarefas concluídas;
- média de valor das tarefas pendentes;
- total de horas por status;
- status encontrados;
- tarefas com dados incompletos.

## Kanban

O Kanban oficial do projeto está disponível no Notion:

https://comfortable-pick-578.notion.site/3713d53983d6807ba514ef541c7749a7?v=3713d53983d68023b60c000c61220874

Também mantive um registro em Markdown no arquivo:

```text
planejamento/tarefas-kanban.md
```

## GitFlow simplificado

Branches planejadas para a entrega individual:

- `main`: versão principal do projeto;
- `develop`: branch de desenvolvimento;
- `feat/conversao-dados`: ajustes de conversão, tratamento de nulos e tipos;
- `feat/relatorio-tarefas`: cálculos, filtros e relatório final;
- `docs/readme-video`: documentação, Kanban e preparação para o vídeo.

## Sugestão de commits

Sugestão de histórico mínimo para a entrega:

```bash
feat: ajusta conversao de mapas para tarefas
feat: aplica heranca e encapsulamento
feat: gera relatorio final de tarefas
docs: adiciona kanban do projeto
docs: atualiza readme com instrucoes
```

## Vídeo de apresentação

Link do vídeo:

https://drive.google.com/file/d/1lsJaQQSi-_b2tR2e4dapu_A0kF7znd_B/view?usp=sharing

No vídeo, devem ser apresentados:

- objetivo do sistema;
- base simulada como retorno de API;
- conversão de mapas em objetos;
- execução do projeto;
- organização no Kanban;
- branches e commits;
- uso de `List`, `Map` e `Set`;
- uso de classes, objetos, construtores, encapsulamento, herança e `@override`;
- pontos que poderiam ser melhorados futuramente.

## Link do repositório

https://github.com/farmetemaria/task-report

## Link do Kanban

https://comfortable-pick-578.notion.site/3713d53983d6807ba514ef541c7749a7?v=3713d53983d68023b60c000c61220874

## Checklist final

- [x] Criar arquivo `main.dart`
- [x] Criar arquivo `README.md`
- [x] Criar pasta `planejamento`
- [x] Criar arquivo `tarefas-kanban.md`
- [x] Usar `List<Map<String, dynamic>>`
- [x] Transformar mapas em objetos Dart
- [x] Criar classe base
- [x] Criar classe filha
- [x] Usar construtor
- [x] Usar atributos e métodos
- [x] Usar herança
- [x] Usar `@override`
- [x] Aplicar encapsulamento
- [x] Tratar campos nulos
- [x] Remover espaços extras dos textos
- [x] Converter valor monetário para `double`
- [x] Converter horas para `int`
- [x] Exibir todas as tarefas convertidas
- [x] Filtrar tarefas por status
- [x] Somar valores das tarefas concluídas
- [x] Calcular média das tarefas pendentes
- [x] Calcular total de horas por status
- [x] Listar status únicos com `Set`
- [x] Identificar tarefas com dados incompletos
- [x] Gerar relatório final no console
- [x] Criar repositório público no GitHub
- [x] Fazer commits no GitHub
- [x] Usar branches
- [x] Gravar vídeo de até 5 minutos
- [x] Colocar o vídeo com permissão correta
- [ ] Enviar os links no AVA
