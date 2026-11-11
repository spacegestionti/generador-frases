import 'dart:math';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const FrasesApp());
}

class FrasesApp extends StatelessWidget {
  const FrasesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frases Inspiradoras',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const FrasesScreen(),
    );
  }
}

class Quote {
  final String text;
  final String author;
  final String category;

  const Quote({required this.text, required this.author, required this.category});
}

class FrasesScreen extends StatefulWidget {
  const FrasesScreen({super.key});

  @override
  State<FrasesScreen> createState() => _FrasesScreenState();
}

class _FrasesScreenState extends State<FrasesScreen> {
  final List<Quote> _quotes = const [
    Quote(text: "El único modo de hacer un gran trabajo es amar lo que haces.", author: "Steve Jobs", category: "Éxito"),
    Quote(text: "La innovación distingue a los líderes de los seguidores.", author: "Steve Jobs", category: "Liderazgo"),
    Quote(text: "El éxito es la suma de pequeños esfuerzos repetidos día tras día.", author: "Robert Collier", category: "Perseverancia"),
    Quote(text: "No cuentes los días, haz que los días cuenten.", author: "Muhammad Ali", category: "Motivación"),
    Quote(text: "La disciplina es el puente entre las metas y los logros.", author: "Jim Rohn", category: "Disciplina"),
    Quote(text: "No busques los errores, busca un remedio.", author: "Henry Ford", category: "Soluciones"),
    Quote(text: "Cualquier tecnología suficientemente avanzada es indistinguible de la magia.", author: "Arthur C. Clarke", category: "Tecnología"),
    Quote(text: "La mente que se abre a una nueva idea jamás volverá a su tamaño original.", author: "Albert Einstein", category: "Aprendizaje"),
    Quote(text: "Haz de cada día tu obra maestra.", author: "John Wooden", category: "Excelencia"),
    Quote(text: "La mejor manera de predecir el futuro es crearlo.", author: "Peter Drucker", category: "Futuro"),
    Quote(text: "La simplicidad es la máxima sofisticación.", author: "Leonardo da Vinci", category: "Diseño"),
    Quote(text: "No es que tengamos poco tiempo, sino que perdemos mucho.", author: "Séneca", category: "Sabiduría"),
    Quote(text: "La vida es 10% lo que te ocurre y 90% cómo reaccionas a ello.", author: "Charles R. Swindoll", category: "Actitud"),
    Quote(text: "No he fracasado. He encontrado 10,000 formas que no funcionan.", author: "Thomas Edison", category: "Resiliencia"),
    Quote(text: "Todo parece imposible hasta que se hace.", author: "Nelson Mandela", category: "Superación"),
    Quote(text: "La lógica te llevará de A a B. La imaginación te llevará a cualquier parte.", author: "Albert Einstein", category: "Creatividad"),
    Quote(text: "El conocimiento es poder, pero el carácter es respeto.", author: "Bruce Lee", category: "Carácter"),
    Quote(text: "Si puedes soñarlo, puedes hacerlo.", author: "Walt Disney", category: "Sueños"),
    Quote(text: "Comienza donde estás. Usa lo que tienes. Haz lo que puedas.", author: "Arthur Ashe", category: "Acción"),
    Quote(text: "La excelencia no es un acto, es un hábito.", author: "Aristóteles", category: "Hábitos"),
    Quote(text: "Tu tiempo es limitado, de modo que no lo malgastes viviendo la vida de alguien más.", author: "Steve Jobs", category: "Enfoque"),
    Quote(text: "El aprendizaje nunca agota la mente.", author: "Leonardo da Vinci", category: "Crecimiento"),
    Quote(text: "No intentes ser una persona con éxito, sino una persona con valores.", author: "Albert Einstein", category: "Valores"),
    Quote(text: "Lo que haces hoy puede mejorar todos tus mañanas.", author: "Ralph Marston", category: "Progreso"),
    Quote(text: "La duda mata más sueños que el fracaso.", author: "Suzy Kassem", category: "Confianza"),
  ];

  int _currentIndex = 0;

  void _nextQuote() {
    setState(() {
      int newIndex;
      do {
        newIndex = Random().nextInt(_quotes.length);
      } while (newIndex == _currentIndex && _quotes.length > 1);
      _currentIndex = newIndex;
    });
  }

  void _copyQuote() {
    final quote = _quotes[_currentIndex];
    Clipboard.setData(ClipboardData(text: '"${quote.text}" — ${quote.author}'));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('¡Frase copiada al portapapeles!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuote = _quotes[_currentIndex];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.shade800,
              Colors.indigo.shade600,
              Colors.purple.shade400,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Encabezado
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.auto_awesome, color: Colors.amberAccent, size: 28),
                    SizedBox(width: 8),
                    Text(
                      'Frases de Inspiración',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),

                // Tarjeta Principal
                Card(
                  elevation: 12,
                  shadowColor: Colors.black38,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  color: Colors.white.withValues(alpha: 0.95),
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Etiqueta de Categoría
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            currentQuote.category.toUpperCase(),
                            style: TextStyle(
                              color: Colors.deepPurple.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 1.1,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Ícono de Comillas
                        Icon(
                          Icons.format_quote_rounded,
                          size: 48,
                          color: Colors.deepPurple.shade300,
                        ),
                        const SizedBox(height: 12),

                        // Texto de la Frase
                        Text(
                          currentQuote.text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            height: 1.4,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade900,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Autor
                        Text(
                          "— ${currentQuote.author}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            color: Colors.deepPurple.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Botones de Acción
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton.icon(
                        onPressed: _nextQuote,
                        icon: const Icon(Icons.refresh_rounded, size: 24),
                        label: const Text(
                          'Siguiente Frase',
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amberAccent,
                          foregroundColor: Colors.black87,
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      onPressed: _copyQuote,
                      icon: const Icon(Icons.copy_rounded, color: Colors.white, size: 20),
                      label: const Text(
                        'Copiar Frase',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white54, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
