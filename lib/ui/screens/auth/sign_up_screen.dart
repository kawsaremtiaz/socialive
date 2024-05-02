import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fvm/firebase_auth/auth_services.dart';
import 'package:fvm/ui/widgets/text_input_filed.dart';
import '../home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController emailTEController = TextEditingController();
TextEditingController passTEController = TextEditingController();
TextEditingController usernameTEController = TextEditingController();
TextEditingController bioTeController = TextEditingController();

FirebaseAuth _auth = FirebaseAuth.instance;

bool _checkboxValue = false;

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Create your account to explore the world',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Icon(
                        Icons.person,
                      ),
                    ),
                    Positioned(
                        bottom: -5, right: 0, child: Icon(Icons.camera_alt))
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextInputFiled(
                hintText: 'First and last name',
                textEditingController: usernameTEController,
                textInputType: TextInputType.emailAddress,
                prefix: Icons.person,
              ),
              const SizedBox(height: 10),
              const Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              TextInputFiled(
                hintText: 'Email Address',
                textEditingController: emailTEController,
                textInputType: TextInputType.emailAddress,
                prefix: Icons.email,
              ),
              const SizedBox(height: 15),
              const Text(
                'Password',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              TextInputFiled(
                hintText: 'Password',
                textEditingController: passTEController,
                textInputType: TextInputType.visiblePassword,
                prefix: Icons.lock,
                suffix: Icons.remove_red_eye,
              ),
              const Text(
                'Password',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              TextInputFiled(
                hintText: 'bio',
                textEditingController: bioTeController,
                textInputType: TextInputType.emailAddress,
                prefix: Icons.person,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: _checkboxValue,
                    // Provide a boolean value indicating whether the checkbox is checked or not
                    onChanged: (newValue) {
                      // Provide a function to handle changes in the checkbox state
                      setState(() {
                        _checkboxValue =
                            newValue ?? false; // Update the checkbox state
                      });
                    },
                  ),
                  const Text(
                    'Save password',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      await AuthService().signUpWithEmailPassword(
                        email: emailTEController.text.trim(),
                        password: passTEController.text.trim(),
                        username: usernameTEController.text.trim(),
                        bio: bioTeController.text.trim(),
                      );
                    }),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
