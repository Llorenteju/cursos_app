import 'package:flutter/material.dart';

class CursoCard extends StatelessWidget {
  final Map<String, dynamic> curso;
  final bool favorito;
  final VoidCallback onFavorito;
  final VoidCallback onContinuar;

  const CursoCard({
    super.key,
    required this.curso,
    required this.favorito,
    required this.onFavorito,
    required this.onContinuar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(child: Icon(curso['icone'] as IconData)),

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
                  onPressed: onFavorito,
                  icon: Icon(favorito ? Icons.favorite : Icons.favorite_border),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              curso['descricao'] as String,
              style: const TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                const Icon(Icons.menu_book, size: 20),

                const SizedBox(width: 6),

                Text(curso['aulas'] as String),
              ],
            ),

            const SizedBox(height: 14),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onContinuar,
                child: const Text('CONTINUAR CURSO'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
