import 'package:flutter/material.dart';

class SectionWrapper extends StatelessWidget {
  final Widget child;
  const SectionWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    double maxContentWidth = 900;

    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width > 1000 ? maxContentWidth : width * 0.95,
        ),
        child: child,
      ),
    );
  }
}