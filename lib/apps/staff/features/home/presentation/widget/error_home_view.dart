import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorHomeView extends ConsumerWidget {
  final String error;
  const ErrorHomeView({super.key,required this.error});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_off_outlined, size: 80, color: Colors.grey),

            const SizedBox(height: 20),

            Text(
              "Unable to load profile",
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 10),

            Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.refresh),
              label: const Text("Retry"),
            ),
          ],
        ),
      ),
    );
  }
}
