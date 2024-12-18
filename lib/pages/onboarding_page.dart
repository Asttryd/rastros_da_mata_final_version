import 'package:flutter/material.dart';
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
      backgroundColor: Colors.white,
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
                  activeDotColor: Color.fromARGB(255, 12, 99, 56),
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
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/plants',
                      (route) => false,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              "Por favor, aceite os termos para poder prosseguir.")),
                    );
                  }
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: _isChecked
                      ? const Color.fromARGB(255, 12, 99, 56)
                      : Colors.grey,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Color.fromARGB(255, 96, 96, 96),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
              child: const Text(
                'Próximo',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
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
          const SizedBox(height: 35.0),
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
            activeColor: const Color.fromARGB(255, 12, 99, 56),
            checkColor: Colors.white,
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
