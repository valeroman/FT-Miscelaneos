

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/plugins/shared_preference_plugin.dart';


const storeKey = 'showAds';

class ShowAdsNotifier extends StateNotifier<bool> {

  ShowAdsNotifier(): super(false) {
    checkAdsState();
  }

  void checkAdsState() async {
    state = await SharedPreferencesPlugin.getBool(storeKey) ?? true;
  } 

  void removeAds() {
    SharedPreferencesPlugin.setBool(storeKey, false);
    state = false;
  }

  void showAds() {
    SharedPreferencesPlugin.setBool(storeKey, true);
    state = true;
  }

  void toogleAds() {
    state ? removeAds() : showAds();
  }
}

final showAdsProvider = StateNotifierProvider<ShowAdsNotifier, bool>((ref) {
  return ShowAdsNotifier();
});