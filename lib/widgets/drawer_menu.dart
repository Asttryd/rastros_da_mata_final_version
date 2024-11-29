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
              color: Color.fromARGB(255, 0, 100, 5),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.emoji_nature_outlined),
            title: const Text('Plantas'),
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
