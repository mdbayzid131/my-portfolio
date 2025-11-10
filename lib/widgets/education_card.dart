import 'package:flutter/material.dart';

class EducationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String period;
  final String location;

  const EducationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.period,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final is300 = width < 300;

    return Container(
      width: isMobile ? double.infinity : 420,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ?is300 ? null :
          Icon(
            Icons.school_rounded,
            size: 38,
            color: Colors.blueAccent.withOpacity(0.9),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 8),
                isMobile
                    ? Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.date_range_outlined,
                                size: 14,
                                color: Colors.white54,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                period,
                                style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                size: 14,
                                color: Colors.white54,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                location,
                                style: const TextStyle(
                                  color: Colors.white60,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.date_range_outlined,
                                size: 14,
                                color: Colors.white54,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                period,
                                style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                size: 14,
                                color: Colors.white54,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                location,
                                style: const TextStyle(
                                  color: Colors.white60,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
