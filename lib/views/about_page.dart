import 'package:flutter/material.dart';
import 'package:rastros_da_mata_official_app/widgets/drawer_menu.dart'; // Import the custom drawer

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sobre nós'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25.0),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 12, 99, 56),
        iconTheme: const IconThemeData(
          color: Colors.white, // Drawer icon color
        ),
      ),
      drawer: const CustomDrawer(), // Use the custom drawer
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Seja bem-vindo(a) ao cantinho da Família Rastros!',
              style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 99, 56)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text(
              'Aqui você encontrará informações para aprender a cultivar frutas, verduras, legumes, temperos e PANCs em espaços pequenos, possibilitando aproveitar aqueles cantinhos da sua casa.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 30),
            Image.asset(
              'assets/images/seeding.png',
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),
            const Text(
              'Nos reunimos visando duas necessidades: a preocupação com o meio ambiente e a alimentação.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Diante do cenário exposto pela ONU em relação ao ambiente e, consequentemente, à fome, nos preocupamos em buscar uma solução para que as pessoas consigam alterar o curso dessa situação, mesmo que dentro da própria casa.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Entendemos que também somos capazes de ajudar nessa causa, levando ao público informações sobre o plantio em vasos e pequenos espaços, visando uma melhora no nosso consumo de alimentos saudáveis e livres de agrotóxicos.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 30),
            Image.asset(
              'assets/images/pots.png',
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),
            const Text(
              'Mas o que são as PANCs?',
              style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 99, 56)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text(
              'Plantas Alimentícias Não Convencionais (PANCs) são plantas ou partes de plantas comestíveis, e que não são usualmente consumidas. É importante lembrar, aprender a reconhecer e utilizar corretamente essas plantas para evitar riscos de contaminação e até de intoxicação.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'As PANCs são mais resistentes às alterações climáticas, garantindo a existência desse alimento em situações mais drásticas à toda população.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Contato',
              style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 99, 56)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text(
              'Ficou com dúvidas ou quer fazer uma sugestão? Entre em contato conosco!',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 30),
            Image.asset(
              'assets/images/contact.png',
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            const Text(
              'asptstudios@gmail.com',
              style: TextStyle(
                fontSize: 15.0,
                color: Color.fromARGB(255, 12, 99, 56),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
