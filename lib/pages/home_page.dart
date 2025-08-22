import 'package:flutter/material.dart';
import 'package:restau/widgets/meal_card.dart';
import '../widgets/custom_appbar.dart';
import '../models/meal.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageHome();
  }
}

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Accueil",
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),

          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(child: Text("Profile")),
              PopupMenuItem(child: Text("Paramètre")),
              PopupMenuItem(child: Text("Aides")),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: models.length,
        itemBuilder: (context, index) {
          final meal = models[index];
          return MealCard(meal: meal);
        },
      ),
    );
  }
}
