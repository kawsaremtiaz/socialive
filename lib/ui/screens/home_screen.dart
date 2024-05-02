import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fvm/ui/widgets/text_input_filed.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final messageTeController = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  User? loggedin;

  void getCurrentUser() async {
    final currentUser = await _auth.currentUser;
    if (currentUser != null) {
      loggedin = currentUser;
    }
  }

  void messageStream() async{
    await for (var snapshot in firebaseFirestore.collection('messages').snapshots()){
      for (var message in snapshot.docs){
        print(message.data());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    messageStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('THis is home page'),
            TextInputFiled(
              hintText: 'messages',
              textEditingController: messageTeController,
              textInputType: TextInputType.text,
            ),
            ElevatedButton(
              onPressed: () {
                firebaseFirestore.collection('messages').add({
                  'text': messageTeController.text.trim(),
                  'sender': loggedin?.email
                });
              },
              child: const Text('Send'),
            )
          ],
        ),
      ),
    );
  }
}
