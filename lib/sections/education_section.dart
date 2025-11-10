import 'package:flutter/material.dart';
import '../widgets/education_card.dart';
import '../widgets/section_title.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SectionTitle(title: 'Education'),
        const SizedBox(height: 24),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: const [
            EducationCard(
              title: 'Diploma in Computer Science & Technology',
              subtitle: 'Faridpur Polytechnic Institute',
              period: '2022 - 2025',
              location: 'Faridpur, Bangladesh',
            ),
            EducationCard(
              title:
              'Application Development with Flutter – Professional Training',
              subtitle: 'BdCalling IT Ltd',
              period: 'Sep 2025 - Dec 2025',
              location: 'Dhaka, Bangladesh',
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
