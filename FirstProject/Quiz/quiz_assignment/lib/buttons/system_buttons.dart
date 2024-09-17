import 'package:flutter/material.dart';

class SystemButton extends StatelessWidget {
  const SystemButton({required this.onPressed, required this.text, super.key});
  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 25),
          backgroundColor: const Color.fromARGB(255, 35, 96, 96),
          foregroundColor: Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.refresh_outlined, color: Colors.white),
            const SizedBox(width: 4),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
