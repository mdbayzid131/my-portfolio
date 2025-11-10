// Simple nav button

import 'package:flutter/material.dart';

class CustomNabButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const CustomNabButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(label, style: const TextStyle(color: Colors.white70)),
    );
  }
}