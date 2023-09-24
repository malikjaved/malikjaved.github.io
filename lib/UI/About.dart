import 'package:flutter/material.dart';
import 'package:potrtfolio/Widget/CustomText.dart';

class About extends StatelessWidget {
  Widget technology(BuildContext context, String text) {
    return Row(
      children: [
        Icon(
          Icons.skip_next,
          color: Color(0xff64FFDA).withOpacity(0.6),
          size: 14.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        Text(
          text,
          style: TextStyle(
            color: Color(0xff717C99),
            letterSpacing: 1.75,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width - 100,
      child: Row(
        children: [
          //About me
          Container(
            height: size.height * 0.9,
            width: size.width / 2 - 100,
            child: Column(
              children: [
                //About me title
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "01.",
                      textsize: 20.0,
                      color: Color(0xff61F9D5),
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    CustomText(
                      text: "About Me",
                      textsize: 26.0,
                      color: Color(0xffCCD6F6),
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    Container(
                      width: size.width / 4,
                      height: 1.10,
                      color: Color(0xff303C55),
                    ),
                  ],
                ),

                SizedBox(
                  height: size.height * 0.07,
                ),

                //About me desc
                Wrap(
                  children: [
                    CustomText(
                      text:
                          "Hello and welcome! My name is Muhammad Javed Iqbal and I am a mobile application developer based in Pakistan, with 4+ years of experience in Flutter and 6 years in iOS. As a top-rated & full-time freelancer, I have worked with clients from different parts of the world, developing high-quality and user-friendly mobile applications across various industries, including learning & education, healthcare, finance, e-commerce, and social media.\n\n",
                      textsize: 16.0,
                      color: Color(0xff828DAA),
                      letterSpacing: 0.75,
                    ),
                    CustomText(
                      text:
                          "I am passionate about staying up-to-date with the latest technology trends and constantly learning and improving my skills to provide my clients with the best possible solutions. If you are looking for a reliable and skilled mobile application developer who is dedicated to delivering high-quality work and exceptional customer service, then I would be thrilled to collaborate with you on your next project and help you bring your vision to life.\n\n",
                      textsize: 16.0,
                      color: Color(0xff828DAA),
                      letterSpacing: 0.75,
                    ),
                    CustomText(
                      text:
                          "Here are a few technologies I've been working with recently:\n\n",
                      textsize: 16.0,
                      color: Color(0xff828DAA),
                      // fontWeight: FontWeight.w500,
                      letterSpacing: 0.75,
                    ),
                  ],
                ),

                Container(
                  height: size.height * 0.15,
                  width: size.width,
                  child: Wrap(
                    children: [
                      Container(
                        width: size.width * 0.20,
                        height: size.height * 0.15,
                        child: Column(
                          children: [
                            technology(context, "Dart"),
                            technology(context, "Flutter"),
                            technology(context, "iOS"),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.15,
                        height: size.height * 0.15,
                        child: Column(
                          children: [
                            technology(context, "Swift"),
                            technology(context, "SwiftUI"),
                            technology(context, "ObjC"),
                          ],
                        ),
                      ),
                      CustomText(
                        text:
                            "Here are my specific mobile app development skills:\n\n",
                        textsize: 16.0,
                        color: Color(0xff828DAA),
                        letterSpacing: 0.75,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: size.height * 0.07,
                ),

                //Skill set
                Container(
                  height: size.height * 0.15,
                  width: size.width,
                  child: Wrap(
                    children: [
                      Container(
                        width: size.width * 0.20,
                        height: size.height * 0.15,
                        child: Column(
                          children: [
                            technology(context, "Flutter app development"),
                            technology(context, "iOS app development"),
                            technology(context, "Responsive UI"),
                            technology(context, "Designing custom widgets"),
                            technology(context, "BLoC,Provider,GetX"),
                            technology(context, "Firebase"),
                            technology(context, "Rest API integration"),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.2,
                        height: size.height * 0.15,
                        child: Column(
                          children: [
                            technology(context, "Animations"),
                            technology(context, "Push notifications"),
                            technology(context, "Localization"),
                            technology(context, "In-App subscription"),
                            technology(context, "App distribution"),
                            technology(
                                context, "Github,Bitbucket,GitLab,Codemagic"),
                            technology(
                                context, "Slack,JIRA,ClickUp,Monday,Trello"),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          //Profile Image
          Expanded(
            child: Container(
              height: size.height / 1.5,
              width: size.width / 2 - 100,
              // color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: size.height * 0.12,
                    left: size.width * 0.120,
                    child: Card(
                      color: Color(0xff61F9D5),
                      child: Container(
                        margin: EdgeInsets.all(2.75),
                        height: size.height / 2,
                        width: size.width / 5,
                        color: Color(0xff0A192F),
                      ),
                    ),
                  ),
                  CustomImageAnimation()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomImageAnimation extends StatefulWidget {
  CustomImageAnimation({Key? key}) : super(key: key);

  @override
  _CustomImageAnimationState createState() => _CustomImageAnimationState();
}

class _CustomImageAnimationState extends State<CustomImageAnimation> {
  Color customImageColor = Color(0xff61F9D5).withOpacity(0.5);
  // ignore: unused_field
  int _enterCounter = 0;
  // ignore: unused_field
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      _enterCounter++;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      customImageColor = Color(0xff61F9D5).withOpacity(0.5);
      _exitCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      customImageColor = Colors.transparent;
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // return MouseRegion(
    //   onEnter: _incrementEnter,
    //   onHover: _updateLocation,
    //   onExit: _incrementExit,
    //   child: Stack(
    //     children: [
    //       Container(
    //         height: size.height / 2,
    //         width: size.width / 5,
    //         color: Colors.black54,
    //         child: Image(
    //           fit: BoxFit.cover,
    //           image: AssetImage("images/pp2.jpg"),
    //         ),
    //       ),
    //       Container(
    //         height: size.height / 2,
    //         width: size.width / 5,
    //         color: customImageColor,
    //       ),
    //     ],
    //   ),
    // );

    return Stack(
      children: [
        Container(
          height: size.height / 2,
          width: size.width / 5,
          color: Colors.black54,
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage("images/pp2.jpg"),
          ),
        ),
        Container(
          height: size.height / 2,
          width: size.width / 5,
          color: Colors.transparent,
        ),
      ],
    );
  }
}
