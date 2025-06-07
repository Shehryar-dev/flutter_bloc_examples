import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final List<_WidgetItem> widgetItems = [
    _WidgetItem(
      title: 'Example 1 - Counter BLoC',
      subtitle: 'Basic BLoC with increment/decrement logic',
      icon: Icons.exposure_plus_1,
      destination: const CounterBlocExample(),
    ),
    _WidgetItem(
      title: 'Example 2 - Theme BLoC',
      subtitle: 'Toggling light/dark themes using BLoC',
      icon: Icons.dark_mode,
      destination: const ThemeBlocExample(),
    ),
    // Add more examples here...
  ];

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF1E1E1E)),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter BLoC Examples'),
          centerTitle: true,
        ),
        body: AnimatedList(
          key: _listKey,
          padding: const EdgeInsets.all(16),
          initialItemCount: widgetItems.length,
          itemBuilder: (context, index, animation) {
            final item = widgetItems[index];
            return SizeTransition(
              sizeFactor: animation,
              child: Card(
                color: const Color(0xFF1E1E1E),
                margin: const EdgeInsets.symmetric(vertical: 10),
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: Icon(item.icon, size: 30, color: Colors.tealAccent),
                  title: Text(item.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  subtitle: Text(item.subtitle, style: const TextStyle(color: Colors.white70)),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white70),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => item.destination),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _WidgetItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget destination;

  _WidgetItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.destination,
  });
}

// Placeholder widgets for the examples
class CounterBlocExample extends StatelessWidget {
  const CounterBlocExample({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Counter BLoC Example')));
}

class ThemeBlocExample extends StatelessWidget {
  const ThemeBlocExample({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Theme BLoC Example')));
}
