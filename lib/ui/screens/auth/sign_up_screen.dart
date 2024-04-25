import 'package:flutter/material.dart';
import 'package:fvm/ui/widgets/text_input_filed.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController emailTEController = TextEditingController();
TextEditingController passTEController = TextEditingController();

 bool _checkboxValue=false;

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
                height: 150,
              ),
              const Text(
                'Create your account to explore the world',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
              ),
              const SizedBox(height: 30),
              const Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextInputFiled(
                hintText: 'First and last name',
                textEditingController: emailTEController,
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
                suffix:Icons.remove_red_eye,

              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: _checkboxValue, // Provide a boolean value indicating whether the checkbox is checked or not
                    onChanged: (newValue) {
                      // Provide a function to handle changes in the checkbox state
                      setState(() {
                        _checkboxValue = newValue ?? false; // Update the checkbox state
                      });
                    },
                  ),
                  const Text('Save password',
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
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const SignUpScreen();
                      }));
                    }),
              ),
            ],
          ),
        ),
      )),
    );
  }


}
