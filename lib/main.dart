import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double width = 200;
  late double height = 200;

  late bool showImage = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 0), _changeSize);
  }

  void _changeSize() {
    setState(() {
      width = 400;
      height = 400;
      showImage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F0FF),
      body: Center(
        child: AnimatedOpacity(
          opacity: showImage ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: AnimatedContainer(
            width: width,
            height: height,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: Image.asset('assets/images/splashscreen.png'),
          ),
        ),
      ),
    );
  }
}
