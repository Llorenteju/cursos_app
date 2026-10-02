import 'package:flutter/material.dart';
import 'editar_perfil_tela.dart';

class PerfilTela extends StatefulWidget {
  const PerfilTela({super.key});

  @override
  State<PerfilTela> createState() => _PerfilTelaState();
}

class _PerfilTelaState extends State<PerfilTela> {
  String nome = 'Aluno Flutter';
  String email = 'aluno@gmail.com';

  Future<void> editarPerfil() async {
    final resultado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            EditarPerfilTela(nomeAtual: nome, emailAtual: email),
      ),
    );

    if (resultado != null) {
      setState(() {
        nome = resultado['nome'];
        email = resultado['email'];
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Perfil salvo com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Center(
          child: CircleAvatar(radius: 50, child: Icon(Icons.person, size: 56)),
        ),

        const SizedBox(height: 16),

        Center(
          child: Text(
            nome,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),

        const SizedBox(height: 6),

        Center(child: Text(email, style: const TextStyle(fontSize: 16))),

        const SizedBox(height: 30),

        Card(
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.school)),
            title: const Text(
              'Curso atual',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Flutter Básico'),
          ),
        ),

        const SizedBox(height: 12),

        Card(
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.menu_book)),
            title: const Text(
              'Cursos',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('4 cursos iniciados'),
          ),
        ),

        const SizedBox(height: 12),

        Card(
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.check_circle)),
            title: const Text(
              'Aulas concluídas',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('18 aulas concluídas'),
          ),
        ),

        const SizedBox(height: 28),

        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: editarPerfil,
            icon: const Icon(Icons.edit),
            label: const Text('EDITAR PERFIL'),
          ),
        ),
      ],
    );
  }
}
