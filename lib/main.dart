import 'package:flutter/material.dart';

import 'telas/inicio_tela.dart';
import 'telas/cursos_tela.dart';
import 'telas/favoritos_tela.dart';
import 'telas/perfil_tela.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool modoEscuro = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // ALTERA ENTRE TEMA CLARO E ESCURO
      themeMode: modoEscuro ? ThemeMode.dark : ThemeMode.light,

      // TEMA CLARO
      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),

        scaffoldBackgroundColor: const Color(0xFFF8F5FC),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 3,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          ),
        ),

        cardTheme: CardThemeData(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          margin: const EdgeInsets.symmetric(vertical: 6),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        ),

        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: Colors.deepPurple.shade100,
          elevation: 4,
        ),
      ),

      // TEMA ESCURO
      darkTheme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),

        scaffoldBackgroundColor: const Color(0xFF18151C),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF29232F),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 3,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          ),
        ),

        cardTheme: CardThemeData(
          color: const Color(0xFF29232F),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          margin: const EdgeInsets.symmetric(vertical: 6),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF29232F),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        ),

        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Color(0xFF29232F),
          indicatorColor: Color(0xFF6D4FA3),
          elevation: 4,
        ),
      ),

      home: HomePage(
        modoEscuro: modoEscuro,
        alternarModo: () {
          setState(() {
            modoEscuro = !modoEscuro;
          });
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final bool modoEscuro;
  final VoidCallback alternarModo;

  const HomePage({
    super.key,
    required this.modoEscuro,
    required this.alternarModo,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indice = 0;

  final List<Map<String, dynamic>> favoritos = [];

  void alternarFavorito(Map<String, dynamic> curso) {
    setState(() {
      final encontrado = favoritos.where(
        (item) => item['nome'] == curso['nome'],
      );

      if (encontrado.isNotEmpty) {
        favoritos.removeWhere((item) => item['nome'] == curso['nome']);
      } else {
        favoritos.add(curso);
      }
    });
  }

  void removerFavorito(Map<String, dynamic> curso) {
    setState(() {
      favoritos.removeWhere((item) => item['nome'] == curso['nome']);
    });
  }

  @override
  Widget build(BuildContext context) {
    final telas = [
      const InicioTela(),

      CursosTela(favoritos: favoritos, alternarFavorito: alternarFavorito),

      FavoritosTela(favoritos: favoritos, removerFavorito: removerFavorito),

      const PerfilTela(),
    ];

    final titulos = const ['Início', 'Meus cursos', 'Favoritos', 'Meu perfil'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          titulos[indice],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        // BOTÃO DO MODO ESCURO
        actions: [
          IconButton(
            onPressed: widget.alternarModo,
            tooltip: widget.modoEscuro
                ? 'Ativar modo claro'
                : 'Ativar modo escuro',
            icon: Icon(widget.modoEscuro ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
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
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Início',
          ),

          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
            label: 'Cursos',
          ),

          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
