import 'package:driver_app/Globle/globle.dart';
import 'package:driver_app/Screens/Authentication/Login_scren.dart';
import 'package:flutter/material.dart';

class PorfileTab extends StatefulWidget {
  const PorfileTab({super.key});

  @override
  State<PorfileTab> createState() => _PorfileTabState();
}

class _PorfileTabState extends State<PorfileTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            fAuth.signOut();
            Navigator.push(
                context, MaterialPageRoute(builder: (c) => const LoginScren()));
          },
          child: Text('Sign Out')),
    );
  }
}
