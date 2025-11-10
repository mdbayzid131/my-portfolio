import 'package:flutter/material.dart';

import '../widgets/project_card.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<Map<String, String>> projects = const [
    {
      'title': 'E-Commerce App',
      'desc': 'Full-featured Flutter e-commerce app with Firebase integration.',
      'link': 'https://github.com/yourusername/ecommerce-app'
    },
    {
      'title': 'Portfolio Website',
      'desc': 'Personal portfolio built with Flutter Web.',
      'link': 'https://github.com/yourusername/portfolio'
    },
    {
      'title': 'Chat App',
      'desc': 'Real-time chat app using Firestore and GetX.',
      'link': 'https://github.com/yourusername/chat-app'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const SectionTitle(title: 'Projects'),
      const SizedBox(height: 16),
      Wrap(
        spacing: 16,
        runSpacing: 16,
        children: projects.map((p) => ProjectCard(data: p)).toList(),
      )
    ]);
  }
}


