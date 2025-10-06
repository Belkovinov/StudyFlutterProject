import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 80, color: Colors.orange),
          SizedBox(height: 16),
          Text(
            'Профиль пользователя',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
