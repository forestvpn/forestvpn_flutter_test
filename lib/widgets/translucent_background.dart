import 'package:flutter/material.dart';

class TranslucentBackground extends StatelessWidget {
  final Widget child;

  const TranslucentBackground({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
