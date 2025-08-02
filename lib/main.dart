import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Counter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });

    // Show a snackbar on reset
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Counter reset to zero'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  String _getMessage() {
    if (_counter == 0) return "Let's start counting!";
    if (_counter > 10) return "That's a big number!";
    if (_counter < 0) return "Negative? Interesting!";
    return "Keep going...";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: _counter < 0
                    ? Colors.red
                    : (_counter > 10 ? Colors.orange : Colors.green),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _getMessage(),
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _decrementCounter,
                  icon: const Icon(Icons.remove),
                  label: const Text("Decrease"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: _resetCounter,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Reset"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: _incrementCounter,
                  icon: const Icon(Icons.add),
                  label: const Text("Increase"),
                  style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
