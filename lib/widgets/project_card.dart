import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final Map<String, String> data;
  const ProjectCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  320,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF12314A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data['title']!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(data['desc']!, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => launchUrl(Uri.parse(data['link']!)),
              child: const Text('View on GitHub →'),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms);
  }
}
