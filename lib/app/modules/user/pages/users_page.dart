import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Modular.to.pushNamed("get");
                },
                child: const Text("Ir para Listagem")),
            ElevatedButton(
                onPressed: () {
                  Modular.to.pushNamed("create");
                },
                child: const Text("Ir para Criacao")),
          ],
        ),
      ),
    );
  }
}
