import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cat_dog_provider.dart';

class TaskZero extends StatelessWidget {
  const TaskZero({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CatDogProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("🐱🐶 Random Cat/Dog"),
        centerTitle: true,
      ),
      body: Center(
        child: provider.loading
            ? const CircularProgressIndicator()
            : provider.imageUrl == null
            ? const Text("Click a button to load image")
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    provider.isDog ? "🐶 Dog Image" : "🐱 Cat Image",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      provider.imageUrl!,
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () => provider.fetchDogImage(),
            label: const Text("Dog"),
            icon: const Icon(Icons.pets),
          ),
          const SizedBox(width: 10),
          FloatingActionButton.extended(
            onPressed: () => provider.fetchCatImage(),
            label: const Text("Cat"),
            icon: const Icon(Icons.pets_outlined),
          ),
        ],
      ),
    );
  }
}
