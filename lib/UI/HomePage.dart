import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '/Model/Method.dart';
import '/UI/About.dart';
import '/UI/FeatureProject.dart';
import '/UI/Work.dart';
import '/Widget/AppBarTitle.dart';
import '/Widget/CustomText.dart';
import '/Widget/MainTiitle.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Method method = Method();
  late AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpaned = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
        () => _isAppBarExpanded
            ? isExpaned != false
                ? setState(
                    () {
                      isExpaned = false;
                      //print('setState is called');
                    },
                  )
                : {}
            : isExpaned != true
                ? setState(() {
                    //print('setState is called');
                    isExpaned = true;
                  })
                : {},
      );
    super.initState();
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({required int index, required Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff0A192F),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          primary: true,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //Navigation Bar
              Container(
                height: size.height * 0.14,
                width: size.width,
                //color: Colors.grey[100],
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 44,
                        backgroundImage: AssetImage(
                          "assets/images/pp2.jpg",
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DefaultTabController(
                            length: 4,
                            child: TabBar(
                              indicatorColor: Colors.transparent,
                              onTap: (index) async {
                                _scrollToIndex(index);
                              },
                              tabs: [
                                Tab(
                                  child: AppBarTitle(
                                    text: 'About',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Experience',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Projects',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Contact Me',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Card(
                          elevation: 4.0,
                          color: Color(0xff64FFDA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(0.85),
                            height: size.height * 0.07,
                            width: size.height * 0.20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xff0A192F),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: TextButton(
                              onPressed: () {
                                method.launchURL(
                                    "https://docs.google.com/document/d/1YiuyK8fAYzpJEPBjQHyiJBKL166xQmLQ/edit?usp=share_link&ouid=100063593127660478650&rtpof=true&sd=true");
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Text(
                                  "Resume",
                                  style: TextStyle(
                                    color: Color(0xff64FFDA),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Row(
                children: [
                  //Social Icon
                  Container(
                    width: size.width * 0.09,
                    height: size.height - 82,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
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
                                "https://www.linkedin.com/in/javediqbal-lead-mobile-dev/");
                          },
                          iconSize: 30.0,
                        ),
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
                              method.mailTo('javedcsiub@gmail.com');
                            }),
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.github),
                            color: Color(0xffffA8B2D1),
                            iconSize: 30.0,
                            onPressed: () {
                              method.launchURL("https://github.com/malikjaved");
                            }),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            height: size.height * 0.20,
                            width: 2,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: size.height - 82,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomScrollView(
                          controller: _autoScrollController,
                          slivers: <Widget>[
                            SliverList(
                                delegate: SliverChildListDelegate([
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: size.height * .06,
                                  ),
                                  // CustomText(
                                  //   text: "Hi, my name is",
                                  //   textsize: 16.0,
                                  //   color: Color(0xff41FBDA),
                                  //   letterSpacing: 3.0,
                                  // ),
                                  // SizedBox(
                                  //   height: 6.0,
                                  // ),
                                  CustomText(
                                    text: "Muhammad Javed Iqbal.",
                                    textsize: 68.0,
                                    color: Color(0xffCCD6F6),
                                    fontWeight: FontWeight.w900,
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  CustomText(
                                    text:
                                        "Expert mobile application developer (Flutter, iOS)",
                                    textsize: 30.0,
                                    color: Color(0xffCCD6F6).withOpacity(0.6),
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2.75,
                                  ),
                                  // SizedBox(
                                  //   height: size.height * .04,
                                  // ),
                                  // Wrap(
                                  //   children: [
                                  //     Text(
                                  //       "I'm a freelancer based in Nashik, IN specializing in \nbuilding (and occasionally designing) exceptional websites, \napplications, and everything in between.",
                                  //       style: TextStyle(
                                  //         color: Colors.grey,
                                  //         fontSize: 16.0,
                                  //         letterSpacing: 2.75,
                                  //         wordSpacing: 0.75,
                                  //       ),
                                  //     )
                                  //   ],
                                  // ),
                                  SizedBox(
                                    height: size.height * .12,
                                  ),

                                  //get in tuch text
                                  InkWell(
                                    onTap: () {
                                      method.mailTo('javedcsiub@gmail.com');
                                    },
                                    hoverColor:
                                        Color(0xff64FFDA).withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: size.height * 0.09,
                                      width: size.width * 0.14,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xff64FFDA),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
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

                                  // SizedBox(
                                  //   height: size.height * 0.20,
                                  // ),

                                  SizedBox(
                                    height: size.height * 0.08,
                                  ),
                                ],
                              ),

                              //About Me
                              _wrapScrollTag(
                                index: 0,
                                child: About(),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),

                              //Where I've Worked
                              _wrapScrollTag(index: 1, child: Work()),
                              SizedBox(
                                height: size.height * 0.10,
                              ),

                              //Some Things I've Built Main Project
                              _wrapScrollTag(
                                  index: 2,
                                  child: Column(
                                    children: [
                                      MainTiitle(
                                        number: "0.3",
                                        text: "Some Things I've Built",
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
                                            "I do not claim ownership of the projects below as some of them were developed for companies I worked for and some for clients/clients of my clients.",
                                        textsize: 15.0,
                                        color: Color(0xffCCD6F6),
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1.7,
                                      ),

                                      SizedBox(
                                        height: size.height * 0.04,
                                      ),

                                      //1
                                      FeatureProject(
                                        imagePath:
                                            "assets/images/food_delivery.png",
                                        ontab: () {},
                                        projectDesc:
                                            "A Mobile app for both Android and iOS developed using Flutter.",
                                        projectTitle:
                                            "eezly | Food Delivery App",
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
                                          'Android',
                                        ],
                                      ),

                                      //2
                                      FeatureProject(
                                        imagePath:
                                            "assets/images/grocery_app.png",
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
                                      FeatureProject(
                                        imagePath:
                                            "assets/images/health_plus.png",
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
                                      FeatureProject(
                                        imagePath:
                                            "assets/images/skoolpesa.png",
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
                                      FeatureProject(
                                        imagePath: "assets/images/aphasia.png",
                                        ontab: () {},
                                        projectDesc:
                                            "A kids learning & training mobile app for both Android and iOS developed using Flutter",
                                        projectTitle:
                                            "Aphasia - Kids learning app",
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
                                      FeatureProject(
                                        imagePath: "assets/images/keech.png",
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
                                      FeatureProject(
                                        imagePath: "assets/images/mywarid.png",
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
                                      FeatureProject(
                                        imagePath: "assets/images/actifiiy.png",
                                        ontab: () {},
                                        projectDesc:
                                            "A local social events mobile app developed for iOS using Swift.",
                                        projectTitle:
                                            "Actiify - Local Social Events",
                                        skills: [
                                          'iOS',
                                          'Swift',
                                          'Firebase',
                                          'Stripe',
                                          'Push notifications'
                                        ],
                                      ),

                                      //9
                                      FeatureProject(
                                        imagePath:
                                            "assets/images/all_masajid.png",
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
                                      FeatureProject(
                                        imagePath: "assets/images/moshpit.png",
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
                                      FeatureProject(
                                        imagePath: "assets/images/skriply.png",
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
                                      FeatureProject(
                                        imagePath:
                                            "assets/images/chocolala.png",
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

                                      // MainTiitle(
                                      //   number: "0.4",
                                      //   text: "Open Source Project",
                                      // ),

                                      // SizedBox(
                                      //   height: size.height * 0.04,
                                      // ),

                                      // //other Projects
                                      // Container(
                                      //   height: size.height * 0.86,
                                      //   width: size.width - 100,
                                      //   child: Column(
                                      //     children: [
                                      //       Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceAround,
                                      //         children: [
                                      //           OSImages(
                                      //             image: "assets/images/pic101.png",
                                      //           ),
                                      //           OSImages(
                                      //             image: "assets/images/pic103.png",
                                      //           ),
                                      //           OSImages(
                                      //             image: "assets/images/pic111.gif",
                                      //           ),
                                      //           OSImages(
                                      //             image: "assets/images/pic113.jfif",
                                      //           ),
                                      //         ],
                                      //       ),
                                      //       SizedBox(
                                      //         height: size.height * 0.04,
                                      //       ),
                                      //       Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceAround,
                                      //         children: [
                                      //           CustomText(
                                      //             text: "Payment Getway",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Chat App",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Spotify Clone",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "TODO App",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),

                                      // //other Projects
                                      // Container(
                                      //   height: size.height * 0.86,
                                      //   width: size.width - 100,
                                      //   child: Column(
                                      //     children: [
                                      //       Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceAround,
                                      //         children: [
                                      //           OSImages(
                                      //             image: "assets/images/pic114.png",
                                      //           ),
                                      //           OSImages(
                                      //             image: "assets/images/pic115.png",
                                      //           ),
                                      //           OSImages(
                                      //             image: "assets/images/pic116.jfif",
                                      //           ),
                                      //           OSImages(
                                      //             image: "assets/images/pic117.png",
                                      //           ),
                                      //         ],
                                      //       ),
                                      //       SizedBox(
                                      //         height: size.height * 0.04,
                                      //       ),
                                      //       Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceAround,
                                      //         children: [
                                      //           CustomText(
                                      //             text: "Spannish Audio",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Drumpad",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Currency Converter",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Calculator",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),

                                      // //other Projects
                                      // Container(
                                      //   height: size.height * 0.86,
                                      //   width: size.width - 100,
                                      //   child: Column(
                                      //     children: [
                                      //       Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceAround,
                                      //         children: [
                                      //           OSImages(
                                      //             image: "assets/images/pic118.jpeg",
                                      //           ),
                                      //           OSImages(
                                      //             image: "assets/images/pic119.jpeg",
                                      //           ),
                                      //           OSImages(
                                      //             image: "assets/images/pic120.png",
                                      //           ),
                                      //           OSImages(
                                      //             image: "assets/images/pic121.png",
                                      //           ),
                                      //         ],
                                      //       ),
                                      //       SizedBox(
                                      //         height: size.height * 0.04,
                                      //       ),
                                      //       Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceAround,
                                      //         children: [
                                      //           CustomText(
                                      //             text: "Prime Videos UI",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Tic Tac Toe Game",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Currency Converter UI",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Love Calculator",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "assets/images/pic102.gif",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/champ96k/Flutter-Web-SolMusic-Landing-Page");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "SolMusic",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Web",
                                      //   skills: ['Dart', 'Flutter', 'Firebase'],
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "assets/images/pic104.png",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/champ96k/Flutter-UI-Kit");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Sign Up and Sign In",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      //   skills: ['Dart', 'Flutter', 'Firebase'],
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "assets/images/pic105.png",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/champ96k/Flutter-UI-Kit");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Sign up and Sign in",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      //   skills: ['Dart', 'Flutter', 'Firebase'],
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "assets/images/pic106.png",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/champ96k/Flowers-Shop-Mobile-App-Store");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Online Flowers Shop",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      //   skills: ['Dart', 'Flutter', 'Firebase'],
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "assets/images/pic107.jfif",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/champ96k/Food-Delivery-App-UI");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Food delivery App",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      //   skills: ['Dart', 'Flutter', 'Firebase'],
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "assets/images/pic108.jfif",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/champ96k/Flutter-Plant-Shop-UI-Design");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Plant Nursery App",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      //   skills: ['Dart', 'Flutter', 'Firebase'],
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "assets/images/pic109.jfif",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/champ96k/Foody-App-UI-Design");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Foody",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      //   skills: ['Dart', 'Flutter', 'Firebase'],
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "assets/images/pic110.jfif",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/champ96k/Flutter-Online-Food-Order-App-UI");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Online Food order",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      //   skills: ['Dart', 'Flutter', 'Firebase'],
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "assets/images/pic501.png",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/champ96k/Ganpati-Bappa-");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Ganpati Bappa",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter Animation",
                                      //   skills: ['Dart', 'Flutter', 'Firebase'],
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "assets/images/pic506.png",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/champ96k/Netflix-Web-Clone-Using-Flutter");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Flutter Netflix Web",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter Wen",
                                      //   tech3: "Flutter UI",
                                      //   skills: ['Dart', 'Flutter', 'Firebase'],
                                      // ),
                                    ],
                                  )),

                              //Get In Touch
                              _wrapScrollTag(
                                index: 3,
                                child: Column(
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
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.4),
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
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.envelope,
                                            color: Color(0xffffA8B2D1),
                                          ),
                                          Text(
                                            'javedcsiub@gmail.com',
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.4),
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
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.phone,
                                            color: Color(0xffffA8B2D1),
                                          ),
                                          Text(
                                            '+923064488966',
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.4),
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
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.skype,
                                            color: Color(0xffffA8B2D1),
                                          ),
                                          Text(
                                            'its.iosdeveloper87',
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.4),
                                              letterSpacing: 1.75,
                                              fontSize: 14.0,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    // //Footer
                                    // Container(
                                    //   alignment: Alignment.center,
                                    //   height:
                                    //       MediaQuery.of(context).size.height /
                                    //           6,
                                    //   width: MediaQuery.of(context).size.width -
                                    //       100,
                                    //   //color: Colors.white,
                                    //   child: Text(
                                    //     "Muhammad Javed Iqbal",
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
                            ])),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: MediaQuery.of(context).size.height - 82,
                    //color: Colors.orange,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RotatedBox(
                          quarterTurns: 45,
                          child: Text(
                            "Muhammad Javed Iqbal",
                            style: TextStyle(
                              color: Colors.grey.withOpacity(0.6),
                              letterSpacing: 3.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            height: 100,
                            width: 2,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
