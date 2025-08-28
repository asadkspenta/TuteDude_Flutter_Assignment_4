import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:provider/provider.dart';
import '../provider/dice_provider.dart';

class TaskTwo extends StatelessWidget {
  const TaskTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final diceProvider = Provider.of<DiceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('🎲 Dice Roller')),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/dice${diceProvider.leftDice}.png',
                  width: 100,
                  height: 100,
                ),
                Image.asset(
                  'assets/images/dice${diceProvider.rightDice}.png',
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            const SizedBox(height: 30),
            AnimatedButton(
              width: 150,
              height: 50,
              text: 'Roll',
              isReverse: true,
              selectedTextColor: Colors.white,
              isSelected: diceProvider.isButtonPressed,
              transitionType: TransitionType.LEFT_CENTER_ROUNDER,
              backgroundColor: Colors.deepPurple,
              borderColor: Colors.white,
              borderRadius: 50,
              borderWidth: 2,
              onPress: diceProvider.rollDice,
            ),
          ],
        ),
      ),
    );
  }
}
