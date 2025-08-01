import 'package:flutter/material.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _count = 0;

  void _increment() => setState(() => _count++);
  void _decrement() => setState(() => _count--);
  void _reset() {
    setState(() => _count = 0);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Counter has been reset to zero'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Color _getCounterColor() {
    if (_count == 0) return Colors.grey;
    return _count > 0 ? Colors.green : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Counter Display
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                shape: BoxShape.circle,
                border: Border.all(
                  color: _getCounterColor(),
                  width: 3,
                ),
              ),
              child: Text(
                '$_count',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: _getCounterColor(),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Contextual Message
            if (_count != 0)
              Text(
                _count > 0 ? 'Positive count' : 'Negative count',
                style: TextStyle(
                  color: _getCounterColor(),
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
            if (_count % 10 == 0 && _count != 0)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Perfect 10!',
                  style: TextStyle(
                    color: _getCounterColor(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const SizedBox(height: 40),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: 'decrement',
                  onPressed: _decrement,
                  tooltip: 'Decrement',
                  backgroundColor: Colors.redAccent,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                // Reset Button - More Prominent
                ElevatedButton.icon(
                  onPressed: _reset,
                  icon: const Icon(Icons.restart_alt),
                  label: const Text('Reset'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                FloatingActionButton(
                  heroTag: 'increment',
                  onPressed: _increment,
                  tooltip: 'Increment',
                  backgroundColor: Colors.greenAccent,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}