import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fvm/ui/screens/home_screen.dart';
import 'package:fvm/ui/widgets/text_input_filed.dart';

import '../../../firebase_auth/auth_services.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

TextEditingController emailTEController = TextEditingController();
TextEditingController passTEController = TextEditingController();

FirebaseAuth _auth = FirebaseAuth.instance;
bool isLoading = false;

void login(BuildContext context) {
  AuthService auth = AuthService();

  try {
    auth.signInWithEmailPassword(
        emailTEController.text.trim(), passTEController.text.trim());
  } catch (e) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ),
    );
  }
}

bool _checkboxValue = false;

class _LogInScreenState extends State<LogInScreen> {
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
                height: 150,
              ),
              const Text(
                'Enter your email and password',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
              ),
              const SizedBox(height: 30),
              const Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(height: 10),
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
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : const Text(
                            'Log In',
                            style: TextStyle(color: Colors.white),
                          ),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      final loginUser = await _auth.signInWithEmailAndPassword(
                        email: emailTEController.text.trim(),
                        password: passTEController.text.trim(),
                      );
                      if (loginUser != null) {
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const HomeScreen();
                        }));
                      }
                    }),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
