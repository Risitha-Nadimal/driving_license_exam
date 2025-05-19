import 'package:driving_license_exam/exammain.dart';
import 'package:driving_license_exam/premium.dart';
import 'package:driving_license_exam/previous_result_study.dart';
import 'package:driving_license_exam/profile.dart';
import 'package:driving_license_exam/studymaterial.dart';
import 'package:flutter/material.dart';

// Create placeholder screens for each tab (you should replace these with your actual screens)

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Premium Screen Content'));
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  // List of screens to display for each tab
  final List<Widget> _screens = [
    const HomeContent(), // This will be your original home content
    const StudyMaterialsScreen(),
    const MockExamScreen(),
    const SubscriptionScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Study"),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: "Exam"),
          BottomNavigationBarItem(
              icon: Icon(Icons.workspace_premium), label: "Premium"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: _screens[_currentIndex], // Display the current screen
    );
  }
}

// Extract your original home content into a separate widget
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome Back,",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const Text(
              "Malithi Imasha",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.016),
            // Banner image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/home.png', // Replace with your image asset
                height: size.height * 0.25,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: size.height * 0.016),
            // Subscription card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.circle, color: Colors.green, size: 10),
                      SizedBox(width: 6),
                      Text("Active Subscription"),
                      Spacer(),
                      Text("Premium Plan",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    height: 60, // Set width to 60
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Color(0xFFBDE0FE), // BDE0FE
                          // FFFFFF
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    // color: Colors.grey.shade200,
                    child: const Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text("Subscription expires in",
                                  style: TextStyle(color: Colors.grey)),
                            ),
                            SizedBox(height: 0.4),
                            Text(
                              "25 days",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF219EBC),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.punch_clock_outlined, color: Colors.blue),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Your Progress",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            // Progress card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black12,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text("Overall Completion"),
                      Spacer(),
                      Text("68%"),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 0.68,
                    backgroundColor: Colors.grey.shade300,
                    color: const Color(0xFF219EBC),
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _progressCard(
                          icon: Icons.menu_book,
                          ontap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PreviousResultStudy()))
                              },
                          label: "Study",
                          percent: "75%",
                          subtext: "complete"),
                      const SizedBox(width: 12),
                      _progressCard(
                          ontap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PreviousResultStudy()))
                              },
                          icon: Icons.check_circle_outline,
                          label: "Tests",
                          percent: "62%",
                          subtext: "passed"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Study Materials Button
            _menuButton(
              "Study Materials",
              Icons.menu_book,
              onTap: () {
                final homeState = context.findAncestorStateOfType<_HomeState>();
                // ignore: invalid_use_of_protected_member
                homeState?.setState(() {
                  homeState._currentIndex = 1; // Assuming Study is at index 1
                });
              },
            ),
            const SizedBox(height: 12),
            // Mock Exams Button
            _menuButton(
              "Mock Exams",
              Icons.assignment_turned_in,
              onTap: () {
                final homeState = context.findAncestorStateOfType<_HomeState>();
                // ignore: invalid_use_of_protected_member
                homeState?.setState(() {
                  homeState._currentIndex = 2; // Assuming Study is at index 1
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _progressCard(
      {required IconData icon,
      required String label,
      required VoidCallback ontap,
      required String percent,
      required String subtext}) {
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(icon, color: const Color(0xff219EBC), size: 28),
                    const SizedBox(width: 12),
                    Text(label, style: const TextStyle(fontSize: 15)),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(percent,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    const SizedBox(width: 6),
                    Text(subtext,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black54)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuButton(String title, IconData icon,
      {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: const Color(0xFF219EBC),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
          ],
        ),
      ),
    );
  }
}
