
import 'package:share_plus/share_plus.dart';

class Shareplugin {

  static void shareLink( String link, String subject ) {
    Share.share( link, subject: subject );
  }

}