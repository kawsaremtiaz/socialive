import 'package:flutter/material.dart';
import 'package:fvm/ui/screens/auth/login_screen.dart';
import 'package:fvm/ui/screens/auth/sign_up_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 250),
              Image.asset(
                'assets/logo1.png',
                height: 60,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      'Create Account',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const SignUpScreen();
                      }));
                    }),
              ),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const LogInScreen();
                    }));
                  },
                  child: Text(
                    'Log In ↓',

                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue.shade400,
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
