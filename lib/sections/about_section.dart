
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
          "I'm MD. BAYZID HOSSEN, a passionate and self-driven Flutter developer dedicated to crafting high-quality, visually appealing, and performance-optimized mobile applications. My focus lies in building seamless cross-platform experiences with a strong sense of design and architecture.\n\n"
              "With a deep understanding of Flutter & Dart, I specialize in state management using GetX and Provider, ensuring clean, scalable, and maintainable codebases. I have hands-on experience integrating RESTful APIs, handling Firebase services, and implementing modern UI designs directly from Figma prototypes.\n\n"
              "I am also proficient in Git version control, Google Maps integration, and shared preference-based local storage to enhance real-world app functionality. My projects emphasize performance, elegant UI, and a smooth user experience.\n\n"
              "Currently based in Faridpur, Bangladesh, I’m constantly learning and pushing my limits to stay ahead of the latest mobile development trends. My goal is to create meaningful digital products that solve real problems and bring value to users worldwide.\n\n"
              "Let’s connect and turn your ideas into beautiful mobile experiences!",
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

