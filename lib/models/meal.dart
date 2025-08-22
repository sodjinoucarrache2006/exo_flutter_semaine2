import 'package:flutter/material.dart';

class Meal {
  final String id;
  final String nom;
  final double prix;
  final String imageUrl;
  final String description;
  final bool isFavorite;

  const Meal({
    required this.id,
    required this.nom,
    required this.prix,
    required this.imageUrl,
    required this.description,
    this.isFavorite = false,
  });

  @override
  String toString() {
    return 'Meal(id: $id, nom: $nom, price: $prix, isFavite:$isFavorite )';
  }
}



final List<Meal> models = [
  Meal(
    id: 'm1',
    nom: 'Pizza Margherita',
    prix: 9.99,
    imageUrl: 'assets/images/menu1.jpeg',
    description:
        'Une pizza classique avec sauce tomate, mozzarella et basilic frais.',

    isFavorite:true,    
  ),
  Meal(
    id: 'm2',
    nom: 'Burger Maison',
    prix: 11.50,
    imageUrl: 'assets/images/menu2.jpeg',
    description:
        'Burger 100% bœuf avec cheddar, salade, tomates et sauce maison.',
        isFavorite:true, 
  ),
  Meal(
    id: 'm3',
    nom: 'Pad Thaï',
    prix: 12.00,
    imageUrl: 'assets/images/pad_thai.jpeg',
    description:
        'Nouilles sautées thaïlandaises avec crevettes, cacahuètes et citron vert.',
        isFavorite:true, 
  ),
  Meal(
    id: 'm4',
    nom: 'Tacos au poulet',
    prix: 8.50,
    imageUrl: 'assets/images/tacos.jpeg',
    description:
        'Tortilla garnie de poulet grillé, fromage et légumes croquants.',
        isFavorite:true, 
  ),
  Meal(
    id: 'm5',
    nom: 'Salade César',
    prix: 7.90,
    imageUrl: 'assets/images/menu3.jpeg',
    description: 'Laitue croquante, poulet, parmesan, croûtons et sauce César.',
    isFavorite:true, 
  ),
];
