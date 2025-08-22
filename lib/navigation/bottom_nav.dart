import 'package:flutter/material.dart';
import 'package:restau/core/constants.dart';
import '../pages/home_page.dart';
import '../pages/gallery_page.dart';
import '../pages/profile_page.dart';
import '../pages/order_page.dart';

final int KHomePage = 0;
final int KGallery = 1;
final int KProfil = 2;
final int KStepPage = 3;

class BottomNavEcran extends StatefulWidget {
  const BottomNavEcran({super.key});

  @override
  State<BottomNavEcran> createState() => _BottomNavEcranState();
}

class _BottomNavEcranState extends State<BottomNavEcran> {
  int pageActuel = 0;

  final List<Widget> mesPages = [HomePage(), Gallery(), ProfilePage(), OrderPage()];

  void _onTabSelected(int index) {
    setState(() {
      pageActuel = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: pageActuel, children: mesPages),

      bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  backgroundColor: Colors.pink, // ou ta couleur primaire
  selectedItemColor: Colors.white,
  unselectedItemColor: Colors.white70,
  currentIndex: pageActuel,
  onTap: _onTabSelected,
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Accueil",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.photo_album),
      label: "Gallerie",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Profil",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: "Commandes",
    ),
  ],
),

    );
  }
}
