import 'package:driving_license_exam/component/appbar.dart';
import 'package:driving_license_exam/editprofile.dart';
import 'package:driving_license_exam/premium.dart';
import 'package:driving_license_exam/screen/login/signup/splash/login.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            appbar(
              textColor: Colors.black,
              size: size,
              bgcolor: const Color(0xFFEBF6FF),
              heading: "PROFILE INFORMATION",
            ),
            const SizedBox(height: 16),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width * 0.9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          'assets/images/profile.png'), // replace with your asset
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Malithi Imasha',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),

                    // Personal Info Box
                    Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color:
                            const Color(0xffEBF6FF), // or any color you prefer
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Personal Information',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            SizedBox(height: 10),
                            Text('Full name:',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                            Text('Malithi Imasha',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 8),
                            Text('Email address:',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                            Text('malithiimasha@gmail.com',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 8),
                            Text('Date of birth:',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                            Text('May 10, 2000',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Editprofile();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEBF6FF),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Subscription Box
                    Card(
                      color: const Color(0xFFE7F4FD),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Current Subscription',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('6 Month Plan'),
                                Text('Rs. 2700',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              ],
                            ),
                            const SizedBox(height: 6),
                            const Text('Billed as one-time subscription'),
                            const Divider(),
                            const ListTile(
                              dense: true,
                              leading: Icon(Icons.check_circle_outline,
                                  color: Colors.green),
                              title: Text('Full access to practice tests'),
                            ),
                            const ListTile(
                              dense: true,
                              leading: Icon(Icons.check_circle_outline,
                                  color: Colors.green),
                              title: Text('Download past exam handbook'),
                            ),
                            const ListTile(
                              dense: true,
                              leading: Icon(Icons.check_circle_outline,
                                  color: Colors.green),
                              title: Text('Progress tracking'),
                            ),
                            const ListTile(
                              dense: true,
                              leading: Icon(Icons.check_circle_outline,
                                  color: Colors.green),
                              title: Text('Personalized study plan'),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: size.width,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const SubscriptionScreen();
                                  }));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff219EBC)),
                                child: const Text('Manage Subscription',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    SizedBox(
                      width: size.width,
                      child: ElevatedButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Log out'),
                            content:
                                const Text('are you sure you want to log out?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                ),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Log out'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
