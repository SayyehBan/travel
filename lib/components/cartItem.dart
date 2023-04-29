import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.title1,
    required this.title2,
  });

  final String title1;
  final String title2;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color.fromARGB(60, 0, 0, 0), width: 1)),
      child: SizedBox(
        width: 85,
        height: 85,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(title1),
          Text(
            title2,
            textDirection: TextDirection.rtl,
          )
        ]),
      ),
    );
  }
}
