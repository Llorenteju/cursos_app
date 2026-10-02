import 'package:flutter/material.dart';
import '../widgets/curso_card.dart';

class CursosTela extends StatefulWidget {
  final List<Map<String, dynamic>> favoritos;
  final Function(Map<String, dynamic>) alternarFavorito;

  const CursosTela({
    super.key,
    required this.favoritos,
    required this.alternarFavorito,
  });

  @override
  State<CursosTela> createState() => _CursosTelaState();
}

class _CursosTelaState extends State<CursosTela> {
  final TextEditingController pesquisaController = TextEditingController();

  final List<Map<String, dynamic>> cursos = [
    {
      'nome': 'Flutter Básico',
      'descricao':
          'Curso introdutório sobre desenvolvimento mobile utilizando Flutter.',
      'aulas': '12 aulas',
      'icone': Icons.flutter_dash,
    },
    {
      'nome': 'Dart Essencial',
      'descricao': 'Aprenda os principais conceitos da linguagem Dart.',
      'aulas': '10 aulas',
      'icone': Icons.code,
    },
    {
      'nome': 'Interfaces Mobile',
      'descricao':
          'Aprenda a criar interfaces modernas para aplicativos mobile.',
      'aulas': '15 aulas',
      'icone': Icons.phone_android,
    },
    {
      'nome': 'Conexão com API',
      'descricao':
          'Aprenda a conectar aplicativos Flutter com APIs e serviços externos.',
      'aulas': '14 aulas',
      'icone': Icons.cloud,
    },
    {
      'nome': 'Banco de Dados',
      'descricao':
          'Aprenda os conceitos básicos de banco de dados para aplicativos.',
      'aulas': '16 aulas',
      'icone': Icons.storage,
    },
    {
      'nome': 'Desenvolvimento Mobile',
      'descricao':
          'Aprenda a desenvolver aplicativos completos para dispositivos móveis.',
      'aulas': '20 aulas',
      'icone': Icons.smartphone,
    },
  ];

  @override
  void dispose() {
    pesquisaController.dispose();
    super.dispose();
  }

  bool cursoEstaFavoritado(Map<String, dynamic> curso) {
    return widget.favoritos.any((item) => item['nome'] == curso['nome']);
  }

  @override
  Widget build(BuildContext context) {
    final cursosFiltrados = cursos.where((curso) {
      final nome = curso['nome'].toString().toLowerCase();
      final pesquisa = pesquisaController.text.toLowerCase();

      return nome.contains(pesquisa);
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: pesquisaController,
            onChanged: (valor) {
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: 'Pesquisar curso',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  pesquisaController.clear();
                  setState(() {});
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        Expanded(
          child: cursosFiltrados.isEmpty
              ? const Center(
                  child: Text(
                    'Nenhum curso encontrado.',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: cursosFiltrados.length,
                  itemBuilder: (context, indice) {
                    final curso = cursosFiltrados[indice];

                    final favorito = cursoEstaFavoritado(curso);

                    return CursoCard(
                      curso: curso,
                      favorito: favorito,

                      onFavorito: () {
                        widget.alternarFavorito(curso);

                        setState(() {});

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              favorito
                                  ? '${curso['nome']} removido dos favoritos.'
                                  : '${curso['nome']} adicionado aos favoritos.',
                            ),
                          ),
                        );
                      },

                      onContinuar: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Continuando ${curso['nome']}...'),
                          ),
                        );
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}
