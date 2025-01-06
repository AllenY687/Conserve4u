import 'package:flutter/material.dart';
import 'homepage.dart'; // Import the homepage.dart file

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              BackgroundIcons(), // Widget to display the background icons
              LoginPage(),       // Widget for the login form
            ],
          ),
        ),
      ),
    );
  }
}

class BackgroundIcons extends StatelessWidget {
  const BackgroundIcons({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87, // Replace with the desired background color
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, // Adjust the number of icons per row
        ),
        itemBuilder: (context, index) {
          return  Image.asset(
            'assets/venn-diagram.png', // Replace this with the path of your logo image
            color: Colors.blueGrey, // Replace this with the desired image color
          );
        },
      ),
    );
  }
}
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  void _navigateToHomepage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Homepage()), // Navigate to the Homepage
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey, // Replace this with your background color
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned.fill(
            child: BackgroundIcons(), // Widget to display the background icons
          ),
          Column(
            children: [
              const SizedBox(height: 100), // Adjust the height for logo positioning
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/conserve4u.png'), // Your logo image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        'Sign in to continue.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {
                          _navigateToHomepage(context);// Add your login logic here
                        },
                        child: const Text('Log in'),
                      ),
                      const SizedBox(height: 16),
                      const Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text('Forgot password?'),
                            Text('Sign up!'),
                          ],
                        ),
                      ),
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

