import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({required this.name, super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(name,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)));
  }
}
