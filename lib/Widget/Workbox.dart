import 'package:flutter/material.dart';

import '/Widget/work_custom_data.dart';

class WorkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WorkCustomData(
          title: "Full time & top-rated freelancer on Upwork",
          subTitle:
              "Flutter Developer, iOS Developer, Contract/Part Time/Full Time/Remote",
          duration: "May - 2022 to Present",
        ),
        WorkCustomData(
          title: "eezly Technologies PVT ltd (Montreal, Canada)",
          subTitle: "Lead Flutter Developer (Contractor)",
          duration: "Dec - 2020 to May - 2022",
        ),
        WorkCustomData(
          title: "AiSolve PVT ltd (Luton, UK)",
          subTitle: "Flutter Developer (Contractor)",
          duration: "Mar - 2020 to Apr - 2022",
        ),
        WorkCustomData(
          title: "Enigmatix Solutions (Bahawalpur, Pakistan)",
          subTitle: "Mobile Application Developer (Contractor: iOS & Flutter)",
          duration: "Mar - 2016 to Mar - 2020",
        ),
        WorkCustomData(
          title: "Radius Interactive (Lahore, Pakistan)",
          subTitle: "iOS Developer",
          duration: "Nov 2013 - Mar 2016",
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
