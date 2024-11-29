import 'package:flutter/material.dart';
import 'package:rastros_da_mata_official_app/widgets/drawer_menu.dart'; // Import the custom drawer

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre nós'),
      ),
      drawer: const CustomDrawer(), // Use the custom drawer
      body: const Center(
        child: Text(
          'This is the About Us page!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
