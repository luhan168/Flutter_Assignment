import 'package:flutter/material.dart';
import 'package:phone_shop/login_screen.dart';
import 'package:phone_shop/screens/home/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 40),
              // Logo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 80),
                  Image.asset(
                    "assets/images/phoneIcon.png", // replace with your logo image
                    height: 150,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "PHONE\nSTORE",
                    style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 38, 169, 227),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 40),
                  // Title
                  const Text(
                    textAlign: TextAlign.center,
                    "Welcome to Phone\nStore",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Discover the latest smartphones,\naccessories, and gadgets—all in one place.\nShop with ease and enjoy a seamless\nexperience at your fingertips.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 40),
                  // Get Started Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 3.2, // 👈 controls shadow depth
                        shadowColor: const Color.fromARGB(
                          255,
                          15,
                          42,
                          247,
                        ), // 👈 shadow color
                      ),
                      onPressed: () {
                        // Navigate to next page
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        "Get started →",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Sign In Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: const BorderSide(color: Colors.blue),
                      ),
                      onPressed: () {
                        // Navigate to sign in
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  // const Spacer(),
                  SizedBox(height: 20),
                  // Terms and Privacy
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        const Text(
                          "By signing in or creating an account, you agree to our ",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        GestureDetector(
                          onTap: () {},

                          child: const Text(
                            "Terms of services",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 0, 111, 202),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        const Text(
                          " and ",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Privacy policy",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 0, 111, 202),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
