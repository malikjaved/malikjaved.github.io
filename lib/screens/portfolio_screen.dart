import 'package:flutter/material.dart';

import '../Model/Method.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/case_study_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/content_sections.dart';
import '../widgets/hero_section.dart';
import '../widgets/shared_widgets.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;
    final isCompact = width < 1100;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.background,
        ),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            pinnedNavBarHeader(
              scrollController: _scrollController,
              isMobile: isMobile,
              isCompact: isCompact,
            ),
            SliverToBoxAdapter(
              child: HeroSection(isMobile: isMobile),
            ),
            SliverToBoxAdapter(
              key: PortfolioScreenKeys.projects,
              child: CaseStudiesSection(isMobile: isMobile),
            ),
            SliverToBoxAdapter(
              key: PortfolioScreenKeys.ai,
              child: AiSection(isMobile: isMobile),
            ),
            SliverToBoxAdapter(
              key: PortfolioScreenKeys.skills,
              child: SkillsSection(isMobile: isMobile),
            ),
            SliverToBoxAdapter(
              child: TrustSection(isMobile: isMobile),
            ),
            SliverToBoxAdapter(
              child: ServicesSection(isMobile: isMobile),
            ),
            SliverToBoxAdapter(
              key: PortfolioScreenKeys.about,
              child: AboutSection(isMobile: isMobile),
            ),
            SliverToBoxAdapter(
              key: PortfolioScreenKeys.contact,
              child: ContactSection(isMobile: isMobile),
            ),
          ],
        ),
      ),
      floatingActionButton: isMobile
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: AppGradients.primaryButton,
                boxShadow: AppShadows.primaryButton(),
              ),
              child: FloatingActionButton.extended(
                onPressed: () {
                  Method().mailTo(PortfolioData.email);
                },
                backgroundColor: Colors.transparent,
                elevation: 0,
                icon: const Icon(Icons.email, color: Colors.white),
                label: const Text(
                  'Email Me',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          : null,
    );
  }
}
