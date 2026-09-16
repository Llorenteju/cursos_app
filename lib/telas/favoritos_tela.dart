import 'package:flutter/material.dart';

class FavoritosTela extends StatefulWidget {
  const FavoritosTela({super.key});

  @override
  State<FavoritosTela> createState() => _FavoritosTelaState();
}

class _FavoritosTelaState extends State<FavoritosTela> {
  final List<Map<String, dynamic>> favoritos = [
    {
      'nome': 'Flutter Básico',
      'descricao': 'Curso introdutório de Flutter.',
      'aulas': '12 aulas',
      'icone': Icons.flutter_dash,
    },
    {
      'nome': 'Dart Essencial',
      'descricao': 'Aprenda os principais conceitos de Dart.',
      'aulas': '10 aulas',
      'icone': Icons.code,
    },
    {
      'nome': 'Interfaces Mobile',
      'descricao': 'Crie interfaces para aplicativos mobile.',
      'aulas': '15 aulas',
      'icone': Icons.phone_android,
    },
  ];

  void removerFavorito(int indice) {
    setState(() {
      favoritos.removeAt(indice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return favoritos.isEmpty
        ? const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 60,
                ),

                SizedBox(height: 12),

                Text(
                  'Nenhum curso favorito.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(16),

            itemCount: favoritos.length,

            itemBuilder: (context, indice) {
              final curso = favoritos[indice];

              return Card(
                margin: const EdgeInsets.only(bottom: 12),

                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      curso['icone'],
                    ),
                  ),

                  title: Text(
                    curso['nome'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  subtitle: Text(
                    '${curso['descricao']}\n${curso['aulas']}',
                  ),

                  isThreeLine: true,

                  trailing: IconButton(
                    icon: const Icon(
                      Icons.favorite,
                    ),

                    onPressed: () {
                      removerFavorito(indice);
                    },
                  ),
                ),
              );
            },
          );
  }
}