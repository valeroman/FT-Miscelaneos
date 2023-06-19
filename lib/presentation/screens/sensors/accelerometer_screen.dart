import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class AccelerometerScreen extends ConsumerWidget {
  const AccelerometerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final accelerometerGravity$ = ref.watch( accelerometerGravityProvider );
    final acclerometerUser$ = ref.watch( accelerometerUserProvider );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Acelerómetro'),
      ),
      body: Center(
        child: acclerometerUser$.when(
          data: (value) => Text(
            value.toString(),
            style: const TextStyle( fontSize: 30),
          ), 
          error: (error, stackTrace) => Text('$error'), 
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}