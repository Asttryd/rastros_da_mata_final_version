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
                color: Color.fromARGB(255, 0, 55, 6),
                fontSize: 24,
                fontWeight: FontWeight.bold,
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
