import 'package:flutter/material.dart';

class CursosTela extends StatelessWidget {
  const CursosTela({super.key});

  @override
  Widget build(BuildContext context) {
    final cursos = [
      {
        'nome': 'Flutter Básico',
        'descricao':
            'Curso introdutório sobre desenvolvimento mobile utilizando Flutter.',
        'aulas': '12 aulas',
        'icone': Icons.flutter_dash,
      },
      {
        'nome': 'Dart Essencial',
        'descricao':
            'Aprenda os principais conceitos da linguagem Dart.',
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
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),

      itemCount: cursos.length,

      itemBuilder: (context, indice) {
        final curso = cursos[indice];

        return Card(
          margin: const EdgeInsets.only(bottom: 16),

          child: Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Icon(
                        curso['icone'] as IconData,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Text(
                        curso['nome'] as String,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${curso['nome']} adicionado aos favoritos!',
                            ),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.favorite_border,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Text(
                  curso['descricao'] as String,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    const Icon(
                      Icons.menu_book,
                      size: 20,
                    ),

                    const SizedBox(width: 6),

                    Text(
                      curso['aulas'] as String,
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Continuando ${curso['nome']}...',
                          ),
                        ),
                      );
                    },

                    child: const Text(
                      'CONTINUAR CURSO',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}