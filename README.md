# 🍽️ Restaurant App – Flutter

Application Flutter d’apprentissage qui regroupe les bases UI : formulaires, listes, grilles, navigation par onglets (BottomNavigationBar) et un **processus de commande** avec **Stepper**.

---

## ✨ Fonctionnalités

- **Accueil (Home)** : liste de plats (cards réutilisables)
- **Galerie (Gallery)** : grille d’images (GridView)
- **Profil (Profile)** : formulaire utilisateur (avatar + champs)
- **Commandes (Order)** : Stepper (Choix du plat → Livraison → Paiement) + confirmation

---

## 🧩 Widgets couverts

- **Formulaires** : `TextFormField`, `DropdownButtonFormField`, `Radio`, `Checkbox`, `Switch`, `Slider`, `showDatePicker`, `showTimePicker`
- **Listes & Grilles** : `ListView.builder`, `ListView.separated`, `GridView.count`, `GridView.builder`, `GridTile`, `GridTileBar`
- **Présentation** : `Card`, `InkWell`, `CircleAvatar`, `Container`, `Padding`, `SizedBox`
- **Navigation** : `BottomNavigationBar`, `Navigator (push/pop)`
- **Processus** : `Stepper`
- **Feedback** : `AlertDialog` 

---

## 📂 Arborescence


lib/
│
├── main.dart # 🚀 Point d’entrée (MaterialApp + thème + nav)
│
├── core/
│ ├── theme.dart # 🎨 Thème global (couleurs, TextTheme, boutons…)
│ └── constants.dart # 🔑 Constantes (paddings, radius, durées…)
│
├── models/
│ └── meal.dart # 🗂️ Modèle de données d’un plat (+ demoMeals)
│
├── pages/
│ ├── home_page.dart # 🏠 Liste des plats (cards)
│ ├── gallery_page.dart # 🖼️ Grille d’images
│ ├── profile_page.dart # 👤 Profil + formulaire
│ └── order_page.dart # 🧾 Stepper (commande)
│
├── widgets/
│ ├── meal_card.dart # 🍔 Card réutilisable pour un plat
│ ├── profile_form.dart # 📝 Formulaire du profil (réutilisable)
│ └── custom_appbar.dart # 🎯 AppBar personnalisée
│
└── navigation/
└── bottom_nav.dart # 🧭 BottomNavigationBar + IndexedStack
