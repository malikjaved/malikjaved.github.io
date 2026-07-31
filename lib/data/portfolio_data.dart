import 'package:flutter/material.dart';

class CaseStudy {
  final String title;
  final String category;
  final String? imagePath;
  final String problem;
  final List<String> solutions;
  final List<String> techStack;
  final List<String> impact;
  final bool featured;

  const CaseStudy({
    required this.title,
    required this.category,
    this.imagePath,
    required this.problem,
    required this.solutions,
    required this.techStack,
    required this.impact,
    this.featured = true,
  });
}

class SkillGroup {
  final String title;
  final List<String> skills;

  const SkillGroup({required this.title, required this.skills});
}

class TrustSignal {
  final String value;
  final String label;

  const TrustSignal({required this.value, required this.label});
}

class Service {
  final String title;
  final String description;
  final IconData icon;

  const Service({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class ExperienceEntry {
  final String company;
  final String role;
  final String duration;
  final String highlight;

  const ExperienceEntry({
    required this.company,
    required this.role,
    required this.duration,
    required this.highlight,
  });
}

class AiCapability {
  final String title;
  final String description;

  const AiCapability({required this.title, required this.description});
}

class PortfolioData {
  static const name = 'Muhammad Javed Iqbal';
  static const headline =
      'Lead Mobile Developer | Flutter, iOS & AI-Powered Apps';
  static const subheadline =
      '13+ years building scalable mobile apps with Flutter, native iOS, and AI integrations';
  static const email = 'javedcsiub@gmail.com';
  static const phone = '+923064488966';
  static const linkedIn =
      'https://www.linkedin.com/in/javediqbal-lead-mobile-dev/';
  static const github = 'https://github.com/malikjaved';
  static const stackOverflow =
      'https://stackoverflow.com/users/2201647/javed-iqbal';
  static const resumeUrl =
      'https://docs.google.com/document/d/1YiuyK8fAYzpJEPBjQHyiJBKL166xQmLQ/edit?usp=share_link&ouid=100063593127660478650&rtpof=true&sd=true';

  static const aboutText =
      'I architect and ship production mobile systems — from real-time delivery platforms to AI-powered healthcare apps. '
      'As a lead and sole developer, I own the full stack: Flutter and native iOS frontends, Node.js and ASP.NET backends, '
      'Firebase infrastructure, and OpenAI/Azure AI integrations. '
      'My focus is clean architecture, measurable impact, and systems that scale beyond launch day.';

  static const contactCta =
      'Looking to build a scalable or AI-powered app? Let\'s talk.';

  static const aiSectionTitle = 'AI-Powered Mobile Solutions';
  static const aiSectionSubtitle =
      'I integrate intelligence into mobile products — not as a gimmick, but as a workflow multiplier that saves time and drives revenue.';

  static const List<AiCapability> aiCapabilities = [
    AiCapability(
      title: 'OpenAI Integrations',
      description:
          'GPT-powered chatbots, smart assistants, and contextual recommendations embedded natively in Flutter and iOS apps.',
    ),
    AiCapability(
      title: 'Intelligent Chatbots',
      description:
          'Conversational UI with streaming responses, memory context, and backend orchestration for support and onboarding flows.',
    ),
    AiCapability(
      title: 'Automation Workflows',
      description:
          'End-to-end automation pipelines that replace manual review, data entry, and repetitive operational tasks.',
    ),
    AiCapability(
      title: 'Smart Document Processing',
      description:
          'Azure AI and OpenAI-powered document extraction, classification, and validation — reducing review cycles by up to 60%.',
    ),
  ];

  static const List<CaseStudy> caseStudies = [
    CaseStudy(
      title: 'AI Healthcare Platform',
      category: 'Healthcare · AI',
      imagePath: 'assets/images/pre-screening-app.png',
      problem:
          'Manual document review and patient intake workflows were slow, error-prone, and blocking clinical staff from high-value work.',
      solutions: [
        'Built AI-powered document processing with Azure AI and OpenAI',
        'Integrated intelligent chatbot for patient Q&A and triage',
        'Automated review workflows with ASP.NET backend orchestration',
        'Delivered cross-platform Flutter app with real-time sync via Firebase',
      ],
      techStack: ['Flutter', 'Azure AI', 'OpenAI', 'Firebase', 'ASP.NET'],
      impact: [
        'Reduced manual review time by 60%',
        'Automated intake workflows end-to-end',
        'Production system serving healthcare centers',
      ],
    ),
    CaseStudy(
      title: 'Celibate — Dating App',
      category: 'Social · Consumer',
      problem:
          'Needed a niche dating platform with real-time matching, secure messaging, and subscription monetization — built to scale from day one.',
      solutions: [
        'Architected Flutter app with clean BLoC state management',
        'Built real-time chat and match notification system',
        'Integrated in-app subscriptions and payment flows',
        'Designed privacy-first onboarding and profile verification',
      ],
      techStack: [
        'Flutter',
        'Firebase',
        'Node.js',
        'REST API',
        'Push Notifications'
      ],
      impact: [
        'End-to-end system built as lead developer',
        'Real-time messaging with sub-second delivery',
        'Subscription-ready monetization architecture',
      ],
    ),
    CaseStudy(
      title: 'Eezly — Food Delivery Platform',
      category: 'Delivery · Marketplace',
      imagePath: 'assets/images/food_delivery.png',
      problem:
          'Multi-sided marketplace required customer, vendor, and rider apps with live order tracking, payments, and multi-language support.',
      solutions: [
        'Led Flutter development for customer and vendor applications',
        'Integrated payment gateways and real-time order tracking',
        'Built push notification system for order lifecycle events',
        'Implemented multi-language support for Canadian market',
      ],
      techStack: ['Flutter', 'GetX', 'Firebase', 'REST API', 'Payment Gateway'],
      impact: [
        'Lead Flutter Developer at Eezly Technologies',
        'Production apps on App Store and Google Play',
        'Multi-app ecosystem for food delivery marketplace',
      ],
    ),
    CaseStudy(
      title: 'Eezly — Grocery Comparison App',
      category: 'Delivery · E-Commerce',
      imagePath: 'assets/images/grocery_app.png',
      problem:
          'Users needed to compare grocery prices across stores in real time — requiring fast search, subscription tiers, and reliable data sync.',
      solutions: [
        'Built price comparison engine with BLoC architecture',
        'Integrated in-app subscriptions for premium features',
        'Optimized search and filtering for large product catalogs',
        'Connected REST APIs with offline-first caching strategy',
      ],
      techStack: [
        'Flutter',
        'BLoC',
        'Firebase',
        'REST API',
        'In-App Subscription'
      ],
      impact: [
        'Cross-platform app serving Canadian grocery market',
        'Subscription model for recurring revenue',
        'Scalable search across multi-vendor inventory',
      ],
    ),
    CaseStudy(
      title: 'Skool Pesa — School Payments',
      category: 'Fintech · Payments',
      imagePath: 'assets/images/skoolpesa.png',
      problem:
          'Schools needed a secure mobile payment gateway for tuition and fees — with e-wallet functionality and real-time transaction tracking.',
      solutions: [
        'Developed Flutter payment app with BLoC pattern',
        'Integrated payment gateway and e-wallet system',
        'Built push notification alerts for transaction status',
        'Ensured secure API communication and error handling',
      ],
      techStack: ['Flutter', 'BLoC', 'REST API', 'Payment Gateway', 'eWallet'],
      impact: [
        'Production fintech app for school fee management',
        'Secure payment processing on iOS and Android',
        'Real-time transaction notifications',
      ],
    ),
    CaseStudy(
      title: 'Aphasia — AI Learning App',
      category: 'Education · ML',
      imagePath: 'assets/images/aphasia.png',
      problem:
          'Children with speech disorders needed an engaging, adaptive learning platform with pattern recognition and progress tracking.',
      solutions: [
        'Built gamified learning modules with TensorFlow ML integration',
        'Designed pattern tracing and interactive exercises',
        'Implemented Provider state management with Firebase backend',
        'Added in-app subscriptions for premium content tiers',
      ],
      techStack: ['Flutter', 'TensorFlow', 'Firebase', 'Provider', 'ML'],
      impact: [
        'ML-powered adaptive learning experience',
        'Cross-platform deployment for iOS and Android',
        'Subscription-based content monetization',
      ],
    ),
  ];

  static const List<CaseStudy> additionalProjects = [
    CaseStudy(
      title: 'My Warid — Telecom App',
      category: 'Telecom',
      imagePath: 'assets/images/mywarid.png',
      problem:
          'Major telecom brand needed a full-featured iOS app for packages, e-wallet, and subscriptions.',
      solutions: [
        'Built native iOS app in Swift with REST API integration',
        'Implemented maps, packages, and e-wallet features'
      ],
      techStack: ['Swift', 'iOS', 'REST API', 'Maps'],
      impact: [
        'Production app for millions of subscribers',
        'Full native iOS architecture'
      ],
      featured: false,
    ),
    CaseStudy(
      title: 'Keech Hospice Care',
      category: 'Charity · AR',
      imagePath: 'assets/images/keech.png',
      problem:
          'Charity needed an engaging fundraising app with AR experiences and gamification.',
      solutions: [
        'Developed Flutter app with AR integration',
        'Built gamified donation flows with Firebase backend'
      ],
      techStack: ['Flutter', 'Firebase', 'AR', 'GetX'],
      impact: ['Innovative AR-driven fundraising experience'],
      featured: false,
    ),
    CaseStudy(
      title: 'Actiify — Social Events',
      category: 'Social',
      imagePath: 'assets/images/actifiiy.png',
      problem:
          'Local events platform needed native iOS app with payments and social features.',
      solutions: ['Built Swift iOS app with Firebase and Stripe integration'],
      techStack: ['Swift', 'Firebase', 'Stripe'],
      impact: ['Native iOS social events platform'],
      featured: false,
    ),
    CaseStudy(
      title: 'Moshpit — Video Community',
      category: 'Social · Video',
      imagePath: 'assets/images/moshpit.png',
      problem:
          'Community platform for event videos needed native iOS with content creation and engagement.',
      solutions: ['Developed Swift iOS app with video upload and social feed'],
      techStack: ['Swift', 'REST API', 'Push Notifications'],
      impact: ['Video-centric community platform on iOS'],
      featured: false,
    ),
  ];

  static const List<SkillGroup> skillGroups = [
    SkillGroup(
        title: 'Mobile',
        skills: ['Flutter', 'Dart', 'Swift', 'SwiftUI', 'Objective-C']),
    SkillGroup(
        title: 'Backend',
        skills: ['Node.js', 'ASP.NET', 'Firebase', 'REST APIs', 'GraphQL']),
    SkillGroup(title: 'AI', skills: [
      'OpenAI',
      'Azure AI',
      'TensorFlow',
      'Chatbots',
      'Document AI'
    ]),
    SkillGroup(title: 'Systems', skills: [
      'Real-time Apps',
      'Scalable Architecture',
      'BLoC / GetX',
      'CI/CD',
      'Push Notifications'
    ]),
  ];

  static const List<TrustSignal> trustSignals = [
    TrustSignal(value: '13+', label: 'Years Experience'),
    TrustSignal(value: '50+', label: 'Apps Shipped'),
    TrustSignal(value: 'Lead', label: '& Sole Developer Roles'),
    TrustSignal(value: '4', label: 'Industry Verticals'),
  ];

  static const List<String> industries = [
    'Healthcare',
    'Fintech & Payments',
    'Delivery & Logistics',
    'Social & Consumer Apps',
  ];

  static const List<Service> services = [
    Service(
      title: 'Build Flutter Apps from Scratch',
      description:
          'End-to-end Flutter development — architecture, UI, state management, and App Store deployment.',
      icon: Icons.phone_android,
    ),
    Service(
      title: 'API & Firebase Integrations',
      description:
          'Connect your app to REST APIs, Firebase, real-time databases, auth, and cloud functions.',
      icon: Icons.cloud_sync,
    ),
    Service(
      title: 'Add AI Features to Apps',
      description:
          'Integrate OpenAI chatbots, Azure AI document processing, and intelligent automation into existing products.',
      icon: Icons.auto_awesome,
    ),
    Service(
      title: 'Optimize Performance',
      description:
          'Profile, refactor, and optimize apps for speed, memory, and smooth 60fps UI rendering.',
      icon: Icons.speed,
    ),
    Service(
      title: 'Scale Mobile Systems',
      description:
          'Architect multi-app ecosystems, real-time systems, and production infrastructure that grows with your business.',
      icon: Icons.hub,
    ),
  ];

  static const List<ExperienceEntry> experience = [
    ExperienceEntry(
      company: 'Upwork — Top-Rated Freelancer',
      role: 'Lead Mobile Developer (Flutter & iOS)',
      duration: 'May 2022 — Present',
      highlight:
          'Full-time freelancer delivering production apps for global clients across healthcare, fintech, and consumer sectors.',
    ),
    ExperienceEntry(
      company: 'Eezly Technologies — Montreal, Canada',
      role: 'Lead Flutter Developer',
      duration: 'Dec 2020 — May 2022',
      highlight:
          'Led Flutter development for food delivery and grocery comparison platforms serving the Canadian market.',
    ),
    ExperienceEntry(
      company: 'AiSolve — Luton, UK',
      role: 'Flutter Developer',
      duration: 'Mar 2020 — Apr 2022',
      highlight:
          'Built AI-integrated mobile solutions for healthcare and enterprise clients.',
    ),
    ExperienceEntry(
      company: 'Enigmatix Solutions — Pakistan',
      role: 'Mobile Developer (iOS & Flutter)',
      duration: 'Mar 2016 — Mar 2020',
      highlight:
          'Delivered 20+ mobile apps across fintech, education, and social verticals.',
    ),
    ExperienceEntry(
      company: 'Radius Interactive — Lahore',
      role: 'iOS Developer',
      duration: 'Nov 2013 — Mar 2016',
      highlight:
          'Native iOS development for telecom, social, and utility applications.',
    ),
  ];
}
