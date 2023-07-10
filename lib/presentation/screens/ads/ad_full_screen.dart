import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class AdFullScreen extends ConsumerWidget {
  const AdFullScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final interstitialAdAsync = ref.watch( adInterstitialProvider );

    //! Aplicar para google maps
    ref.listen(adInterstitialProvider, (previous, next) { 
      if ( !next.hasValue ) return;
      if ( next.value == null ) return;

      next.value!.show();
    });

    if ( interstitialAdAsync.isLoading ) {
      return const Scaffold(
        body: Center(child: Text('Cargando ad')),
      );
    }


    // if ( interstitialAdAsync.hasValue ) {
    //   interstitialAdAsync.value!.show();
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad Full Screen'),
      ),
      body: const Center(
        child: Text('Ya puedes regresar o ver esta pantalla'),
      ),
    );
  }
}