import 'package:flutter/material.dart';

import 'telas/inicio_tela.dart';
import 'telas/cursos_tela.dart';
import 'telas/favoritos_tela.dart';
import 'telas/perfil_tela.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
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

  final telas = const [
    InicioTela(),
    CursosTela(),
    FavoritosTela(),
    PerfilTela(),
  ];

  final titulos = const [
    'Início',
    'Meus cursos',
    'Favoritos',
    'Meu perfil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulos[indice]),
      ),

      body: telas[indice],

      bottomNavigationBar: NavigationBar(
        selectedIndex: indice,

        onDestinationSelected: (valor) {
          setState(() {
            indice = valor;
          });
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Início',
          ),

          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            label: 'Cursos',
          ),

          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),

          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}