import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class Method {
  Future<void> launchURL(String link) async {
    final uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $link');
    }
  }

  Future<void> mailTo(
    String email, {
    String subject = '',
    String message = '',
  }) async {
    final uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        if (subject.isNotEmpty) 'subject': subject,
        if (message.isNotEmpty) 'body': message,
      },
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('Couldn\'t send email');
    }
  }

  Future<void> openWebPage(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Couldn\'t open web page');
    }
  }

  Future<void> phoneTo(String phoneNumber) async {
    final uri = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('Couldn\'t make phone call');
    }
  }

  Future<void> whatsappTo(String phoneNumber) async {
    final uri = kIsWeb
        ? Uri.parse('https://wa.me/$phoneNumber')
        : Uri.parse('whatsapp://send?phone=$phoneNumber');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
