import 'package:flutter/material.dart';
import 'package:isolates/api.dart';
import 'package:isolates/bidirecional.dart';
import 'package:isolates/compute.dart';
import 'package:isolates/spawn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart Isolates',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dart Isolates'),
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
  Person? person;

  void _compute() {
    ComputeService().fetchUser().then((value) {
      setState(() {
        person = value;
      });
    });
  }

  void _spawn() {
    SpawnService().fetchUser().then((value) {
      setState(() {
        person = value;
      });
    });
  }

  void _biDirectional() {
    BiDirectionalService().fetchUser().then((value) {
      setState(() {
        person = value;
      });
    });
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
            Text(
              person?.name ?? 'Hello World',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _compute,
              child: const Text("Usando a função compute"),
            ),
            ElevatedButton(
              onPressed: _spawn,
              child: const Text("Usando Isolate.spawn()"),
            ),
            ElevatedButton(
              onPressed: _biDirectional,
              child: const Text("Usando RecievePort e SendPort"),
            ),
          ],
        ),
      ),
    );
  }
}
