import 'package:base_project/so_like_app.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "{{name.pascalCase()}}Page")
class {{name.pascalCase()}}Page extends StatefulWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<{{name.pascalCase()}}Page> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("{{name.pascalCase()}}"),
      ),
      body: const Center(
        child: Text("{{name.pascalCase()}}"),
      ),
    );
  }
}

