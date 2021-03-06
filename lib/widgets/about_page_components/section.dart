import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../app/styles.dart';

// ignore: must_be_immutable
class Section extends StatelessWidget {
  String type = 'undefined';

  String introText = '';
  String titleText = '';
  String content = '';
  String imageUrl = '';
  Widget iconTitleLeading;
  Widget iconTitleTrailing;
  List<Widget> representations = <Widget>[];
  MainAxisAlignment alignment = MainAxisAlignment.center;
  TextAlign textAlign = TextAlign.justify;
  bool showTitleDivider = false;
  double marginStart = 0.0;

  Section.intro({
    this.introText = '',
    this.titleText = 'Intro',
    this.showTitleDivider = false,
  }) {
    type = 'intro';
  }

  Section.experience(
    this.titleText, {
    this.iconTitleLeading,
    this.iconTitleTrailing,
    this.showTitleDivider = false,
    this.textAlign = TextAlign.right,
    this.alignment = MainAxisAlignment.end,
    this.content = 'No content',
    this.representations = const <Widget>[],
  }) {
    this.type = 'experience';
  }

  Section.certificate(
    this.titleText, {
    this.imageUrl = '',
    this.content = '',
    this.marginStart,
  }) {
    this.type = 'certificate';
  }

  Section.skill({
    this.titleText = '',
    this.iconTitleLeading,
    this.iconTitleTrailing,
    this.marginStart,
  }) {
    this.type = 'skill';
  }

  Section.education();

  Section.title(
    this.titleText, {
    this.showTitleDivider = false,
  }) {
    type = 'title';
  }

  Section.iconTitle(
    this.titleText, {
    this.iconTitleLeading,
    this.iconTitleTrailing,
    this.showTitleDivider = false,
    this.alignment = MainAxisAlignment.end,
  }) {
    type = 'iconTitle';
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 'intro':
        return Container(
          width: MediaQuery.of(context).size.width * .27,
          child: Column(
            children: [
              Section.title(
                titleText,
                showTitleDivider: showTitleDivider,
              ),
              SelectableText(
                introText,
                textAlign: TextAlign.center,
                showCursor: false,
              ),
            ],
          ),
        );

      case 'title':
        return Column(
          children: [
            Text(
              titleText,
              textAlign: TextAlign.center,
              style: AppStyles.introTextStyle,
            ),
            showTitleDivider ? Divider() : Container(),
          ],
        );
      case 'iconTitle':
        return Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.symmetric(vertical: showTitleDivider ? 16 : 12),
          width: MediaQuery.of(context).size.width * .2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: alignment,
                children: [
                  iconTitleLeading ?? Container(),
                  iconTitleLeading == null ? SizedBox() : SizedBox(width: 10),
                  Section.title(titleText),
                  iconTitleTrailing == null ? SizedBox() : SizedBox(width: 10),
                  iconTitleTrailing ?? Container(),
                ],
              ),
              // Divider
              Container(
                width: double.infinity,
                height: showTitleDivider ? .5 : 0,
                color: Colors.grey,
              )
            ],
          ),
        );
      case 'experience':
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 10,
                child: Column(
                  children: [
                    Section.iconTitle(
                      titleText,
                      alignment: alignment,
                      iconTitleLeading: iconTitleLeading,
                      iconTitleTrailing: iconTitleTrailing,
                      showTitleDivider: showTitleDivider,
                    ),
                    Padding(
                      padding: representations.length > 0
                          // Caso haja representações, a margem é apenas na esquerda
                          ? const EdgeInsets.only(left: 50)
                          :
                          // Caso não haja representações, a margem esquerda é maior
                          const EdgeInsets.only(
                              left: 70,
                              right: 50,
                            ),
                      child: SelectableText(
                        content,
                        textAlign: textAlign,
                      ),
                    )
                  ],
                ),
              ),
              // Neste ponto, são mostradas as imagens de representação para cada experiencia
              representations.length > 0
                  ? Expanded(
                      flex: 1,
                      child: IconTheme(
                        data: IconThemeData(
                          color: Colors.grey.withOpacity(.5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [...representations],
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        );
      case 'certificate':
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
      case 'skill':
        return Padding(
          padding: EdgeInsets.only(left: marginStart ?? 75, bottom: 20),
          child: Row(
            children: [
              iconTitleLeading ?? Container(),
              SizedBox(width: 10),
              Text(titleText),
              SizedBox(width: iconTitleTrailing == null ? 0 : 16),
              iconTitleTrailing ?? Container(),
            ],
          ),
        );
      default:
        return Text(
          type,
          style: TextStyle(
            color: Colors.red,
            fontSize: 40,
          ),
        );
    }
  }
}
