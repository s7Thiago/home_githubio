import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home_githubio/core/styles/app_colors.dart';
import 'package:home_githubio/model/Certification.dart';
import 'package:home_githubio/model/Experience.dart';
import 'package:home_githubio/model/Skill.dart';
import 'package:home_githubio/model/data/contents.dart';
import 'package:home_githubio/pages/home/views/about/widgets/section/expandable_section.dart';
import 'package:home_githubio/pages/home/views/about/widgets/section/section.dart';
import 'package:home_githubio/pages/home/views/about/widgets/section_divider.dart';

class AboutView extends StatelessWidget {
  final Map<String, Object> _data = Contents.texts;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.white,
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          children: [
            SizedBox(height: 50),
            Section.intro(introText: _data['intro'] as String?),
            SizedBox(height: 35),
            Expanded(
              child: Row(
                children: [
                  // Trajetória
                  Expanded(
                    flex: 25,
                    child: Container(
                      // color: Colors.amber,
                      child: Column(
                        children: [
                          Section.iconTitle(
                            'Trajetória',
                            iconTitleTrailing: Icon(
                              Icons.keyboard_arrow_left_sharp,
                            ),
                            showTitleDivider: true,
                            alignment: MainAxisAlignment.end,
                          ),
                          ...List.generate(
                            (_data['experiences'] as List<Experience>).length,
                            (index) {
                              final innerExperience =
                                  (Contents.texts['experiences'] as List)[index]
                                      as Experience;
                              return ExpandableSection(
                                title: innerExperience.title,
                                content: innerExperience.description,
                                representations:
                                    innerExperience.representations,
                                customHeight: innerExperience.customHeight,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  // Linha pontilhada vertical
                  SectionDivider(dotsCount: 40),
                  // Certificados e Habilidades
                  Expanded(
                    flex: 25,
                    child: Container(
                      // color: Colors.blueGrey,
                      child: Column(
                        children: [
                          // * Certificados
                          Section.iconTitle(
                            'Certificados',
                            iconTitleLeading: Icon(
                              Icons.contact_page,
                            ),
                            showTitleDivider: true,
                            alignment: MainAxisAlignment.start,
                          ),
                          ...List.generate(2, (index) {
                            final innerCertificate =
                                (Contents.texts['certifications']
                                    as List<Certification>)[0];

                            return Section.certificate(
                              innerCertificate.title,
                              content: innerCertificate.credentialUrl,
                              imageUrl: innerCertificate.image,
                            );
                          }).toList(),
                          // * Habilidades
                          Section.iconTitle(
                            'Habilidades',
                            showTitleDivider: true,
                            alignment: MainAxisAlignment.start,
                            iconTitleLeading: Icon(Icons.access_alarms),
                          ),
                          ...List.generate(
                            5,
                            (index) {
                              final innerSkill = ((Contents.texts['skills']
                                  as List)[0]) as Skill;

                              return Section.skill(
                                titleText: innerSkill.title,
                                iconTitleLeading: CachedNetworkImage(
                                  imageUrl: innerSkill.imageUrl,
                                  width: 14,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ).toList(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
