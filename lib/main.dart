import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const FrasesApp());
}

class FrasesApp extends StatelessWidget {
  const FrasesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frases Diarias',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const FrasesHomePage(),
    );
  }
}

class FrasesHomePage extends StatefulWidget {
  const FrasesHomePage({super.key});

  @override
  State<FrasesHomePage> createState() => _FrasesHomePageState();
}

class _FrasesHomePageState extends State<FrasesHomePage> {
  final List<String> _frases = [
    "El único modo de hacer un gran trabajo es amar lo que haces.",
    "La innovación distingue a los líderes de los seguidores.",
    "El éxito es la suma de pequeños esfuerzos repetidos día tras día.",
    "No cuentes los días, haz que los días cuenten.",
    "La disciplina es el puente entre las metas y los logros."
  ];

  int _indiceActual = 0;

  void _nuevaFrase() {
    setState(() {
      _indiceActual = Random().nextInt(_frases.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frases Inspiradoras'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    '"${_frases[_indiceActual]}"',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: _nuevaFrase,
                icon: const Icon(Icons.refresh),
                label: const Text('Generar otra frase'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.horizontal(24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
