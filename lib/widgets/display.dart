import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String text;
  final String history;

  const Display({
    super.key,
    required this.text,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // HISTÓRICO
          SizedBox(
            height: 120,
            child: SingleChildScrollView(
              reverse: true,
              child: Text(
                history,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white54,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // DISPLAY PRINCIPAL
          Text(
            text.isEmpty ? '0' : text,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}