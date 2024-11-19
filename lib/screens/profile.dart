import 'package:flutter/material.dart';
import 'package:movie/screens/login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  bool _isLogged = false;

  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
