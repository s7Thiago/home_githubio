import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home_githubio/widgets/about_page_components/about.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: About(),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}

class AboutImagePreview extends StatelessWidget {
  const AboutImagePreview({
    Key key,
  }) : super(key: key);

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
