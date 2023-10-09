import 'package:flutter/material.dart';

class OwnButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isLoading;
  const OwnButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => isLoading ? () {} : onPressed(),
      child: !isLoading
          ? Text(
              title,
            )
          : const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 3,
            ),
    );
  }
}
