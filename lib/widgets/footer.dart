import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Developed by  ',
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'Calibri',
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              'Hernandes Macedo',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Calibri',
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
