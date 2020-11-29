import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
