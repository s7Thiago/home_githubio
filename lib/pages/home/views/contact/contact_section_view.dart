import 'package:flutter/material.dart';
import 'package:home_githubio/core/styles/styles.dart';

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
