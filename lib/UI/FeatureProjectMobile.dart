import 'package:flutter/material.dart';

import '../Widget/CustomText.dart';

class FeatureProjectMobile extends StatelessWidget {
  final String imagePath;
  final String projectTitle;
  final String projectDesc;
  final List<String> skills;
  final Function ontab;

  FeatureProjectMobile({
    required this.imagePath,
    required this.ontab,
    required this.projectDesc,
    required this.projectTitle,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Project Tiitle
        CustomText(
          text: projectTitle,
          textsize: 27,
          color: Colors.grey,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.75,
        ),
        SizedBox(
          height: 10,
        ),
        // Short Desc
        Container(
          alignment: Alignment.center,
          height: size.height * 0.13,
          color: Color(0xff172A45),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomText(
                  text: projectDesc,
                  textsize: 16.0,
                  color: Colors.white.withOpacity(0.6),
                  letterSpacing: 0.75,
                ),
              ),
            ],
          ),
        ),

        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        // Project Resources
        Wrap(
          spacing: 0,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: skills.map(
            (e) {
              return Card(
                color: Colors.teal,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  child: CustomText(
                    text: e,
                    textsize: 14,
                    color: Colors.white,
                    letterSpacing: 1.75,
                  ),
                ),
              );
            },
          ).toList(),
        ),

        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
