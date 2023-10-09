import 'package:flutter/material.dart';
import 'package:luvit/screens/shell/shell.dart';

void main() {
  runApp(const Luvit());
}

class Luvit extends StatelessWidget {
  const Luvit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
			debugShowCheckedModeBanner: false,
      title: 'Luvit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Shell(),
    );
  }
}


