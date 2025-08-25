import 'package:assignment_four_tutedue/pages/task_five.dart';
import 'package:assignment_four_tutedue/pages/task_four.dart';
import 'package:assignment_four_tutedue/pages/task_one.dart';
import 'package:assignment_four_tutedue/pages/task_three.dart';
import 'package:assignment_four_tutedue/pages/task_two.dart';
import 'package:assignment_four_tutedue/pages/task_zero.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Assignment Tasks")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // 2 cards per row
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.2, // 👈 controls shape (square/rectangular)
          children: [
            buildTaskCard(
              context,
              title: "Image Show",
              color: const Color(0xFF374DC7),
              screen: const TaskZero(),
            ),
            buildTaskCard(
              context,
              title: "Xylophone",
              color: Colors.blue,
              screen: const TaskOne(),
            ),
            buildTaskCard(
              context,
              title: "Dice Roller",
              color: Colors.green,
              screen: const TaskTwo(),
            ),
            buildTaskCard(
              context,
              title: "Text to Speech",
              color: Colors.orange,
              screen: const TaskThree(),
            ),
            buildTaskCard(
              context,
              title: "Colour Generator",
              color: Colors.purple,
              screen: TaskFour(),
            ),
            buildTaskCard(
              context,
              title: "Animated Emoji Tapper",
              color: Colors.red,
              screen: TaskFive(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTaskCard(
    BuildContext context, {
    required String title,
    required Color color,
    required Widget screen,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color, width: 2),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
