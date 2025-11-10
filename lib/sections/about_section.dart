
import 'package:flutter/material.dart';

import '../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'About Me'),
        const SizedBox(height: 16),
        const Text(
          "I'm MD. BAYZID HOSSEN, a passionate Flutter developer focused on crafting high-quality, visually stunning, and performance-driven mobile applications.\n\n"
              "Skilled in Flutter & Dart, I specialize in GetX and Provider for state management, ensuring clean and scalable code. I’ve built apps with RESTful APIs, Firebase, and modern UI directly from Figma designs.\n\n"
              "Proficient in Git, Google Maps, and Shared Preferences for real-world features. My work emphasizes smooth performance, elegant interfaces, and a seamless user experience.\n\n"
              "Based in Faridpur, Bangladesh — I’m continuously learning and innovating to deliver meaningful digital products that make a difference.\n\n"
              "Let’s build something amazing together!",
          style: TextStyle(
            color: Colors.white70,
            height: 1.6,
            fontSize: 15,
          ),
        ),



        const SizedBox(height: 18),
      ],
    );
  }
}

