import 'package:driving_license_exam/component/backbutton.dart';
import 'package:driving_license_exam/mockexam.dart';
import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLanguage = 'Sinhala';

  final List<String> languages = ['Sinhala', 'Tamil', 'English'];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.22),
                    const Text(
                      "Select Your Language",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 30),

                    // Language Buttons
                    ...languages.map((lang) => Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: GestureDetector(
                            onTap: () =>
                                setState(() => selectedLanguage = lang),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.02),
                              decoration: BoxDecoration(
                                color: selectedLanguage == lang
                                    ? Colors.blue.shade100
                                    : Colors.white,
                                border: Border.all(
                                  color: selectedLanguage == lang
                                      ? const Color.fromARGB(255, 255, 255, 255)
                                      : Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  lang,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: selectedLanguage == lang
                                        ? Colors.blue.shade700
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),

                    const SizedBox(height: 15),
                    const Text(
                      "You can change the language later in settings",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),

                    SizedBox(height: size.height * 0.09),

                    // Start Exam Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MockExamDo(),
                          ),
                        );
                        print("Starting exam in $selectedLanguage");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4378DB),
                        padding:
                            EdgeInsets.symmetric(vertical: size.height * 0.021),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Start Exam",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          )),
                    ),

                    const SizedBox(height: 20),

                    // Back Button
                  ],
                ),
              ),
            ),
          ),
          backbutton(size: size)
        ],
      ),
    );
  }
}
