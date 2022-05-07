import 'package:share_plus/share_plus.dart';

class ShareContent {
  static dynamic shareUrl(dynamic content) async {
    await Share.share(content);
  }
}
