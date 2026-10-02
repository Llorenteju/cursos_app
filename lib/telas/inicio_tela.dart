import 'package:flutter/material.dart';

class InicioTela extends StatelessWidget {
  const InicioTela({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // SAUDAÇÃO
        Text(
          'Olá, estudante!',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),

        const Text(
          'Continue aprendendo e evoluindo.',
          style: TextStyle(fontSize: 16),
        ),

        const SizedBox(height: 28),

        // SEÇÃO 1 - CURSO EM ANDAMENTO
        const Text(
          'Curso em andamento',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.flutter_dash, color: Colors.white, size: 46),

              const SizedBox(height: 16),

              const Text(
                'Flutter Básico',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                '8 de 12 aulas concluídas',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),

              const SizedBox(height: 14),

              // BARRA DE PROGRESSO
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const LinearProgressIndicator(
                  value: 0.67,
                  minHeight: 10,
                  backgroundColor: Colors.white54,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                '67% concluído',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 28),

        // SEÇÃO 2 - RESUMO DO ESTUDANTE
        const Text(
          'Resumo do estudante',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: _ResumoCard(
                icone: Icons.play_circle_outline,
                titulo: 'Cursos iniciados',
                valor: '4',
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: _ResumoCard(
                icone: Icons.check_circle_outline,
                titulo: 'Cursos concluídos',
                valor: '1',
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        _ResumoCard(
          icone: Icons.menu_book,
          titulo: 'Aulas concluídas',
          valor: '18',
        ),

        const SizedBox(height: 28),

        // SEÇÃO 3 - CURSOS DISPONÍVEIS
        const Text(
          'Cursos disponíveis',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        Card(
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.code)),
            title: const Text(
              'Dart Essencial',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('10 aulas disponíveis'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
          ),
        ),

        Card(
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.phone_android)),
            title: const Text(
              'Interfaces Mobile',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('15 aulas disponíveis'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
          ),
        ),

        Card(
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.cloud)),
            title: const Text(
              'Conexão com API',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('14 aulas disponíveis'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
          ),
        ),
      ],
    );
  }
}

// CARD DO RESUMO
class _ResumoCard extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String valor;

  const _ResumoCard({
    required this.icone,
    required this.titulo,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icone, size: 32),

            const SizedBox(height: 12),

            Text(
              valor,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 4),

            Text(titulo, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
