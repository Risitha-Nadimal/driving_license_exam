import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // Navigate to login screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Splash()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.15,
              ),
              const Text(
                'App logo',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Image.asset("assets/images/Loader.png"),
              const Center(
                child: Text(
                  'Wait a second ',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Image.asset("assets/images/Group 5245.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
