import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_githubio/model/Certification.dart';
import 'package:home_githubio/model/Experience.dart';
import 'package:home_githubio/model/Skill.dart';
import 'package:home_githubio/model/Education.dart';
import 'package:home_githubio/model/data/contents.dart';
import 'package:home_githubio/pages/home/views/about/widgets/section/expandable_section.dart';
import 'package:home_githubio/pages/home/views/about/widgets/section/section.dart';
import 'package:home_githubio/pages/home/views/about/widgets/section_divider.dart';

class AboutView extends StatelessWidget {
  final Map<String, Object> _data = Contents.texts;

  @override
  Widget build(BuildContext context) {
    final experiences = _data['experiences'] as List<Experience>;
    final education = _data['education'] as List<Education>;
    final certifications = _data['certifications'] as List<Certification>;
    final skills = _data['skills'] as List<Skill>;

    return SingleChildScrollView(
      child: Container(
        // color: AppColors.white,
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
                  // ! Trajetória
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
                            experiences.length,
                            (index) {
                              return ExpandableSection(
                                title: experiences[index].title,
                                content: experiences[index].description,
                                representations:
                                    experiences[index].representations,
                                customHeight: experiences[index].customHeight,
                              );
                            },
                          ).reversed,
                          // ! Educação
                          Section.iconTitle(
                            'Education',
                            iconTitleTrailing: Icon(
                              Icons.keyboard_arrow_left_sharp,
                            ),
                            showTitleDivider: true,
                            alignment: MainAxisAlignment.end,
                          ),
                          ...List.generate(education.length, (index) {
                            return Section.education(
                              introText: education[index].content,
                              iconTitleTrailing: education[index].trailing,
                              subtitleText: RichText(
                                text: TextSpan(
                                  text: education[index].subContentTitle,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                      text: education[index].subContentText,
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  ),
                  // Linha pontilhada vertical
                  SectionDivider(dotsCount: 120),
                  // ! Certificados e Habilidades
                  Expanded(
                    flex: 25,
                    child: SizedBox(
                      child: Column(
                        children: [
                          // ! Certificados
                          Section.iconTitle(
                            'Certificados',
                            iconTitleLeading: Icon(
                              Icons.contact_page,
                            ),
                            showTitleDivider: true,
                            alignment: MainAxisAlignment.start,
                          ),
                          ...List.generate(certifications.length, (index) {
                            return Section.certificate(
                              certifications[index].title,
                              content: certifications[index].credentialUrl,
                              imageUrl: certifications[index].image,
                            );
                          }).toList(),
                          // ! Habilidades
                          Section.iconTitle(
                            'Habilidades',
                            showTitleDivider: true,
                            alignment: MainAxisAlignment.start,
                            iconTitleLeading: Icon(Icons.access_alarms),
                          ),
                          ...List.generate(
                            skills.length,
                            (index) {
                              return Section.skill(
                                titleText: skills[index].title,
                                iconTitleLeading: CachedNetworkImage(
                                  imageUrl: skills[index].imageUrl,
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
