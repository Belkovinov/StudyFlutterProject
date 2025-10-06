import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.medical_services, size: 80, color: Colors.green),
          SizedBox(height: 16),
          Text(
            'Каталог услуг',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
