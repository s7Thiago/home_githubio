import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_githubio/app/styles/styles.dart';
import 'package:home_githubio/app/utils/functions.dart';

class ContactSectionView extends StatelessWidget {
  _openSquareQrCode(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        fullscreenDialog: false,
        maintainState: true,
        transitionDuration: Duration(milliseconds: 550), //550
        barrierDismissible: true,
        barrierColor: Colors.white.withOpacity(.95),
        pageBuilder: (ctx, _, __) {
          return Center(
            child: _SquareQrCode(),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Hero(
      tag: 'qr-code',
      transitionOnUserGestures: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => _openSquareQrCode(context),
            child: Image.asset(
              'assets/images/qr-code-contact.png',
              scale: 4,
              fit: BoxFit.cover,
            ),
          ),
          Material(
            child: Text(
              'Full contact qr-code'.toUpperCase(),
              style: AppStyles.qrCodeToolTip,
            ),
          ),
          Container(
            height: 200,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: (size.width / 2) * .33),
                _ContactButton(
                  icon: FontAwesomeIcons.linkedin,
                  url: 'https://www.linkedin.com/in/s7thiago/',
                ),
                _ContactButton(
                  icon: FontAwesomeIcons.gitAlt,
                  url: 'https://github.com/s7Thiago',
                ),
                _ContactButton(
                  icon: FontAwesomeIcons.solidEnvelope,
                  onTap: () => AppFunctions.sendEmail(
                    'euthiagosilva@protonmail.com',
                  ),
                ),
                SizedBox(width: (size.width / 2) * .33),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SquareQrCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(.6),
        body: Hero(
          tag: 'qr-code',
          transitionOnUserGestures: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 50),
              Material(
                child: Text(
                  'Full contact qr-code'.toUpperCase(),
                  style: AppStyles.qrCodeToolTip
                      .copyWith(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/qr-code-contact-square.png',
                  scale: 1,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactButton extends StatelessWidget {
  final IconData icon;
  final String url;
  final VoidCallback? onTap;

  const _ContactButton({
    Key? key,
    required this.icon,
    this.url = 'https://www.google.com/',
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => AppFunctions.launchInWebViewWithJavaScript(url),
      child: Transform.scale(
        scale: 1.5,
        child: FaIcon(icon),
      ),
    );
  }
}
