import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/growth.png'),
                fit: BoxFit.cover,
              ),
            ),
            // alignment: Alignment.center,
            child: Text(
              'Menu',
              style: TextStyle(
                color: Color.fromARGB(255, 12, 99, 56),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.emoji_nature_outlined),
            title: const Text('Plantas'),
            textColor: const Color.fromARGB(255, 12, 99, 56),
            iconColor: const Color.fromARGB(255, 12, 99, 56),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/plants', // Named route for the home screen
                (route) => false,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Sobre nós'),
            textColor: const Color.fromARGB(255, 12, 99, 56),
            iconColor: const Color.fromARGB(255, 12, 99, 56),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/about', // Named route for the home screen
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
