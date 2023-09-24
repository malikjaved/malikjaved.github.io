import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:potrtfolio/Model/Method.dart';
import 'package:potrtfolio/UI/FeatureProjectMobile.dart';
import 'package:potrtfolio/Widget/CustomText.dart';
import 'package:potrtfolio/Widget/MobileWorkBox.dart';

class MobileHome extends StatefulWidget {
  @override
  _MobileHomeState createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  ScrollController scrollController = ScrollController();

  Widget technology(BuildContext context, String text) {
    return Row(
      children: [
        Icon(
          Icons.check_box_outline_blank_sharp,
          color: Color(0xff64FFDA).withOpacity(0.6),
          size: 14.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.04,
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
    Method method = Method();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff0A192F),
      // endDrawer: Drawer(
      //     elevation: 6.0,
      //     child: Column(
      //       children: [
      //         UserAccountsDrawerHeader(
      //             currentAccountPicture: CircleAvatar(
      //               child: Icon(Icons.person),
      //             ),
      //             accountName: Text("Muhammad Javed Iqbal"),
      //             accountEmail: Text("its.iosdeveloper@gmail.com")),
      //         ListTile(
      //           title: Text("Share"),
      //           leading: Icon(Icons.share),
      //         ),
      //         ListTile(
      //           leading: Icon(Icons.group),
      //           title: Text("About"),
      //         ),
      //         Expanded(
      //           child: Text("Version 1.0.1"),
      //         )
      //       ],
      //     )),
      appBar: AppBar(
        backgroundColor: Color(0xff0A192F),
        elevation: 0.0,
        title: IconButton(
          icon: Icon(
            Icons.change_history,
            size: 32.0,
            color: Color(0xff64FFDA),
          ),
          onPressed: () {
            scrollController.animateTo(0,
                duration: Duration(milliseconds: 500), //duration of scroll
                curve: Curves.fastOutSlowIn //scroll type
                );
          },
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.08,
              ),

              CustomText(
                text: "Muhammad Javed Iqbal.",
                textsize: 40.0,
                color: Color(0xffCCD6F6),
                fontWeight: FontWeight.w900,
              ),
              SizedBox(
                height: 15.0,
              ),
              CustomText(
                text: "Expert mobile application developer (Flutter, iOS)",
                textsize: 22.0,
                color: Color(0xffCCD6F6).withOpacity(0.6),
                fontWeight: FontWeight.w700,
                letterSpacing: 2.75,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),

              //Image
              Center(
                child: Container(
                  height: size.height * 0.46,
                  //width: size.width * 0.7,
                  child: Card(
                    color: Colors.grey,
                    child: Container(
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/pp2.jpg"),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                color: Color(0xff64FFDA),
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(0.75),
                  height: 56.0,
                  //width: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Color(0xff0A192F),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      method.mailTo('its.iosdeveloper@gmail.com');
                    },
                    hoverColor: Colors.green,
                    child: Text(
                      "Get In Touch",
                      style: TextStyle(
                        color: Color(0xff64FFDA),
                        letterSpacing: 2.75,
                        wordSpacing: 1.0,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),

              //About me
              FittedBox(
                fit: BoxFit.cover,
                child: Container(
                  width: size.width,
                  //color: Colors.purple,
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
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Container(
                            width: size.width / 4,
                            height: 1.10,
                            color: Color(0xff303C55),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: size.height * 0.03,
                      ),

                      //About me desc
                      Wrap(
                        children: [
                          CustomText(
                            text:
                                "Hello and welcome! My name is Muhammad Javed Iqbal and I am a mobile application developer based in Pakistan, with 4+ years of experience in Flutter and 6 years in iOS. As a top-rated & full-time freelancer, I have worked with clients from different parts of the world, developing high-quality and user-friendly mobile applications across various industries, including learning & education, healthcare, finance, e-commerce, and social media.\n",
                            textsize: 16.0,
                            color: Color(0xff828DAA),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.75,
                          ),
                          CustomText(
                            text:
                                "I am passionate about staying up-to-date with the latest technology trends and constantly learning and improving my skills to provide my clients with the best possible solutions. If you are looking for a reliable and skilled mobile application developer who is dedicated to delivering high-quality work and exceptional customer service, then I would be thrilled to collaborate with you on your next project and help you bring your vision to life.\n\n",
                            textsize: 16.0,
                            color: Color(0xff828DAA),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.75,
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                          CustomText(
                            text:
                                "Here are a few technologies I've been working with recently:\n\n",
                            textsize: 16.0,
                            color: Color(0xff828DAA),
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.75,
                          ),
                        ],
                      ),

                      Container(
                        width: size.width,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                technology(context, "Dart"),
                                technology(context, "Flutter"),
                                technology(context, "iOS"),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                technology(context, "Swift"),
                                technology(context, "SwiftUI"),
                                technology(context, "ObjC"),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      CustomText(
                        text:
                            "Here are my specific mobile app development skills:\n\n",
                        textsize: 16.0,
                        color: Color(0xff828DAA),
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.75,
                      ),

                      Container(
                        width: size.width,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                technology(context, "Flutter app\ndevelopment"),
                                technology(context, "iOS app\ndevelopment"),
                                technology(context, "Responsive UI"),
                                technology(
                                    context, "Designing\ncustom widgets"),
                                technology(context, "BLoC,Provider,\nGetX"),
                                technology(context, "Firebase"),
                                technology(context, "Rest API\nintegration"),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                technology(context, "Animations"),
                                technology(context, "Push notifications"),
                                technology(context, "Localization"),
                                technology(context, "In-App\nsubscription"),
                                technology(context, "App distribution"),
                                technology(context,
                                    "Github,Bitbucket,\nGitLab,Codemagic"),
                                technology(context,
                                    "Slack,JIRA,ClickUp,\nMonday,Trello"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.08,
              ),

              //Where I've Worked title
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "02.",
                    textsize: 20.0,
                    color: Color(0xff61F9D5),
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  CustomText(
                    text: "Where I've Worked",
                    textsize: 26.0,
                    color: Color(0xffCCD6F6),
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Container(
                    width: size.width * 0.08,
                    height: 1.10,
                    color: Color(0xff303C55),
                  ),
                ],
              ),

              MobileWorkBox(),

              SizedBox(
                height: size.height * 0.07,
              ),

              //Some Things I've Built title
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "03.",
                    textsize: 20.0,
                    color: Color(0xff61F9D5),
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  CustomText(
                    text: "Some Things I've Built",
                    textsize: 26.0,
                    color: Color(0xffCCD6F6),
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Container(
                    width: size.width * 0.04,
                    height: 1.10,
                    color: Color(0xff303C55),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text:
                    "MOBILE APPLICATIONS EITHER DEVELOPED COMPLETELY BY ME OR BY A TEAM WHERE I PARTICIPATED SIGNIFICANTLY",
                textsize: 18.0,
                color: Color(0xffCCD6F6),
                fontWeight: FontWeight.w700,
                letterSpacing: 1.7,
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text:
                    "** I do not claim ownership of the projects below as some of them were developed for companies I worked for and some for clients/clients of my clients.",
                textsize: 15.0,
                color: Color(0xffCCD6F6),
                fontWeight: FontWeight.w700,
                letterSpacing: 1.7,
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              //1
              FeatureProjectMobile(
                imagePath: "assets/images/food_delivery.jpg",
                ontab: () {},
                projectDesc:
                    "A Mobile app for both Android and iOS developed using Flutter.",
                projectTitle: "eezly | Food Delivery App",
                skills: [
                  'Dart',
                  'Flutter',
                  'GetX',
                  'Firebase',
                  'Rest API',
                  'Push notifications',
                  'Multilanguage',
                  'Food delivery',
                  'Food ordering',
                  'Payment gateway integration',
                  'Customer app',
                  'Vendor app',
                  'Cross platform',
                  'iOS',
                  'Android'
                ],
              ),

              //2
              FeatureProjectMobile(
                imagePath: "assets/images/grocery_app.jpg",
                ontab: () {},
                projectDesc:
                    "A Mobile app for both Android and iOS developed using Flutter.",
                projectTitle: "eezly | Grocery App",
                skills: [
                  'Dart',
                  'Flutter',
                  'BLoC',
                  'Firebase',
                  'Rest API integration',
                  'Push notifications',
                  'Multilanguage',
                  'Grocery search',
                  'Comparison',
                  'In app subscription',
                  'Cross platform',
                  'iOS',
                  'Android'
                ],
              ),

              //3
              FeatureProjectMobile(
                imagePath: "assets/images/health_plus.jpg",
                ontab: () {},
                projectDesc:
                    "A Medical centers info & subscription based mobile app for both Android and IOS developed in Flutter",
                projectTitle: "Health Plus",
                skills: [
                  'Dart',
                  'Flutter',
                  'BLoC',
                  'Firebase',
                  'Rest API integration',
                  'Push notifications',
                  'Maps',
                  'In app search',
                  'In app subscription',
                  'Cross platform',
                  'iOS',
                  'Android'
                ],
              ),

              //4
              FeatureProjectMobile(
                imagePath: "assets/images/skoolpesa.jpg",
                ontab: () {},
                projectDesc:
                    "A school payment gateway mobile app for both Android and iOS developed using Flutter",
                projectTitle: "Skool Pesa",
                skills: [
                  'Dart',
                  'Flutter',
                  'BLoC',
                  'Rest API integration',
                  'Push notifications',
                  'Payment gateway',
                  'eWallet',
                  'Cross platform',
                  'iOS',
                  'Android'
                ],
              ),

              //5
              FeatureProjectMobile(
                imagePath: "assets/images/aphasia.jpg",
                ontab: () {},
                projectDesc:
                    "A kids learning & training mobile app for both Android and iOS developed using Flutter",
                projectTitle: "Aphasia - Kids learning app",
                skills: [
                  'Dart',
                  'Flutter',
                  'Provider',
                  'Firebase',
                  'TensorFlow',
                  'Machine Learning',
                  'Pattern / Line tracing',
                  'Games',
                  'In app subscription',
                  'Cross platform',
                  'iOS',
                  'Android'
                ],
              ),

              //6
              FeatureProjectMobile(
                imagePath: "assets/images/keech.jpg",
                ontab: () {},
                projectDesc:
                    "A fund raising charity mobile app for both Android and iOS developed using Flutter",
                projectTitle: "Keech Hospice Care App",
                skills: [
                  'Dart',
                  'Flutter',
                  'GetX / BLoC',
                  'Firebase',
                  'AR integration',
                  'Games',
                  'In app subscription',
                  'Cross platform',
                  'iOS',
                  'Android'
                ],
              ),

              //7
              FeatureProjectMobile(
                imagePath: "assets/images/mywarid.jpg",
                ontab: () {},
                projectDesc:
                    "A mobile app for a well-known former pakistan telecom brand called Warid that is now merged with Jazz developed using Swift iOS",
                projectTitle: "My Warid",
                skills: [
                  'iOS',
                  'Swift',
                  'Rest API integration',
                  'Maps',
                  'Packages',
                  'Subscriptions',
                  'Branding',
                  'eWallet',
                  'Notifications',
                  'Telecom',
                ],
              ),

              //8
              FeatureProjectMobile(
                imagePath: "assets/images/actifiiy.jpg",
                ontab: () {},
                projectDesc:
                    "A local social events mobile app developed for iOS using Swift.",
                projectTitle: "Actiify - Local Social Events",
                skills: [
                  'iOS',
                  'Swift',
                  'Firebase',
                  'Stripe',
                  'Push notifications'
                ],
              ),

              //9
              FeatureProjectMobile(
                imagePath: "assets/images/all_masajid.jpg",
                ontab: () {},
                projectDesc:
                    "An islamic mobile app developed for iOS using Swift. That displays prayer times, locate mosques, local events, qibla directions and more",
                projectTitle: "All Masajid",
                skills: [
                  'iOS',
                  'Swift',
                  'Rest API integration',
                  'Maps',
                  'Events',
                  'Directions',
                  'Locations',
                  'Notifications'
                ],
              ),

              //10
              FeatureProjectMobile(
                imagePath: "assets/images/moshpit.jpg",
                ontab: () {},
                projectDesc:
                    "A local social events app developed using Swift iOS. It offers to create videos and post them on the platform to view, like for others.",
                projectTitle: "Moshpit",
                skills: [
                  'iOS',
                  'Swift',
                  'Rest API Integration',
                  'Events',
                  'Video content',
                  'Community',
                  'Push notifications'
                ],
              ),

              //11
              FeatureProjectMobile(
                imagePath: "assets/images/skriply.jpg",
                ontab: () {},
                projectDesc:
                    "A news based mobile app developed using Swift iOS",
                projectTitle: "Skriply",
                skills: [
                  'iOS',
                  'Swift',
                  'Text reading',
                  'Audio',
                  'News',
                  'Subscription',
                ],
              ),

              //12
              FeatureProjectMobile(
                imagePath: "assets/images/chocolala.jpg",
                ontab: () {},
                projectDesc:
                    "An online food delivery mobile app developed using Swift iOS",
                projectTitle: "Chocolala",
                skills: [
                  'iOS',
                  'Swift',
                  'API integration',
                  'Payment gateway',
                  'Push notifications',
                  'Food ordering',
                  'Food delivery',
                ],
              ),

              // SizedBox(
              //   height: size.height * 0.006,
              // ),

              FittedBox(
                fit: BoxFit.cover,
                child: Container(
                  //height: size.aspectRatio,
                  width: size.width,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "0.4 What's Next?",
                            textsize: 16.0,
                            color: Color(0xff41FBDA),
                            letterSpacing: 3.0,
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          CustomText(
                            text: "Get In Touch",
                            textsize: 42.0,
                            color: Colors.white,
                            letterSpacing: 3.0,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Wrap(
                            children: [
                              Text(
                                "I'm always looking for the long-term and great projects/clients/opportunities.\nWhether you have a question or want to discuss a project, please send me an email or message!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.4),
                                  letterSpacing: 0.75,
                                  fontSize: 17.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 32.0,
                          ),
                          SizedBox(
                            width: 300,
                            height: 40,
                            child: Wrap(
                              spacing: 10,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.envelope,
                                  color: Color(0xffffA8B2D1),
                                ),
                                Text(
                                  'its.iosdeveloper@gmail.com',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.4),
                                    letterSpacing: 1.75,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            height: 40,
                            child: Wrap(
                              spacing: 10,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.phone,
                                  color: Color(0xffffA8B2D1),
                                ),
                                Text(
                                  '+923064488966',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.4),
                                    letterSpacing: 1.75,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            width: 300,
                            child: Wrap(
                              spacing: 10,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.skype,
                                  color: Color(0xffffA8B2D1),
                                ),
                                Text(
                                  'its.iosdeveloper87',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.4),
                                    letterSpacing: 1.75,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.03,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.stackOverflow),
                      color: Color(0xffffA8B2D1),
                      iconSize: 30.0,
                      onPressed: () {
                        method.launchURL(
                            "https://stackoverflow.com/users/2201647/javed-iqbal");
                      }),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.linkedin),
                    color: Color(0xffffA8B2D1),
                    onPressed: () {
                      method.launchURL(
                          "https://www.linkedin.com/in/muhammad-javed-iqbal-32491955/");
                    },
                    iconSize: 30.0,
                  ),
                  // IconButton(
                  //     icon: FaIcon(FontAwesomeIcons.facebook),
                  //     color: Color(0xffffA8B2D1),
                  //     iconSize: 30.0,
                  //     onPressed: () {
                  //       method.launchURL("https://www.facebook.com/javedcsiub");
                  //     }),
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.whatsapp),
                      color: Color(0xffffA8B2D1),
                      iconSize: 30.0,
                      onPressed: () {
                        method.phoneTo('+923064488966');
                      }),
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.phone),
                      color: Color(0xffffA8B2D1),
                      iconSize: 30.0,
                      onPressed: () {
                        method.phoneTo('+923064488966');
                      }),
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.envelope),
                      color: Color(0xffffA8B2D1),
                      iconSize: 30.0,
                      onPressed: () {
                        method.mailTo('its.iosdeveloper@gmail.com');
                      }),
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.github),
                      color: Color(0xffffA8B2D1),
                      iconSize: 30.0,
                      onPressed: () {
                        method.launchURL("https://github.com/malikjaved");
                      }),
                ],
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              // //Footer
              // Container(
              //   alignment: Alignment.center,
              //   height: MediaQuery.of(context).size.height / 6,
              //   width: MediaQuery.of(context).size.width,
              //   //color: Colors.white,
              //   child: Text(
              //     "Muhammad Javed Iqbal",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       color: Colors.white.withOpacity(0.4),
              //       letterSpacing: 1.75,
              //       fontSize: 14.0,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
