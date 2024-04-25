import 'package:flutter/material.dart';
import 'package:fvm/ui/screens/auth/sign_up_screen.dart';
import 'package:fvm/ui/screens/auth/splash_screen.dart';

class SociaLive extends StatefulWidget {
  const SociaLive({super.key});

  @override
  State<SociaLive> createState() => _SociaLiveState();
}

class _SociaLiveState extends State<SociaLive> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
