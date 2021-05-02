import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CertificateSectionVariation extends StatelessWidget {
  final String imageUrl;
  final double? marginStart;
  final String titleText;
  final String content;

  const CertificateSectionVariation({
    required this.imageUrl,
    this.marginStart,
    required this.titleText,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: marginStart ?? 50),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: ListTile(
          leading: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            width: 40,
          ),
          title: Text(
            titleText,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(content),
        ),
      ),
    );
  }
}
