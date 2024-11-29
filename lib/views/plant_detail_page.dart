import 'package:flutter/material.dart';

class PlantDetailPage extends StatelessWidget {
  final Map<String, dynamic> plant;

  const PlantDetailPage({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    final String name = plant['name'] ?? 'Desconhecida';
    final String harvestTime =
        plant['harvestTime']?.toString() ?? 'Tempo de colheita desconhecido';
    final String imgUrl =
        plant['imgUrl']?.toString() ?? 'Imagem não encontrada';
    final String timeToGrow = plant['timeToGrow']?.toString() ?? 'N/A';

    final String bestHarvestSeason =
        plant['bestHarvestSeason']?.toString() ?? 'N/A';
    final String sunlightNeeds = plant['sunlightNeeds']?.toString() ?? 'N/A';
    final String waterNeeds = plant['waterNeeds']?.toString() ?? 'N/A';
    final String soilNeeds = plant['soilNeeds']?.toString() ?? 'N/A';
    final String description =
        plant['description']?.toString() ?? 'Sem descrição';
    final String howToHarvest = plant['howToHarvest']?.toString() ?? 'N/A';
    final String warnings = plant['warnings']?.toString() ?? 'Sem avisos';

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25.0),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 12, 99, 56),
        iconTheme: const IconThemeData(
          color: Colors.white, // Drawer icon color
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (imgUrl.isNotEmpty)
              Image.network(imgUrl, fit: BoxFit.cover, height: 200),
            const SizedBox(height: 16.0),
            Text('Tempo para germinar: $timeToGrow dias'),
            Text('Tempo para colheita: $harvestTime dias'),
            Text('Melhor estação do ano para plantio: $bestHarvestSeason'),
            Text('Quanto de sol precisa?: $sunlightNeeds'),
            Text('Quanto de água precisa?: $waterNeeds'),
            Text('Que tipo de solo precisa?: $soilNeeds'),
            const SizedBox(height: 8.0),
            Text('Descrição: $description'),
            const SizedBox(height: 8.0),
            Text('Como fazer a colheita: $howToHarvest'),
            const SizedBox(height: 8.0),
            Text('Avisos: $warnings'),
          ],
        ),
      ),
    );
  }
}
