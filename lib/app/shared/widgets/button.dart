import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MinecraftButton extends HookWidget {
  const MinecraftButton({super.key, required this.text, this.onPressed});
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      child: Ink(
        decoration: BoxDecoration(
          color: const Color(0xFF6b6b6b),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey[900]!),
        ),
        child: InkWell(
          onTap: onPressed,
          // onTapDown: (_) => isPressed.value = true,
          // onTapCancel: () => isPressed.value = false,
          // onTapUp: (_) => isPressed.value = false,
          hoverColor: const Color(0xFF7c86bb),
          highlightColor: const Color(0xFF7c86bb),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
