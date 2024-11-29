import 'package:flutter/material.dart';
import 'package:rastros_da_mata_official_app/views/plants_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: PageView(
              controller: _pageController,
              children: [
                _buildSlide(
                    title: "Seja bem-vindo(a)!",
                    image: "assets/images/welcome.png",
                    description:
                        "Olá! Seja bem-vindo(a) à Rastros da Mata. Estamos muito felizes de ter você conosco."),
                _buildSlide(
                    title: "Como usar o aplicativo",
                    image: "assets/images/form.png",
                    description:
                        "Ao entrar no app, você poderá utilizar do menu no canto superior esquerdo para navegar pelo aplicativo."),
                _buildSlide(
                    title: "Nossas plantas",
                    image: "assets/images/plant.png",
                    description:
                        "Você encontrará por aqui uma alta gama de plantas com suas informações de germinação e plantio disponíveis na palma da sua mão."),
                _buildLastSlide(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 4,
                effect: const WormEffect(
                  dotHeight: 8.0,
                  dotWidth: 8.0,
                  spacing: 16.0,
                  activeDotColor: Color.fromARGB(255, 3, 94, 3),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_pageController.page == 3) {
                  if (_isChecked) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlantsPage()),
                      (Route<dynamic> route) => false,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text("Please agree to the terms to proceed.")),
                    );
                  }
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text(
                  _pageController.hasClients && _pageController.page == 3
                      ? 'Finalizar'
                      : 'Próximo'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSlide(
      {required String title,
      required String image,
      required String description}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24.0),
          Image.asset(image, height: 250),
          const SizedBox(height: 16.0),
          Text(
            description,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _buildLastSlide() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Bom cultivo!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24.0),
          Image.asset('assets/images/planting.png', height: 250),
          const Text(
            'Encontrou alguma planta que lhe despertou curiosidade? Se motivou a plantar aquele temperinho na janela da sua casa? Leia, cultive e aproveite!',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24.0),
          GestureDetector(
            onTap: () => _openLink(
                "https://rastrosdamata.blogspot.com/2023/03/privacy-policy-para-idioma-portugues.html"),
            child: const Text(
              "Política de privacidade",
              style: TextStyle(
                  color: Colors.blue, decoration: TextDecoration.underline),
            ),
          ),
          GestureDetector(
            onTap: () => _openLink(
                "https://rastrosdamata.blogspot.com/2024/11/termos-e-condicoes.html"),
            child: const Text(
              "Termos de Serviço",
              style: TextStyle(
                  color: Colors.blue, decoration: TextDecoration.underline),
            ),
          ),
          CheckboxListTile(
            value: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = value ?? false;
              });
            },
            title: const Text(
                "Eu concordo com os Termos de Serviço e a Política de Privacidade."),
          ),
        ],
      ),
    );
  }
}

Future<void> _openLink(String url) async {
  final urlFinal = Uri.parse(url);
  if (!await launchUrl(urlFinal)) {
    throw Exception('Não foi possível abrir $url');
  }
}
