import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indice = 0;

  final telas = const [InicioTela(), CursosTela(), PerfilTela()];

  final titulos = const ['Início', 'Meus cursos', 'Meu perfil'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulos[indice])),
      body: Center(child: telas[indice]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: indice,
        onDestinationSelected: (valor) {
          setState(() {
            indice = valor;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Início'),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            label: 'Cursos',
          ),
          NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}

class InicioTela extends StatelessWidget {
  const InicioTela({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'Olá, estudante!',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 8),
        Text('Continue aprendendo e evoluindo.'),

        SizedBox(height: 24),
        Container(
          //card
          padding: const EdgeInsets.all(24),
          //personalizar o card
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
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.flutter_dash, color: Colors.white, size: 46),
              SizedBox(height: 16),
              Text(
                'Flutter básico',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '8 de 12 aulas concluídas',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CursosTela extends StatelessWidget {
  const CursosTela({super.key});

  @override
  Widget build(BuildContext context) {
    final cursos = const [
      'Flutter Básico',
      'Dart Essencial',
      'Interfaces Mobile',
    ];

    return ListView.builder(
      itemCount: cursos.length,
      itemBuilder: (context, indice) => Card(
        child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.play_arrow)),
          title: Text(cursos[indice]),
          subtitle: const Text('Toque para continuar'),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}

class PerfilTela extends StatelessWidget {
  const PerfilTela({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 46, child: Icon(Icons.person, size: 52)),
          Text(
            'Aluno flutter',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text('aluno@gmail.com'),
        ],
      ),
    );
  }
}
