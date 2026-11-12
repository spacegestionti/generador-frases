import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const FraseSvApp());

class FraseSvApp extends StatelessWidget {
  const FraseSvApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FraseSV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF818CF8),
          brightness: Brightness.dark,
        ),
      ),
      home: const FrasesScreen(),
    );
  }
}

class Quote {
  final String text;
  final String author;
  final String category;

  const Quote({
    required this.text,
    required this.author,
    required this.category,
  });
}

class FrasesScreen extends StatefulWidget {
  const FrasesScreen({super.key});

  @override
  State<FrasesScreen> createState() => _FrasesScreenState();
}

class _FrasesScreenState extends State<FrasesScreen> {
  static const _categories = [
    'Todas',
    'Liderazgo',
    'Innovación',
    'Estrategia',
    'Mentalidad',
  ];

  static const _quotes = [
    Quote(
        text: 'La innovación distingue a los líderes de los seguidores.',
        author: 'Steve Jobs',
        category: 'Innovación'),
    Quote(
        text: 'La mejor manera de predecir el futuro es crearlo.',
        author: 'Peter Drucker',
        category: 'Estrategia'),
    Quote(
        text:
            'El liderazgo es la capacidad de convertir una visión en realidad.',
        author: 'Warren Bennis',
        category: 'Liderazgo'),
    Quote(
        text:
            'La mente que se abre a una nueva idea jamás volverá a su tamaño original.',
        author: 'Albert Einstein',
        category: 'Mentalidad'),
    Quote(
        text: 'La simplicidad es la máxima sofisticación.',
        author: 'Leonardo da Vinci',
        category: 'Innovación'),
    Quote(
        text: 'Donde no hay visión, el pueblo se desenfrena.',
        author: 'Proverbios 29:18',
        category: 'Liderazgo'),
    Quote(
        text: 'La estrategia es elegir qué no hacer.',
        author: 'Michael Porter',
        category: 'Estrategia'),
    Quote(
        text: 'No es que tengamos poco tiempo, sino que perdemos mucho.',
        author: 'Séneca',
        category: 'Mentalidad'),
    Quote(
        text: 'El único modo de hacer un gran trabajo es amar lo que haces.',
        author: 'Steve Jobs',
        category: 'Mentalidad'),
    Quote(
        text: 'La excelencia no es un acto, es un hábito.',
        author: 'Aristóteles',
        category: 'Mentalidad'),
    Quote(
        text:
            'La pregunta más importante para una empresa no es qué hacemos, sino por qué lo hacemos.',
        author: 'Simon Sinek',
        category: 'Estrategia'),
    Quote(
        text:
            'La creatividad es pensar en nuevas ideas. La innovación es hacerlas realidad.',
        author: 'Theodore Levitt',
        category: 'Innovación'),
    Quote(
        text: 'Un líder lleva a la gente a donde nunca habría ido sola.',
        author: 'Hans Finzel',
        category: 'Liderazgo'),
    Quote(
        text:
            'El éxito es la suma de pequeños esfuerzos repetidos día tras día.',
        author: 'Robert Collier',
        category: 'Mentalidad'),
    Quote(
        text:
            'La oportunidad se pierde por la mayoría porque se viste de overol y parece trabajo.',
        author: 'Thomas Edison',
        category: 'Mentalidad'),
    Quote(
        text: 'La cultura se come a la estrategia para desayunar.',
        author: 'Peter Drucker',
        category: 'Liderazgo'),
    Quote(
        text: 'La imaginación es más importante que el conocimiento.',
        author: 'Albert Einstein',
        category: 'Innovación'),
    Quote(
        text: 'La acción es la clave fundamental de todo éxito.',
        author: 'Pablo Picasso',
        category: 'Estrategia'),
    Quote(
        text: 'La disciplina es el puente entre las metas y los logros.',
        author: 'Jim Rohn',
        category: 'Mentalidad'),
    Quote(
        text: 'Un objetivo sin un plan es solo un deseo.',
        author: 'Antoine de Saint-Exupéry',
        category: 'Estrategia'),
    Quote(
        text:
            'La innovación requiere que uno se aparte de los caminos trillados.',
        author: 'Edward de Bono',
        category: 'Innovación'),
    Quote(
        text:
            'El ejemplo no es lo principal para influir en otros; es lo único.',
        author: 'Albert Schweitzer',
        category: 'Liderazgo'),
    Quote(
        text: 'No cuentes los días, haz que los días cuenten.',
        author: 'Muhammad Ali',
        category: 'Mentalidad'),
    Quote(
        text: 'La visión sin ejecución es una alucinación.',
        author: 'Thomas Edison',
        category: 'Estrategia'),
    Quote(
        text: 'Todo parece imposible hasta que se hace.',
        author: 'Nelson Mandela',
        category: 'Liderazgo'),
    Quote(
        text: 'El aprendizaje nunca agota la mente.',
        author: 'Leonardo da Vinci',
        category: 'Mentalidad'),
    Quote(
        text:
            'La tecnología es solo una herramienta. En términos de motivar a la gente, el líder es lo más importante.',
        author: 'Bill Gates',
        category: 'Innovación'),
    Quote(
        text:
            'La confianza se construye cuando los hechos coinciden con las palabras.',
        author: 'Chris Butler',
        category: 'Liderazgo'),
    Quote(
        text:
            'La calidad de un líder se refleja en los estándares que establece para sí mismo.',
        author: 'Ray Kroc',
        category: 'Liderazgo'),
    Quote(
        text:
            'El liderazgo no consiste en estar al mando, sino en cuidar de quienes están a tu cargo.',
        author: 'Simon Sinek',
        category: 'Liderazgo'),
    Quote(
        text:
            'Ningún hombre será un gran líder si quiere hacerlo todo por sí mismo.',
        author: 'Andrew Carnegie',
        category: 'Liderazgo'),
    Quote(
        text:
            'La tarea del líder es llevar a su gente desde donde está hasta donde no ha estado.',
        author: 'Henry Kissinger',
        category: 'Liderazgo'),
    Quote(
        text:
            'El talento gana partidos, pero el trabajo en equipo y la inteligencia ganan campeonatos.',
        author: 'Michael Jordan',
        category: 'Liderazgo'),
    Quote(
        text: 'La innovación es lo que distingue a un líder de los demás.',
        author: 'Steve Jobs',
        category: 'Innovación'),
    Quote(
        text: 'El valor de una idea radica en ponerla en práctica.',
        author: 'Thomas Edison',
        category: 'Innovación'),
    Quote(
        text:
            'Si siempre haces lo que siempre has hecho, siempre obtendrás lo que siempre has obtenido.',
        author: 'Albert Einstein',
        category: 'Innovación'),
    Quote(
        text:
            'La creatividad requiere tener el valor de desprenderse de las certezas.',
        author: 'Erich Fromm',
        category: 'Innovación'),
    Quote(
        text:
            'La innovación no tiene nada que ver con cuántos dólares inviertes en investigación.',
        author: 'Steve Jobs',
        category: 'Innovación'),
    Quote(
        text:
            'Las grandes oportunidades nacen de haber sabido aprovechar las pequeñas.',
        author: 'Bill Gates',
        category: 'Innovación'),
    Quote(
        text:
            'Sin estrategia, la ejecución no es más que una actividad sin dirección.',
        author: 'Michael Porter',
        category: 'Estrategia'),
    Quote(
        text: 'La esencia de la estrategia es decidir qué no hacer.',
        author: 'Michael Porter',
        category: 'Estrategia'),
    Quote(
        text: 'Los planes no son nada; la planificación lo es todo.',
        author: 'Dwight D. Eisenhower',
        category: 'Estrategia'),
    Quote(
        text:
            'La estrategia requiere pensamiento, la táctica requiere observación.',
        author: 'Max Euwe',
        category: 'Estrategia'),
    Quote(
        text:
            'La oportunidad no espera a nadie, pero la estrategia sabe reconocerla.',
        author: 'Sun Tzu',
        category: 'Estrategia'),
    Quote(
        text: 'Si no sabes a dónde vas, cualquier camino te llevará allí.',
        author: 'Lewis Carroll',
        category: 'Estrategia'),
    Quote(
        text:
            'Tanto si crees que puedes como si crees que no puedes, tienes razón.',
        author: 'Henry Ford',
        category: 'Mentalidad'),
    Quote(
        text:
            'Lo que obtienes al alcanzar tus metas no es tan importante como en quién te conviertes.',
        author: 'Zig Ziglar',
        category: 'Mentalidad'),
    Quote(
        text: 'El futuro depende de lo que hagas hoy.',
        author: 'Mahatma Gandhi',
        category: 'Mentalidad'),
    Quote(
        text:
            'El fracaso es la oportunidad de empezar de nuevo con más inteligencia.',
        author: 'Henry Ford',
        category: 'Mentalidad'),
  ];

