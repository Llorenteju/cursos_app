# Aplicativo de Cursos — Flutter

Aplicativo desenvolvido em Flutter como projeto acadêmico, com o objetivo de aplicar conceitos de desenvolvimento de interfaces, gerenciamento de estado, navegação entre telas e criação de componentes reutilizáveis.

O aplicativo simula uma plataforma de cursos na qual o estudante pode visualizar cursos, pesquisar conteúdos, favoritar cursos, acompanhar seu progresso e gerenciar suas informações de perfil.

## Objetivo

O projeto tem como objetivo desenvolver uma aplicação funcional utilizando Flutter e Dart, aplicando conceitos fundamentais do desenvolvimento de aplicações mobile.

Durante o desenvolvimento foram trabalhados:

- Construção de interfaces com Flutter
- Widgets e componentes reutilizáveis
- StatefulWidget e StatelessWidget
- Gerenciamento de estado com `setState`
- Navegação entre telas
- Listas e filtros
- Formulários
- Personalização visual
- Temas claro e escuro

## Funcionalidades

### Tela Inicial

A tela inicial apresenta:

- Saudação ao estudante
- Curso em andamento
- Barra de progresso
- Resumo do estudante
- Cursos iniciados
- Cursos concluídos
- Aulas concluídas
- Cursos disponíveis

### Cursos

O aplicativo possui seis cursos:

- Flutter Básico
- Dart Essencial
- Interfaces Mobile
- Conexão com API
- Banco de Dados
- Desenvolvimento Mobile

Cada curso apresenta:

- Nome
- Descrição
- Quantidade de aulas
- Ícone
- Sistema de favoritos
- Botão para continuar o curso

### Pesquisa de Cursos

A tela de cursos possui um campo de pesquisa que permite filtrar os cursos conforme o usuário digita.

A funcionalidade utiliza `TextField`, `TextEditingController` e `setState`.

### Favoritos

O usuário pode adicionar ou remover cursos dos favoritos.

Os cursos selecionados são exibidos em uma tela exclusiva de favoritos.

Também é possível remover um curso diretamente da tela de favoritos.

### Perfil

A tela de perfil apresenta:

- Nome do usuário
- E-mail
- Ícone de perfil
- Curso atual
- Quantidade de cursos iniciados
- Quantidade de aulas concluídas

### Edição de Perfil

O usuário pode editar:

- Nome
- E-mail

Após salvar as informações, os dados são atualizados na tela de perfil.

### Widget Reutilizável

Foi desenvolvido um componente reutilizável chamado `CursoCard`, responsável pela estrutura visual dos cartões de cursos.

O componente está localizado em:

```text
lib/widgets/curso_card.dart
