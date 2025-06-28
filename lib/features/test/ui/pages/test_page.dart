import 'package:base_project/so_like_app.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "TestPage")
class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<TestPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to So Like App"),
      ),
      body: const Center(
        child: Text("Build a new world for everyone"),
      ),
    );
  }
}

