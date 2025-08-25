import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TaskThree extends StatefulWidget {
  const TaskThree({super.key});

  @override
  State<TaskThree> createState() => _TaskThreeState();
}

class _TaskThreeState extends State<TaskThree> {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController _controller = TextEditingController();

  Future<void> _speak() async {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1.0);
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.speak(text);
    }
  }

  @override
  void dispose() {
    flutterTts.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🗣️ Text-to-Speech Fun App',
          style: const TextStyle(
            fontFamilyFallback: ['NotoColorEmoji', 'Roboto', 'Arial'],
          ),
        ),

        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Type something...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _speak,
              icon: const Icon(Icons.volume_up),
              label: const Text('Speak'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
