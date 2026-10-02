import 'package:flutter/material.dart';

class FavoritosTela extends StatelessWidget {
  final List<Map<String, dynamic>> favoritos;
  final Function(Map<String, dynamic>) removerFavorito;

  const FavoritosTela({
    super.key,
    required this.favoritos,
    required this.removerFavorito,
  });

  @override
  Widget build(BuildContext context) {
    if (favoritos.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.favorite_border, size: 60),

            SizedBox(height: 12),

            Text(
              'Nenhum curso favorito.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 8),

            Text('Favorite um curso para vê-lo aqui.'),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favoritos.length,
      itemBuilder: (context, indice) {
        final curso = favoritos[indice];

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(child: Icon(curso['icone'] as IconData)),

            title: Text(
              curso['nome'] as String,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            subtitle: Text('${curso['descricao']}\n${curso['aulas']}'),

            isThreeLine: true,

            trailing: IconButton(
              icon: const Icon(Icons.favorite),

              onPressed: () {
                removerFavorito(curso);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${curso['nome']} removido dos favoritos.'),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
