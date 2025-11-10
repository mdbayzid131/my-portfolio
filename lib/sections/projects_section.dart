import 'package:flutter/material.dart';

import '../widgets/project_card.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<Map<String, String>> projects = const [
    {
      'title': 'E-Commerce App - Laza Shopping',
      'desc':
      'A modern Flutter e-commerce app featuring dynamic product browsing, cart management, and secure checkout. Built with REST API integration and a sleek, responsive design for a seamless shopping experience.',
      'link': 'https://github.com/mdbayzid131/e_commerce'
    },
    {
      'title': 'Portfolio Website',
      'desc':
      'A visually stunning Flutter Web portfolio showcasing my skills, projects, and journey as a developer. Fully responsive with smooth animations and an elegant modern interface.',
      'link': 'https://github.com/mdbayzid131/my-portfolio'
    },
    {
      'title': 'Calculator',
      'desc':
      'A clean and minimal calculator app built with Flutter, featuring smooth UI and all essential arithmetic operations for daily use.',
      'link': 'https://github.com/mdbayzid131/Calculator'
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


