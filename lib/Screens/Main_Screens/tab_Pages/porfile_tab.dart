import 'package:flutter/material.dart';

class PorfileTab extends StatefulWidget {
  const PorfileTab({super.key});

  @override
  State<PorfileTab> createState() => _PorfileTabState();
}

class _PorfileTabState extends State<PorfileTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile'),
    );
  }
}