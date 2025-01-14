import 'package:url_launcher/url_launcher_string.dart';

class SocialMediaInfo {
  const SocialMediaInfo({
    required this.svgPath,
    required this.url,
  });

  final String svgPath;
  final String url;

  Future<void> onTap() async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }
  }
}
