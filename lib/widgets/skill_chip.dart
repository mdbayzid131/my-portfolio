import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkillChip extends StatelessWidget {
  final String name, level;
  const SkillChip({super.key, required this.name, required this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      decoration: BoxDecoration(color: const Color(0xFF0F172A), borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFF12314A))),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text(level, style: const TextStyle(color: Colors.white70)),
      ]),
    ).animate().fadeIn(duration: 500.ms);
  }
}