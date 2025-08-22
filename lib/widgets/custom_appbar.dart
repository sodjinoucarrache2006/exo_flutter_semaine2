import 'package:flutter/material.dart';
import 'package:restau/core/constants.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;


  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: KPrimaryColors,
      foregroundColor: Colors.white,
      centerTitle: true,
      title: Text(title),

      actions: actions,
    );
  }
  @override
 
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
