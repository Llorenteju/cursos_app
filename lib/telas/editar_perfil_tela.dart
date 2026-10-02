import 'package:flutter/material.dart';

class EditarPerfilTela extends StatefulWidget {
  final String nomeAtual;
  final String emailAtual;

  const EditarPerfilTela({
    super.key,
    required this.nomeAtual,
    required this.emailAtual,
  });

  @override
  State<EditarPerfilTela> createState() => _EditarPerfilTelaState();
}

class _EditarPerfilTelaState extends State<EditarPerfilTela> {
  late TextEditingController nomeController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();

    nomeController = TextEditingController(text: widget.nomeAtual);

    emailController = TextEditingController(text: widget.emailAtual);
  }

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void salvarPerfil() {
    Navigator.pop(context, {
      'nome': nomeController.text,
      'email': emailController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar perfil')),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Editar informações',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 24),

          TextField(
            controller: nomeController,
            decoration: InputDecoration(
              labelText: 'Nome',
              hintText: 'Digite seu nome',
              prefixIcon: const Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 20),

          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'E-mail',
              hintText: 'Digite seu e-mail',
              prefixIcon: const Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 28),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: salvarPerfil,
              child: const Text(
                'SALVAR',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
