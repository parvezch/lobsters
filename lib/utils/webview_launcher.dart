import "package:url_launcher/url_launcher.dart";

void launchWebview(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw 'Could not launch $uri';
  }
}
