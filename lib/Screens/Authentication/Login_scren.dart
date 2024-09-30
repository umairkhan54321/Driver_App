import 'package:driver_app/Globle/globle.dart';
import 'package:driver_app/Screens/Authentication/signup_screen.dart';
import 'package:driver_app/Screens/Main_Screens/main_screen.dart';
import 'package:driver_app/Screens/Splash_Screen.dart/Splash_screen.dart';
import 'package:driver_app/Screens/widgets/progress_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScren extends StatefulWidget {
  const LoginScren({super.key});

  @override
  State<LoginScren> createState() => _LoginScrenState();
}

class _LoginScrenState extends State<LoginScren> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  validateForm() {
    if (!emailController.text.contains('@')) {
      Fluttertoast.showToast(msg: 'Email address is not valid.');
    } else if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'password is required.');
    } else {
      loginDriverNow();
    }
  }

  loginDriverNow() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Show progress dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext c) {
        return ProgressDialog(
          message: 'Progressing please wait....',
        );
      },
    );

    // Create the user with Firebase
    final User? firebaseUser = (await fAuth
            .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
            .catchError((error) {
      Navigator.pop(context); // Dismiss the dialog
      Fluttertoast.showToast(msg: "Error: $error");
      print("Error during account creation: $error");
      return null;
    }))
        .user;

    // If the user creation was successful
    if (firebaseUser != null) {
      print('Firebase User ID: ${firebaseUser.uid}');

      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: "Login Succes.");
      // Navigate to CarInfoScreen after successful registration
      Navigator.push(
        context,
        MaterialPageRoute(builder: (c) => const SplashScreen()),
      );
    } else {
      Navigator.pop(context); // Dismiss the dialog
      Fluttertoast.showToast(msg: "Error Occured during Login.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/logo1.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Login as a Driver',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                    labelText: 'Email',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 10)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                    labelText: 'Password',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 10)),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    validateForm();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreenAccent),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => const SignupScreen()));
                  },
                  child: const Text(
                    'Already have an Account? Login here',
                    style: TextStyle(color: Colors.grey),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
