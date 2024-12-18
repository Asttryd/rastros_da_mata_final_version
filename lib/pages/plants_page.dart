import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rastros_da_mata/services/firestore.dart';
import 'plant_detail_page.dart';
import 'package:rastros_da_mata/widgets/drawer_menu.dart';

class PlantsPage extends StatefulWidget {
  const PlantsPage({super.key});

  @override
  State<PlantsPage> createState() => _PlantsPageState();
}

class _PlantsPageState extends State<PlantsPage> {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Plantas'),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25.0),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 12, 99, 56),
          iconTheme: const IconThemeData(
            color: Colors.white, // Drawer icon color
          ),
        ),
        drawer: const CustomDrawer(),
        body: StreamBuilder<QuerySnapshot>(
          stream: firestoreService.getPlantsStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text('Erro ao carregar plantas'),
              );
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('Nenhuma planta encontrada'),
              );
            }

            final plants = snapshot.data!.docs;

            return GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: plants.length,
                itemBuilder: (context, index) {
                  final plant = plants[index].data() as Map<String, dynamic>;

                  final String name = plant['name'] ?? 'Desconhecida';
                  final String harvestTime = plant['harvestTime']?.toString() ??
                      'Tempo de colheita desconhecido';
                  final String imgUrl = plant['imgUrl']?.toString() ?? '';

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlantDetailPage(plant: plant),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 4.0,
                      color: const Color.fromARGB(255, 12, 99, 56),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12.0),
                              ),
                              child: imgUrl.isNotEmpty
                                  ? Image.network(
                                      imgUrl,
                                      fit: BoxFit.cover,
                                    )
                                  : const Icon(
                                      Icons.image,
                                      size: 50,
                                    ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  '$harvestTime dias para colheita',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 14.0, color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
        ));
  }
}
