import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class TaskFive extends StatefulWidget {
  const TaskFive({super.key});

  @override
  State<TaskFive> createState() => _TaskFourState();
}

class _TaskFourState extends State<TaskFive> with TickerProviderStateMixin {
  final List<String> emojis = [
    '🎮',
    '😎',
    '🚀',
    '🐱',
    '🔥',
    '🧠',
    '🍕',
    '💡',
    '🎉',
    '🦄',
  ];

  late List<AnimationController> controllers;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(
      emojis.length,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
        lowerBound: 0.8,
        upperBound: 1.2,
      )..value = 1.0,
    );
  }

  void _onTap(int index) async {
    final controller = controllers[index];
    await controller.forward();
    await controller.reverse();
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🕹️ Animated Emoji Tapper'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: AnimationLimiter(
          child: GridView.builder(
            itemCount: emojis.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 500),
                columnCount: 3,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: GestureDetector(
                      onTap: () => _onTap(index),
                      child: ScaleTransition(
                        scale: controllers[index],
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade100,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              emojis[index],
                              style: const TextStyle(fontSize: 40),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
