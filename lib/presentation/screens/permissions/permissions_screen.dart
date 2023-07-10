import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permisos'),
      ),
      body: const _PermissionsView(),
    );
  }
}

class _PermissionsView extends ConsumerWidget {

  const _PermissionsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final textStyle = Theme.of(context).textTheme;
    final permissions = ref.watch( permissionsProvider );
    final showAds = ref.watch( showAdsProvider );

    return ListView(
      children: [

        CheckboxListTile(
          value: permissions.cameraGranted,
          title: Text('Cámara', style: textStyle.titleMedium),
          subtitle: Text('${ permissions.camera }'), 
          onChanged: ( _ ) {
            ref.read(permissionsProvider.notifier).requestCameraAccess();
          }
        ),

         CheckboxListTile(
          value: permissions.photoLibraryGranted,
          title: Text('Galería de fotos', style: textStyle.titleMedium),
          subtitle: Text('${ permissions.photoLibrary }'), 
          onChanged: ( _ ) {
            ref.read(permissionsProvider.notifier).requestPhotoLibraryAccess();
          }
        ),

         CheckboxListTile(
          value: permissions.locationGranted,
          title: Text('Location', style: textStyle.titleMedium),
          subtitle: Text('${ permissions.location }'), 
          onChanged: ( _ ) {
            ref.read(permissionsProvider.notifier).requestLocationAccess();
          }
        ),

         CheckboxListTile(
          value: permissions.sensorsGranted,
          title: Text('Sensors', style: textStyle.titleMedium),
          subtitle: Text('${ permissions.sensors }'), 
          onChanged: ( _ ) {
            ref.read(permissionsProvider.notifier).requestSensorsAccess();
          }
        ),

        CheckboxListTile(
          value: showAds,
          title: Text('Mostrar Ads', style: textStyle.titleMedium),
          subtitle: const Text('Esta opción muestra y oculta ads'), 
          onChanged: ( _ ) {
            ref.read(showAdsProvider.notifier).toogleAds();
          }
        ),
        
      ],

    );
  }
}