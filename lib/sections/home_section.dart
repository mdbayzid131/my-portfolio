import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/home_page_controller.dart';
import '../homePage/home_page.dart';
import 'dart:html' as html;



class HomeSection extends StatelessWidget {
   HomeSection({super.key});
  final _controller = Get.put(HomePageController());


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final bool isMobile = screenWidth < 700;
    final bool isTablet = screenWidth >= 700 && screenWidth < 1100;

    return isMobile
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildTextContent(context, isMobile),
        const SizedBox(height: 40),
        _buildProfileCard(context, isMobile),
      ],
    )
        : Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: isTablet ? 6 : 5,
          child: _buildTextContent(context, isMobile),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: isTablet ? 4 : 3,
          child: _buildProfileCard(context, isMobile),
        ),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment:
      isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Assalamu-Alaikum, I am',
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: isMobile ? 16 : 18,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'MD BAYZID HOSEN',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 28 : 38,
            fontWeight: FontWeight.bold,
            color: Colors.tealAccent.shade200,
          ),
        ).animate().fadeIn(duration: 700.ms).slideX(begin: -0.1),
        const SizedBox(height: 16),
         Text(_controller.bio.value,
          style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.5),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 25),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment:
          isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            ElevatedButton.icon(
              onPressed: () =>
            scrollTo(_controller.contactKey),
              icon: const Icon(Icons.email),
              label: const Text('Get In Touch'),
            ),
            OutlinedButton.icon(
              onPressed: () {
                html.window.open(_controller.cvUrl, "_blank");
              },

              icon: const Icon(Icons.download),
              label: const Text('Download CV'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileCard(BuildContext context, bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF12314A)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: isMobile ? 60 : 80,
            backgroundImage: AssetImage(_controller.myImage),
          ),
          const SizedBox(height: 14),
          Text(
            'Md Bayzid Hosen',
            style: TextStyle(
              fontSize: isMobile ? 18 : 20,
              fontWeight: FontWeight.bold,
              color: Colors.tealAccent.shade100,
            ),
          ),
          const SizedBox(height: 6),
          const Text('Flutter Developer',
              style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () =>
                    launchUrl(Uri.parse(_controller.gitHubLink)),
                icon: SvgPicture.asset('assets/images/github-mark-white.svg',height: 23,width: 23,),
              ),
              IconButton(
                onPressed: () =>
                    launchUrl(Uri.parse(_controller.linkedInLink)),
                icon: SvgPicture.asset('assets/images/icons8-linkedin-circled.svg',height: 25,width: 25,),
              ),
              // IconButton(
              //   onPressed: () =>
              //       launchUrl(Uri.parse('https://t.me')),
              //   icon: const Icon(Icons.send),
              // ),
            ],
          )
        ],
      ),
    ).animate().fadeIn(duration: 600.ms);
  }
}
