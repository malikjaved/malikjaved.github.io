import 'package:flutter/material.dart';

import '/Widget/work_custom_data.dart';

class MobileWorkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WorkCustomData(
          title: "Senior Mobile Developer | Integra Scripts Pvt Ltd",
          subTitle:
              "Sole/full-stack developer for AI-powered healthcare platforms.",
          duration: "Mar - 2025 to Present",
        ),
        SizedBox(
          height: 20,
        ),
        WorkCustomData(
          title: "eezly Technologies PVT ltd (Montreal, Canada)",
          subTitle: "Lead Flutter Developer (Contractor)",
          duration: "Oct - 2021 to Feb - 2025",
        ),
        SizedBox(
          height: 20,
        ),
        WorkCustomData(
          title: "AiSolve PVT ltd (Luton, UK)",
          subTitle: "Flutter Developer (Contractor)",
          duration: "Apr - 2018 to Sep - 2021",
        ),
        SizedBox(
          height: 20,
        ),
        WorkCustomData(
          title: "Enigmatix Solutions (Bahawalpur, Pakistan)",
          subTitle: "Mobile Application Developer (Contractor: iOS & Flutter)",
          duration: "Mar - 2016 to Mar - 2018",
        ),
        SizedBox(
          height: 20,
        ),
        WorkCustomData(
          title: "Radius Interactive (Lahore, Pakistan)",
          subTitle: "iOS Developer",
          duration: "Nov 2013 - Mar 2016",
        ),
        SizedBox(
          height: 20,
        ),
        WorkCustomData(
          title: "Software Weaver (Pakistan, Australia)",
          subTitle: "iOS Developer",
          duration: "Sep - 2012 to Oct 2013",
        ),
      ],
    );
  }
}
