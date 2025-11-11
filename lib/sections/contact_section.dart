import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_page_controller.dart';
import '../widgets/section_title.dart';

class ContactFooter extends StatefulWidget {
  const ContactFooter({super.key});

  @override
  State<ContactFooter> createState() => _ContactFooterState();
}

class _ContactFooterState extends State<ContactFooter> {
  final _controller = Get.put(HomePageController());

  @override
  void initState() {
    super.initState();
    _controller.nameController.addListener(_updateButtonState);
    _controller.emailController.addListener(_updateButtonState);
    _controller.messageController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    _controller.isButtonEnabled.value =
        _controller.nameController.text.isNotEmpty &&
        _controller.emailController.text.isNotEmpty &&
        _controller.messageController.text.isNotEmpty;
  }

  @override
  void dispose() {
    _controller.nameController.dispose();
    _controller.emailController.dispose();
    _controller.messageController.dispose();
    super.dispose();
  }

  // Scroll function
  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(title: 'Contact'),
        const SizedBox(height: 24),
        LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 750;

            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFF071226),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  // 🔹 Contact Section
                  if (isMobile)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildContactInfo(),
                        const SizedBox(height: 50),
                        _buildContactForm(
                          maxWidth: constraints.maxWidth * 0.95,
                        ),
                      ],
                    )
                  else
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildContactInfo()),
                        const SizedBox(width: 20),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 420),
                          child: _buildContactForm(),
                        ),
                      ],
                    ),

                  const SizedBox(height: 30),

                  // 🔹 Stats Section
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 30,
                    runSpacing: 16,
                    children: [
                      _FooterStat(
                        label: _controller.experienceYear.value,
                        sub: 'Years Experience',
                      ),
                      _FooterStat(
                        label: _controller.projectsCompleted.value,
                        sub: 'Projects Completed',
                      ),
                      _FooterStat(
                        label: _controller.responseTime.value,
                        sub: 'Response Time',
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // 🔹 Bottom Footer Row
                  if (isMobile)
                    Column(
                      children: [
                        const Text(
                          '© 2025 Md Bayzid Hosen. All rights reserved',
                          style: TextStyle(color: Colors.white54, fontSize: 13),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                scrollTo(_controller.homeKey);
                              },
                              child: const Text('Privacy Policy'),
                            ),
                            TextButton(
                              onPressed: () {
                                scrollTo(_controller.homeKey);
                              },
                              child: const Text('Terms of Service'),
                            ),
                          ],
                        ),
                      ],
                    )
                  else
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '© 2025 Md Bayzid Hosen. All rights reserved',
                            style: TextStyle(color: Colors.white54),
                          ),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  scrollTo(_controller.homeKey);
                                },
                                child: const Text('Privacy Policy'),
                              ),
                              TextButton(
                                onPressed: () {
                                  scrollTo(_controller.homeKey);
                                },
                                child: const Text('Terms of Service'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  /// 📨 Contact Info Section
  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get In Touch',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'I\'m always excited to work on innovative projects and collaborate with talented teams. Whether you have a specific idea or need consultation, I\'m here to help.',
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
        SizedBox(height: 10),
        ListTile(
          leading: Icon(Icons.email_outlined, color: Colors.white),
          title: Text("Email", style: TextStyle(color: Colors.white)),
          subtitle: Text(
            _controller.email.value,
            style: TextStyle(color: Colors.white70),
          ),
        ),
        SizedBox(height: 6),
        ListTile(
          leading: Icon(Icons.phone_outlined, color: Colors.white),
          title: Text("Phone", style: TextStyle(color: Colors.white)),
          subtitle: Text(
            _controller.phone.value,
            style: TextStyle(color: Colors.white70),
          ),
        ),
        SizedBox(height: 6),
        ListTile(
          leading: Icon(Icons.location_on_outlined, color: Colors.white),
          title: Text("Address", style: TextStyle(color: Colors.white)),
          subtitle: Text(
            _controller.address.value,
            style: TextStyle(color: Colors.white70),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  /// 🧾 Contact Form Section
  Widget _buildContactForm({double? maxWidth}) {
    return Container(
      width: maxWidth,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF12314A)),
      ),
      child: Column(
        children: [
          _customTextField('Your Name', controller: _controller.nameController),
          const SizedBox(height: 8),
          _customTextField(
            'Your Email',
            controller: _controller.emailController,
          ),
          const SizedBox(height: 8),
          _customTextField(
            'Tell me about your project...',
            minLines: 3,
            maxLines: 4,
            controller: _controller.messageController,
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: Obx(
              () => ElevatedButton.icon(
                onPressed: _controller.isButtonEnabled.value
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'This is a demo form. Use the email link to contact.',
                            ),
                          ),
                        );
                      }
                    : null,
                icon: const Icon(Icons.send),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(width: 1, color: Colors.black),
                  ),
                  disabledBackgroundColor: const Color(
                    0xFF586067,
                  ).withOpacity(0.5),
                  disabledForegroundColor: Colors.white24,
                ),
                label: const Text('Send Message'),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'This is a demo form. Please use the contact info above.',
            style: TextStyle(color: Colors.white54, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// 🎨 Custom TextField Widget
  Widget _customTextField(
    String hint, {
    int minLines = 1,
    int maxLines = 1,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFF071226),
        hintStyle: const TextStyle(color: Colors.white54),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}

class _FooterStat extends StatelessWidget {
  final String label, sub;
  const _FooterStat({required this.label, required this.sub});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.tealAccent,
          ),
        ),
        const SizedBox(height: 6),
        Text(sub, style: const TextStyle(color: Colors.white70)),
      ],
    );
  }
}

extension PaddingExt on Widget {
  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );
}
