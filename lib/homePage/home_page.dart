import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_page_controller.dart';
import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/education_section.dart';
import '../sections/home_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';
import '../theme/animated_night_sky.dart';
import '../widgets/custom_nabber.dart';
import '../widgets/section_wrapper.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();


  // helper: scroll to a key with animation

final _controller = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      // optional starry background via Stack
      body: Stack(
        children: [
          const AnimatedNightSky(),
          // Main content with scroll
          Column(
            children: [
              // Fixed Top Navigation
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF071226).withOpacity(0.9),
                  border: const Border(
                    bottom: BorderSide(color: Color(0xFF12314A), width: 1),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 62,
                child: Row(
                  children: [
                    // Logo / Name
                    Text(
                      'BAYZID',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.tealAccent.shade200,
                      ),
                    ),
                    const Spacer(),
                    if (width < 600)
                      // compact menu for small screen
                      PopupMenuButton<int>(
                        color: const Color(0xFFB7B8BD),
                        icon: const Icon(Icons.menu),
                        onSelected: (i) {
                          final map = {
                            0: _controller.homeKey,
                            1: _controller.aboutKey,
                            2: _controller.educationKey,
                            3: _controller.skillsKey,
                            4: _controller.projectsKey,
                            5: _controller.contactKey,
                          };
                          scrollTo(map[i]!);
                        },
                        itemBuilder: (_) => [
                          const PopupMenuItem(value: 0, child: Text('Home')),
                          const PopupMenuItem(value: 1, child: Text('About')),
                          const PopupMenuItem(
                            value: 2,
                            child: Text('Education'),
                          ),
                          const PopupMenuItem(value: 3, child: Text('Skills')),
                          const PopupMenuItem(
                            value: 4,
                            child: Text('Projects'),
                          ),
                          const PopupMenuItem(value: 5, child: Text('Contact')),
                        ],
                      )
                    else
                      // desktop menu
                      Row(
                        children: [
                          CustomNabButton(
                            label: 'Home',
                            onTap: () => scrollTo(_controller.homeKey),
                          ),
                          CustomNabButton(
                            label: 'About',
                            onTap: () => scrollTo(_controller.aboutKey),
                          ),
                          CustomNabButton(
                            label: 'Education',
                            onTap: () => scrollTo(_controller.educationKey),
                          ),
                          CustomNabButton(
                            label: 'Skills',
                            onTap: () => scrollTo(_controller.skillsKey),
                          ),
                          CustomNabButton(
                            label: 'Projects',
                            onTap: () => scrollTo(_controller.projectsKey),
                          ),
                          CustomNabButton(
                            label: 'Contact',
                            onTap: () => scrollTo(_controller.contactKey),
                          ),
                        ],
                      ),
                  ],
                ),
              ),

              // content
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // HOME
                      SectionWrapper(key: _controller.homeKey, child: HomeSection()),
                      // ABOUT
                      SectionWrapper(key: _controller.aboutKey, child: AboutSection()),
                      // EDUCATION
                      SectionWrapper(
                        key: _controller.educationKey,
                        child: EducationSection(),
                      ),
                      // SKILLS
                      SectionWrapper(key: _controller.skillsKey, child: SkillsSection()),
                      // PROJECTS
                      SectionWrapper(
                        key: _controller.projectsKey,
                        child: ProjectsSection(),
                      ),
                      // CONTACT
                      SectionWrapper(key: _controller.contactKey, child: ContactFooter()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
Future<void> scrollTo(GlobalKey key) async {
  final ctx = key.currentContext;
  if (ctx == null) return;
  await Scrollable.ensureVisible(
    ctx,
    duration: const Duration(milliseconds: 600),
    curve: Curves.easeInOut,
    alignment: 0.0,
  );
}