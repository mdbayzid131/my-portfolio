import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/home_page_controller.dart';
import '../widgets/project_card.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
   ProjectsSection({super.key});


  final _controller = Get.put(HomePageController());


  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const SectionTitle(title: 'Projects'),
      const SizedBox(height: 16),
      Wrap(
        spacing: 16,
        runSpacing: 16,
        children: _controller.projects.map((p) => ProjectCard(data: p)).toList(),
      )
    ]);
  }
}


