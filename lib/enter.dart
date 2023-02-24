import 'package:flutter/material.dart';

class Enter extends StatelessWidget {
  const Enter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Container(
        child: Column(
          children: const [
            Text("CONTACT MANAGER"),
          ],
        ),
      ),
    );
  }
}
