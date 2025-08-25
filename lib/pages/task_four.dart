import 'package:assignment_four_tutedue/provider/colour_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskFour extends StatelessWidget {
  const TaskFour({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("🎨 Color Generator"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: colorProvider.color,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              colorProvider.changeColor();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              backgroundColor: Colors.black,
            ),
            child: const Text(
              "Change Color",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
