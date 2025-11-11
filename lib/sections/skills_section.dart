import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/home_page_controller.dart';
import '../widgets/section_title.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  final _controller = Get.put(HomePageController());


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return Obx(() {
      final filteredSkills = _controller.selectedCategory.value == "All"
          ? _controller.skills
          : _controller.skills.where((s) => s["category"] == _controller.selectedCategory.value).toList();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionTitle(title: 'Skills'),
          const SizedBox(height: 20),

          // Category Buttons
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: _controller.categories.map((cat) {
              final bool isSelected = _controller.selectedCategory.value == cat;
              return GestureDetector(
                onTap: () => _controller.selectedCategory.value = cat,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.blueAccent
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Text(
                    cat,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 30),

          // Skills List
          LayoutBuilder(
            builder: (context, constraints) {
              final double itemWidth = isMobile
                  ? constraints.maxWidth
                  : (constraints.maxWidth / 2) - 40;
              return Wrap(
                spacing: 40,
                runSpacing: 20,
                alignment: WrapAlignment.start,
                children: filteredSkills.map((skill) {
                  return SizedBox(
                    width: itemWidth,
                    child: _buildSkillBar(skill["name"] as String,
                        skill["percent"] as double),
                  );
                }).toList(),
              );
            },
          ),
        ],
      );
    });
  }

  Widget _buildSkillBar(String skill, double percent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              skill,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            Text(
              "${(percent * 100).toInt()}%",
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: percent,
            minHeight: 8,
            backgroundColor: Colors.white10,
            valueColor:
            const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
          ),
        ),
      ],
    );
  }
}
