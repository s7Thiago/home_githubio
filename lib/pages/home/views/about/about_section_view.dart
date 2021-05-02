import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home_githubio/pages/home/views/about/about_view.dart';

class AboutSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AboutView(),
      backgroundColor: Colors.white,
    );
  }
}

class AboutImageView extends StatelessWidget {
  const AboutImageView();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://raw.githubusercontent.com/s7Thiago/home_githubio/master/assets/documents/resume.png',
                progressIndicatorBuilder: (context, url, progress) {
                  return Center(
                    child: LinearProgressIndicator(
                      value: progress.progress,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
