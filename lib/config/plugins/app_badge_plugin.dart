import 'package:flutter_app_badger/flutter_app_badger.dart';

class AddBadgePlugin {

  static Future<bool> get isBadgeSupported {
    return FlutterAppBadger.isAppBadgeSupported();
  }

  static void updateBadgeCount(int count) async {

    if ( !await isBadgeSupported ) {
      print('Badge no soportado');
      return;
    }

    FlutterAppBadger.updateBadgeCount(count);

    if ( count == 0 ) removedBadge();

  }

  static void removedBadge() async {

    if ( !await isBadgeSupported ) {
      print('Badge no soportado');
      return;
    }

    FlutterAppBadger.removeBadge();
  }

}