import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

void main() async {

  //! Bloquear la orientacion del telefono para que sea siempre portrait
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  //! Inicializar el Admob
  await AdmobPlugin.initialize();

  //* registrar el quick actions
  QuickActionPlugin.registerActions();


  runApp( const ProviderScope(child: MainApp()));
}
//* Cambiamos a un StatefulWidget -> ConsumerStatefulWidget
class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

//* Agregamos un WidgetsBindingObserver, el cual nos permite estar observando
//* la instancia de la aplicación, usando el override del initState y del dispose
//* agregamos un observador con el WidgetsBinding

class MainAppState extends ConsumerState<MainApp> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    ref.read( permissionsProvider.notifier ).checkPermissions();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  //* El state nos va a decir como se encuentra la aplicación, esta cambiando el estado
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    ref.watch(appStateProvider.notifier).state = state;

    if ( state == AppLifecycleState.resumed ) {
      ref.read( permissionsProvider.notifier ).checkPermissions();
    }
    
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
