import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomePageController extends GetxController {
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final educationKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  final RxString bio =
      'Crafting exceptional mobile experiences with Flutter. Passionate about clean code, modern design, and innovative solutions that make a difference.'
          .obs;

  final cvUrl = 'https://drive.google.com/uc?export=download&id=1IYdVS6bRvKcrVdaN40oF3aqibivY-0d3';
  final String myImage= 'assets/images/my_image_crop.jpg';
  final String gitHubLink= 'https://github.com/mdbayzid131';
  final String linkedInLink= 'https://www.linkedin.com/in/mdbayzid131/';

  ///<================ about me ==================>///
  RxString about =
      ''' I'm MD. BAYZID HOSSEN, a passionate Flutter developer focused on crafting high-quality, visually stunning, and performance-driven mobile applications.
  
Skilled in Flutter & Dart, I specialize in GetX and Provider for state management, ensuring clean and scalable code. I’ve built apps with RESTful APIs, Firebase, and modern UI directly from Figma designs.

Proficient in Git, Google Maps, and Shared Preferences for real-world features. My work emphasizes smooth performance, elegant interfaces, and a seamless user experience.

Based in Faridpur, Bangladesh — I’m continuously learning and innovating to deliver meaningful digital products that make a difference.

Let’s build something amazing together!'''
          .obs;

  ///<================ projects ==================>///

  final RxList<Map<String, String>> projects = [
    {
      'title': 'E-Commerce App - Laza Shopping',
      'desc':
          'A modern Flutter e-commerce app featuring dynamic product browsing, cart management, and secure checkout. Built with REST API integration and a sleek, responsive design for a seamless shopping experience.',
      'link': 'https://github.com/mdbayzid131/e_commerce',
    },
    {
      'title': 'Portfolio Website',
      'desc':
          'A visually stunning Flutter Web portfolio showcasing my skills, projects, and journey as a developer. Fully responsive with smooth animations and an elegant modern interface.',
      'link': 'https://github.com/mdbayzid131/my-portfolio',
    },
    {
      'title': 'Calculator',
      'desc':
          'A clean and minimal calculator app built with Flutter, featuring smooth UI and all essential arithmetic operations for daily use.',
      'link': 'https://github.com/mdbayzid131/Calculator',
    },
  ].obs;

  ///<================ contacts ==================>///
  RxString experienceYear = '1+'.obs;
  RxString projectsCompleted = '5+'.obs;
  RxString responseTime = '24h'.obs;

  RxString email = 'mdbayazid131@gmail.com'.obs;
  RxString phone = '+8801893032348'.obs;
  RxString address = 'Faridpur, Bangladesh'.obs;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  RxBool isButtonEnabled = false.obs;

  ///<================ Skill ==================>///

  RxString selectedCategory = "All".obs;

  final RxList<Map<String, dynamic>> skills = [
    {"name": "Flutter", "percent": 0.95, "category": "Mobile"},
    {"name": "Dart", "percent": 0.95, "category": "Language"},
    {"name": "GetX", "percent": 0.92, "category": "Mobile"},
    // {"name": "Provider", "percent": 0.88, "category": "Mobile"},
    {"name": "REST API", "percent": 0.90, "category": "Backend"},
    {"name": "Firebase", "percent": 0.88, "category": "Backend"},
    {"name": "Figma", "percent": 0.90, "category": "Design"},
    {"name": "Git & GitHub", "percent": 0.92, "category": "Tools"},
  ].obs;

  final RxList categories = [
    "All",
    "Mobile",
    "Language",
    "Design",
    "Backend",
    "Tools",
  ].obs;
}
