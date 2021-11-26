import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Colors.red,
                Colors.pink,
                Colors.blue,
                Colors.cyan,
                Colors.green,
                Colors.yellow,
                Colors.white,
              ],
            ),
          ),
        ),
        title: const Text(
          'Perceptron Colors',
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'Calibri',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
