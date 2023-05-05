import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Method {
  launchURL(String link) async {
    var url = link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> mailTo(
    String email, {
    String subject = '',
    String message = '',
  }) async {
    String url = 'mailto:$email?subject=$subject&body=$message';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      debugPrint('Couldn\'t send email');
    }
  }

  Future<void> openWebPage(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      debugPrint('Couldn\'t open web page');
    }
  }

  Future<void> phoneTo(String phoneNumber) async {
    final url = 'tel:$phoneNumber';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      debugPrint('Couldn\'t make phone call');
    }
  }

  Future<void> whatsappTo(String phoneNumber) async {
    final urlAndroid = 'whatsapp://send?phone=$phoneNumber';
    final urlIOS = 'https://wa.me/$phoneNumber';

    if (Platform.isIOS) {
      if (await canLaunch(urlIOS)) {
        await launch(urlIOS);
      }
    } else {
      if (await canLaunch(urlAndroid)) {
        await launch(urlAndroid);
      }
    }
  }
}
