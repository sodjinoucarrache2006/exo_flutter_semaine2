import 'package:flutter/material.dart';
import 'package:restau/core/constants.dart';
import '../widgets/custom_appbar.dart';
import '../core/constants.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Gallery(),
    );
  }
}

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final List<String> mesImages = [
    "assets/images/gri1.jpeg",
    "assets/images/gri2.jpeg",
    "assets/images/gri3.jpeg",
    "assets/images/gri4.jpeg",
    "assets/images/gri5.jpeg",
    "assets/images/gri6.jpeg",
    "assets/images/gri7.jpeg",
    "assets/images/gri8.jpeg",
    "assets/images/gri9.jpeg",
    "assets/images/gri10.jpeg",
    "assets/images/gri11.jpeg",
    "assets/images/gri12.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Gallerie',
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(child: Text("Filtré")),
              PopupMenuItem(child: Text("Rechercher")),
              PopupMenuItem(child: Text("Qui")),
            ],
          ),
        ],
      ),

      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: mesImages.length,
        itemBuilder: (context, index) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              mesImages[index],
              fit: BoxFit.cover,
              )
              );
        },
      ),
    );
  }
}
