import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CatDogProvider with ChangeNotifier {
  String? imageUrl;
  bool isDog = true;
  bool loading = false;

  Future<void> fetchDogImage() async {
    loading = true;
    notifyListeners();

    final response = await http.get(
      Uri.parse("https://dog.ceo/api/breeds/image/random"),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      imageUrl = data["message"];
      isDog = true;
    }

    loading = false;
    notifyListeners();
  }

  Future<void> fetchCatImage() async {
    loading = true;
    notifyListeners();

    final response = await http.get(
      Uri.parse("https://api.thecatapi.com/v1/images/search"),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      imageUrl = data[0]["url"];
      isDog = false;
    }

    loading = false;
    notifyListeners();
  }
}