  final _random = Random();
  String _selectedCategory = 'Todas';
  int _currentIndex = 0;

  List<Quote> get _filteredQuotes => _selectedCategory == 'Todas'
      ? _quotes
      : _quotes.where((quote) => quote.category == _selectedCategory).toList();

  Quote get _currentQuote => _filteredQuotes[_currentIndex];

  void _selectCategory(String category) {
    if (category == _selectedCategory) return;
    HapticFeedback.lightImpact();
    setState(() {
      _selectedCategory = category;
      _currentIndex = 0;
    });
  }

  void _nextQuote() {
    HapticFeedback.lightImpact();
    setState(() {
      var nextIndex = _random.nextInt(_filteredQuotes.length);
      if (_filteredQuotes.length > 1 && nextIndex == _currentIndex) {
        nextIndex = (nextIndex + 1) % _filteredQuotes.length;
      }
      _currentIndex = nextIndex;
    });
  }

  Future<void> _copyQuote() async {
    HapticFeedback.lightImpact();
    final quote = _currentQuote;
    await Clipboard.setData(
        ClipboardData(text: '"${quote.text}" — ${quote.author}'));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Frase copiada al portapapeles'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFF312E81),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quote = _currentQuote;
    return Scaffold(
      body: Stack(
        children: [
          const _BackgroundGlow(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _Header(),
                  const SizedBox(height: 28),
                  SizedBox(
                    height: 42,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _categories.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final category = _categories[index];
                        return ChoiceChip(
                          label: Text(category),
                          selected: category == _selectedCategory,
                          onSelected: (_) => _selectCategory(category),
                          labelStyle: TextStyle(
                            color: category == _selectedCategory
                                ? Colors.white
                                : Colors.white60,
                            fontWeight: FontWeight.w600,
                          ),
                          backgroundColor: Colors.white.withValues(alpha: .06),
                          selectedColor: const Color(0xFF4F46E5),
                          side: BorderSide(
                              color: Colors.white.withValues(alpha: .1)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: _GlassCard(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 450),
                        transitionBuilder: (child, animation) => FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(.04, 0),
                              end: Offset.zero,
                            ).animate(CurvedAnimation(
                                parent: animation, curve: Curves.easeOutCubic)),
                            child: child,
                          ),
                        ),
                        child: _QuoteContent(
                          key: ValueKey('${_selectedCategory}_$_currentIndex'),
                          quote: quote,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Center(
                    child: Text(
                      '${_currentIndex + 1} / ${_filteredQuotes.length}',
                      style: const TextStyle(
                          color: Colors.white38,
                          fontSize: 12,
                          letterSpacing: 1.4),
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton.icon(
                      onPressed: _nextQuote,
                      icon: const Icon(Icons.auto_awesome_rounded, size: 20),
                      label: const Text('Nueva frase',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF6366F1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton.icon(
                      onPressed: _copyQuote,
                      icon: const Icon(Icons.copy_rounded, size: 18),
                      label: const Text('Copiar frase',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white70,
                        side: const BorderSide(color: Colors.white24),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
            color: const Color(0xFF6366F1).withValues(alpha: .18),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(Icons.auto_awesome_rounded,
              color: Color(0xFFA5B4FC), size: 23),
        ),
        const SizedBox(width: 14),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('FRASESV',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                    fontSize: 18)),
            SizedBox(height: 3),
            Text('Ideas que impulsan decisiones',
                style: TextStyle(color: Colors.white54, fontSize: 12)),
          ],
        ),
      ],
    );
  }
}

class _QuoteContent extends StatelessWidget {
  final Quote quote;

  const _QuoteContent({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF818CF8).withValues(alpha: .14),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            quote.category.toUpperCase(),
            style: const TextStyle(
                color: Color(0xFFA5B4FC),
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.4),
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.format_quote_rounded,
                      color: Color(0xFF818CF8), size: 38),
                  const SizedBox(height: 10),
                  Text(
                    quote.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        height: 1.3,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 26),
                  Text('— ${quote.author}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                          fontStyle: FontStyle.italic)),
                ],
              ),
            ),
          ),
        ),
        const Divider(color: Colors.white10, height: 1),
        const SizedBox(height: 14),
        const Row(
          children: [
            Icon(Icons.bookmark_border_rounded,
                color: Colors.white38, size: 16),
            SizedBox(width: 7),
            Text('Reflexión ejecutiva',
                style: TextStyle(
                    color: Colors.white38,
                    fontSize: 11,
                    letterSpacing: .8,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }
}

class _GlassCard extends StatelessWidget {
  final Widget child;

  const _GlassCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .08),
            borderRadius: BorderRadius.circular(26),
            border: Border.all(color: Colors.white12),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 28, offset: Offset(0, 14)),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

class _BackgroundGlow extends StatelessWidget {
  const _BackgroundGlow();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF111827), Color(0xFF1E1B4B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -110,
            right: -100,
            child: _GlowOrb(color: Color(0xFF4338CA), size: 280),
          ),
          Positioned(
            bottom: -130,
            left: -100,
            child: _GlowOrb(color: Color(0xFF1D4ED8), size: 300),
          ),
        ],
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  final Color color;
  final double size;

  const _GlowOrb({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: color.withValues(alpha: .24)),
      ),
    );
  }
}
