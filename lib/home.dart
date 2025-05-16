import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
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
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Banner image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/home.png', // Replace with your image asset
                height: size.height * 0.25,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.green, size: 10),
                      SizedBox(width: 6),
                      Text("Active Subscription"),
                      Spacer(),
                      Text("Premium Plan",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Text("Subscription expires in",
                            style: TextStyle(color: Colors.grey)),
                      ),
                      Text(
                        "25 days",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.info_outline, color: Colors.blue),
                    ],
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
                    color: Colors.teal,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _progressCard(
                          icon: Icons.menu_book,
                          label: "Study",
                          percent: "75%",
                          subtext: "complete"),
                      const SizedBox(width: 12),
                      _progressCard(
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
                // Handle study materials navigation
              },
            ),
            const SizedBox(height: 12),
            // Mock Exams Button
            _menuButton(
              "Mock Exams",
              Icons.assignment_turned_in,
              onTap: () {
                // Handle mock exams navigation
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
      required String percent,
      required String subtext}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.teal, size: 28),
            const SizedBox(height: 6),
            Text(percent, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(subtext,
                style: const TextStyle(fontSize: 12, color: Colors.black54)),
          ],
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
          color: Colors.teal.shade400,
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
