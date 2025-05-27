import 'package:driving_license_exam/component/appbar.dart';
import 'package:driving_license_exam/component/backbutton.dart';
import 'package:flutter/material.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final TextEditingController _nameController =
      TextEditingController(text: 'Malithi Imasha');
  final TextEditingController _emailController =
      TextEditingController(text: 'malithiimasha@gmail.com');
  final TextEditingController _dobController =
      TextEditingController(text: 'May 10, 2000');

  // Flags to toggle edit mode
  bool _isEditingName = false;
  bool _isEditingEmail = false;
  bool _isEditingDob = false;

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    _nameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    super.dispose();
  }

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
              heading: "EDIT PROFILE INFORMATION",
            ),
            const SizedBox(height: 16),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width * 0.9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                              'assets/images/profile.png'), // replace with your asset
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFEBF6FF),
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text(
                              'Change profile Image',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 70),

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
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Personal Information',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Full Name Field
                            const Text(
                              'Full name:',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: _isEditingName
                                      ? TextField(
                                          controller: _nameController,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                          ),
                                          style: const TextStyle(fontSize: 15),
                                        )
                                      : Text(
                                          _nameController.text,
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                ),
                                IconButton(
                                  icon: Icon(_isEditingName
                                      ? Icons.check
                                      : Icons.edit),
                                  onPressed: () {
                                    setState(() {
                                      if (_isEditingName) {
                                        // Save changes (you can add validation or API call here)
                                      }
                                      _isEditingName = !_isEditingName;
                                    });
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            // Email Address Field
                            const Text(
                              'Email address:',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: _isEditingEmail
                                      ? TextField(
                                          controller: _emailController,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                          ),
                                          style: const TextStyle(fontSize: 15),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                        )
                                      : Text(
                                          _emailController.text,
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                ),
                                IconButton(
                                  icon: Icon(_isEditingEmail
                                      ? Icons.check
                                      : Icons.edit),
                                  onPressed: () {
                                    setState(() {
                                      if (_isEditingEmail) {
                                        // Save changes (you can add validation or API call here)
                                      }
                                      _isEditingEmail = !_isEditingEmail;
                                    });
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            // Date of Birth Field
                            const Text(
                              'Date of birth:',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: _isEditingDob
                                      ? TextField(
                                          controller: _dobController,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                          ),
                                          style: const TextStyle(fontSize: 15),
                                        )
                                      : Text(
                                          _dobController.text,
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                ),
                                IconButton(
                                  icon: Icon(_isEditingDob
                                      ? Icons.check
                                      : Icons.edit_calendar),
                                  onPressed: () {
                                    setState(() {
                                      if (_isEditingDob) {
                                        // Save changes (you can add validation or API call here)
                                      }
                                      _isEditingDob = !_isEditingDob;
                                    });
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isEditingName = false;
                            _isEditingEmail = false;
                            _isEditingDob = false;
                          });
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
                          'Save & Change',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.25),

                    // Subscription Box
                  ],
                ),
              ),
            ),
            backbutton(size: size),
          ],
        ),
      ),
    );
  }
}
