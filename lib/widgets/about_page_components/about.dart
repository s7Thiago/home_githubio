import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home_githubio/model/Certification.dart';
import 'package:home_githubio/model/Experience.dart';
import 'package:home_githubio/model/Skill.dart';
import 'package:home_githubio/model/data/contents.dart';
import 'package:home_githubio/widgets/about_page_components/section.dart';
import 'package:home_githubio/widgets/about_page_components/section_divider.dart';
import 'package:home_githubio/widgets/expandable_section.dart';

class About extends StatelessWidget {
  Map<String, Object> data = Contents.texts;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Section.intro(introText: data['intro'] as String),
            SizedBox(height: 35),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Section.iconTitle(
                          'Trajetória',
                          iconTitleTrailing: Icon(
                            Icons.arrow_back_ios_rounded,
                          ),
                          showTitleDivider: true,
                        ),
                        // ExpandableSection(
                        //   title: 'This is a title',
                        //   content: 'It\'s a content for this section',
                        // ),
                        // ...List.generate(
                        //   5,
                        //   (index) {
                        //     final innerExperience =
                        //         (Contents.texts['experiences'] as List)[0]
                        //             as Experience;
                        //     return Section.experience(
                        //       innerExperience.title,
                        //       alignment: MainAxisAlignment.end,
                        //       content: innerExperience.description,
                        //       representations: innerExperience.representations,
                        //     );
                        //   },
                        // ),
                        ...List.generate(
                          (data['experiences'] as List<Experience>).length,
                          (index) {
                            final innerExperience =
                                (Contents.texts['experiences'] as List)[index]
                                    as Experience;
                            return ExpandableSection(
                              title: innerExperience.title,
                              content: innerExperience.description,
                              representations: innerExperience.representations,
                              customHeight: innerExperience.customHeight,
                            );
                          },
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                  // Colocar o divider pontilhado aqui nessa parte
                  SectionDivider(),
                  Expanded(
                    child: Column(
                      children: [
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
