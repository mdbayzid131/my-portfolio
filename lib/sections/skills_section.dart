import 'package:flutter/material.dart';
import '../widgets/section_title.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  String selectedCategory = "All";

  final skills = [
    {"name": "Flutter", "percent": 0.95, "category": "Mobile"},
    {"name": "Dart", "percent": 0.95, "category": "Language"},
    {"name": "GetX", "percent": 0.92, "category": "Mobile"},
    {"name": "Provider", "percent": 0.88, "category": "Mobile"},
    {"name": "REST API", "percent": 0.90, "category": "Backend"},
    {"name": "Firebase", "percent": 0.88, "category": "Backend"},
    {"name": "Figma", "percent": 0.90, "category": "Design"},
    {"name": "Git & GitHub", "percent": 0.92, "category": "Tools"},
  ];

  final categories = ["All", "Mobile", "Language", "Design", "Backend", "Tools"];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    final filteredSkills = selectedCategory == "All"
        ? skills
        : skills.where((s) => s["category"] == selectedCategory).toList();

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
          children: categories.map((cat) {
            final bool isSelected = selectedCategory == cat;
            return GestureDetector(
              onTap: () => setState(() => selectedCategory = cat),
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
