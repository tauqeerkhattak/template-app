import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String error;
  final VoidCallback onReload;
  const ErrorView({
    super.key,
    required this.error,
    required this.onReload,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            error,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(100, 40),
              backgroundColor: Colors.red,
            ),
            onPressed: onReload,
            child: const Text(
              'Reload',
            ),
          ),
        ],
      ),
    );
  }
}
