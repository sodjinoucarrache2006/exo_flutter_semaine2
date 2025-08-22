import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../core/theme.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const FormPage();
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final _keys = GlobalKey<FormState>();

  final TextEditingController _nomControler = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordcontroler = TextEditingController();
  String? genre;
  String? SelectPays;
  bool Option1 = false;
  bool Option2 = false;
  DateTime? date;

  bool afficherForm = true;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 32),
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 40),
                  InkWell(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: _imageFile != null
                          ? FileImage(_imageFile!)
                          : const AssetImage('assets/images/gri1.jpeg')
                                as ImageProvider,
                      child: _imageFile == null
                          ? const Icon(
                              Icons.camera_alt,
                              size: 32,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _nomControler,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),

                      prefixIcon: Icon(
                        Icons.person,
                        size: 28,
                        color: Colors.deepOrange,
                      ),
                      labelText: "Nom",
                      hintText: "Entrez votre nom",
                    ),
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _mailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.email,
                        size: 28,
                        color: Colors.deepOrange,
                      ),
                      hintText: "exemple@gmail.com",
                      labelText: "Email",
                    ),
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.phone,
                        size: 28,
                        color: Colors.deepOrange,
                      ),
                      hintText: "01 00 00 00 00",
                      labelText: "Tel",
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordcontroler,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 28,
                        color: Colors.deepOrange,
                      ),
                      labelText: "Password",
                    ),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: "Homme",
                        groupValue: genre,
                        onChanged: (value) {
                          setState(() {
                            genre = value;
                          });
                        },
                      ),
                      Text("Homme"),
                      SizedBox(width: 20),
                      Radio(
                        value: "Femme",
                        groupValue: genre,
                        onChanged: (value) {
                          setState(() {
                            genre = value;
                          });
                        },
                      ),
                      Text("Femme"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: Option1,
                        onChanged: (value) {
                          setState(() {
                            Option1 = value!;
                          });
                        },
                      ),
                      Text("Newsletter"),
                      SizedBox(width: 20),
                      Checkbox(
                        value: Option2,
                        onChanged: (value) {
                          setState(() {
                            Option2 = value!;
                          });
                        },
                      ),
                      Text("Promo"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: "Choisissez un pays",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.public,
                        size: 28,
                        color: Colors.deepOrange,
                      ),
                    ),
                    items: ["Benin", "Togo", "Mali", "Niger"]
                        .map(
                          (pays) =>
                              DropdownMenuItem(child: Text(pays), value: pays),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        SelectPays = value;
                      });
                    },
                  ),

                  OutlinedButton(
                    onPressed: () async {
                      DateTime? Dateselecte = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (Dateselecte != null) {
                        setState(() {
                          date = Dateselecte;
                        });
                      }
                    },
                    child: Text(
                      date == null
                          ? "Date de Naissanse"
                          : "${date!.day}/${date!.month}/${date!.year}",
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: Theme.of(context).elevatedButtonTheme.style,
                        onPressed: () {},
                        child: Text("Sauvegarder"),
                      ),
                      ElevatedButton(
                        style: Theme.of(context).elevatedButtonTheme.style,
                        onPressed: () {},
                        child: Text("Réinitialiser"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
