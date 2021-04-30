import 'package:flutter/material.dart';
import 'package:home_githubio/pages/home/views/about/widgets/section/variations/certificate_section_variation.dart';
import 'package:home_githubio/pages/home/views/about/widgets/section/variations/experience_section_variation.dart';
import 'package:home_githubio/pages/home/views/about/widgets/section/variations/icon_title_section_variation.dart';
import 'package:home_githubio/pages/home/views/about/widgets/section/variations/intro_section_variation.dart';
import 'package:home_githubio/pages/home/views/about/widgets/section/variations/skill_section_variation.dart';
import 'package:home_githubio/pages/home/views/about/widgets/section/variations/title_section_variation.dart';

enum SectionType {
  INTRO,
  EXPERIENCE,
  CERTIFICATE,
  SKILL,
  EDUCATION,
  TITLE,
  ICON_TITLE,
  UNKNOWN,
}

// ignore: must_be_immutable
class Section extends StatelessWidget {
  late SectionType _sectionType;

  String? introText = '';
  String titleText = '';
  String content = '';
  String imageUrl = '';
  Widget? iconTitleLeading;
  Widget? iconTitleTrailing;
  List<Widget> representations = <Widget>[];
  MainAxisAlignment alignment = MainAxisAlignment.center;
  TextAlign textAlign = TextAlign.justify;
  bool showTitleDivider = false;
  double? marginStart = 0.0;

  Section.intro({
    this.introText = '',
    this.titleText = 'Intro',
    this.showTitleDivider = false,
  }) {
    this._sectionType = SectionType.INTRO;
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
    this._sectionType = SectionType.EXPERIENCE;
  }

  Section.certificate(
    this.titleText, {
    this.imageUrl = '',
    this.content = '',
    this.marginStart,
  }) {
    this._sectionType = SectionType.CERTIFICATE;
  }

  Section.skill({
    this.titleText = '',
    this.iconTitleLeading,
    this.iconTitleTrailing,
    this.marginStart,
  }) {
    this._sectionType = SectionType.SKILL;
  }

  Section.education();

  Section.title(
    this.titleText, {
    this.showTitleDivider = false,
  }) {
    this._sectionType = SectionType.TITLE;
  }

  Section.iconTitle(
    this.titleText, {
    this.iconTitleLeading,
    this.iconTitleTrailing,
    this.showTitleDivider = false,
    this.alignment = MainAxisAlignment.end,
  }) {
    this._sectionType = SectionType.ICON_TITLE;
  }

  @override
  Widget build(BuildContext context) {
    switch (_sectionType) {
      case SectionType.INTRO:
        return IntroSectionVariation(
          titleText: this.titleText,
          introText: this.introText!,
          showTitleDivider: this.showTitleDivider,
        );

      case SectionType.TITLE:
        return TitleSectionVariation(
          titleText: this.titleText,
          showTitleDivider: this.showTitleDivider,
        );

      case SectionType.ICON_TITLE:
        return IconTitleSectionVariation(
          titleText: titleText,
          introText: introText,
          iconTitleLeading: this.iconTitleLeading,
          iconTitleTrailing: this.iconTitleTrailing,
          alignment: this.alignment,
          showTitleDivider: this.showTitleDivider,
        );
      case SectionType.EXPERIENCE:
        return ExperienceSectionVariation(
          titleText: this.titleText,
          alignment: this.alignment,
          content: this.content,
          iconTitleLeading: this.iconTitleLeading,
          iconTitleTrailing: this.iconTitleTrailing,
          introText: this.introText,
          representations: this.representations,
          showTitleDivider: this.showTitleDivider,
          textAlign: this.textAlign,
        );
      case SectionType.CERTIFICATE:
        return CertificateSectionVariation(
          imageUrl: imageUrl,
          titleText: titleText,
          content: content,
          marginStart: this.marginStart,
        );
      case SectionType.SKILL:
        return SkillSectionVariation(
          titleText: titleText,
          iconTitleLeading: this.iconTitleLeading,
          iconTitleTrailing: this.iconTitleTrailing,
          marginStart: this.marginStart,
        );
      default:
        return Text(
          _sectionType.toString(),
          style: TextStyle(
            color: Colors.red,
            fontSize: 40,
          ),
        );
    }
  }
}
