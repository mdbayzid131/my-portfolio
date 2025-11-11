
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/home_page_controller.dart';
import '../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
   AboutSection({super.key});
  final _controller = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'About Me'),
        const SizedBox(height: 16),
        Text(_controller.about.toString()
          ,
          style: const TextStyle(
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

