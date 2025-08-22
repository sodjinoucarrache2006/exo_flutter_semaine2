import 'dart:ffi';

import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const StepWidget();
  }
}

class StepWidget extends StatefulWidget {
  const StepWidget({super.key});

  @override
  State<StepWidget> createState() => _StepWidgetState();
}

class _StepWidgetState extends State<StepWidget> {
  final TextEditingController RecherheController = TextEditingController();

  bool estRechercher = false;
  String ElementRechercher = "";
  String nom = "";
  String adresse = "";
  String telephone = "";
  String? selectPlat;
  int index = 0;
  String? paiement;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: estRechercher
            ? TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Rechercher.....",
                  prefixIcon: Icon(Icons.search),
                ),
              )
            : Text("Commende"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (estRechercher) {
                  estRechercher = false;
                  RecherheController.clear();
                  ElementRechercher = "";
                } else {
                  estRechercher = true;
                }
              });
            },
            icon: Icon(estRechercher ? Icons.close : Icons.search),
          ),
        ],
      ),
      body: Stepper(
        type: StepperType.vertical,
        steps: etape(),
        onStepContinue: suivant,
        onStepCancel: cancel,
        currentStep: index,
      ),
    );
  }

  List<Step> etape() {
    return [
      ///etape1 choix de plat
      Step(
        title: Text("Chisissez un plat"),
        content: Column(
          children: [
            RadioListTile(
              value: "pizza",
              groupValue: selectPlat,
              onChanged: (value) {
                setState(() {
                  selectPlat = value;
                });
              },
              title: Text("pizza"),
            ),
            RadioListTile(
              value: "Riz + alloco",
              groupValue: selectPlat,
              onChanged: (value) {
                setState(() {
                  selectPlat = value;
                });
              },
              title: Text("Riz + alloco"),
            ),
            RadioListTile(
              value: "Spagutti",
              groupValue: selectPlat,
              onChanged: (value) {
                setState(() {
                  selectPlat = value;
                });
              },
              title: Text("Spagutti"),
            ),
            RadioListTile(
              value: "Viande",
              groupValue: selectPlat,
              onChanged: (value) {
                setState(() {
                  selectPlat = value;
                });
              },
              title: Text("Viande"),
            ),
            RadioListTile(
              value: "Omellete",
              groupValue: selectPlat,
              onChanged: (value) {
                setState(() {
                  selectPlat = value;
                });
              },
              title: Text("Omellete"),
            ),
            RadioListTile(
              value: "Pate",
              groupValue: selectPlat,
              onChanged: (value) {
                setState(() {
                  selectPlat = value;
                });
              },
              title: Text("Pate"),
            ),
            RadioListTile(
              value: "Pilon",
              groupValue: selectPlat,
              onChanged: (value) {
                setState(() {
                  selectPlat = value;
                });
              },
              title: Text("Pilon"),
            ),
          ],
        ),
      ),

      //etape 2 Livraiseon
      Step(
        title: Text("Livraison"),
        content: Column(
          children: [
            TextFormField(
              onChanged: (value) => nom = value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nom",
                prefixIcon: Icon(Icons.person),
                hintText: "Entrez votre nom",
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              onChanged: (value) => adresse = value,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                labelText: "adresse",
                prefixIcon: Icon(Icons.holiday_village),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              onChanged: (value) => telephone= value,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Tel",
                prefixIcon: Icon(Icons.phone),
              ),
            ),
          ],
        ),
      ),

      Step(
        title: Text("Paiement"),
        content: Column(
          children: [
            RadioListTile(
              value: "Carte",
              groupValue: paiement,
              onChanged: (value) {
                setState(() {
                  paiement = value;
                });
              },
              title: Text("Carte bancaire"),
            ),
            RadioListTile(
              value: "Mobile",
              groupValue: paiement,
              onChanged: (value) {
                setState(() {
                  paiement = value;
                });
              },
              title: Text("Mobile Money"),
            ),
            RadioListTile(
              value: "cash",
              groupValue: paiement,
              onChanged: (value) {
                setState(() {
                  paiement = value;
                });
              },
              title: Text("Cash à la livraison"),
            ),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: valider,
              child: Text("Confirmer la commande"),
            ),
          ],
        ),
      ),
    ];
  }

  void suivant() {
    if (index < 2) {
      setState(() {
        index++;
      });
    }
  }

  void cancel() {
    if (index > 0) {
      setState(() {
        index--;
      });
    }
  }

  void valider() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("Valider Commende"),
          content: Text(
            "Merci $nom ! Votre commande est en route \n"
            "vous avez choisir: Un plat de ${selectPlat?? "Rien"} \n"
            "Vous avez payer par : ${paiement?? "Rien"}"
            ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Fermer"),
            ),
          ],
        );
      },
    );
  }
}
