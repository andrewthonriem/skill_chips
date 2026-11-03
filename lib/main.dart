import 'package:flutter/material.dart';

import 'screens/profile_screen.dart';

void main() {
  runApp(const SkillChipsApp());
}

class SkillChipsApp extends StatelessWidget {
  const SkillChipsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skill Chips',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const ProfileScreen(),
    );
  }
}
