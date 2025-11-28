import 'package:flutter/material.dart';

class SmallIconWidget extends StatelessWidget {
  final String asset;
  final VoidCallback onTap;
  const SmallIconWidget({super.key, required this.asset, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
      shape: const CircleBorder(),
      elevation: 3,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(6), // 🔥 lebih kecil
          child: Image.asset(
            asset,
            width: 18, // 🔥 diperkecil
            height: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
