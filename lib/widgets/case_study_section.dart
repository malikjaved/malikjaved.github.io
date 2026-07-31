import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'shared_widgets.dart';

class CaseStudyCard extends StatelessWidget {
  final CaseStudy study;
  final bool isMobile;
  final bool compact;

  const CaseStudyCard({
    super.key,
    required this.study,
    required this.isMobile,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    if (compact) return _buildCompactCard();

    return HoverCard(
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 20 : 32),
        child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (study.imagePath != null) ...[
          Flexible(
            flex: 0,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: _buildImage(200),
            ),
          ),
          const SizedBox(width: 32),
        ],
        Expanded(child: _buildContent()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (study.imagePath != null) ...[
          _buildImage(double.infinity, height: 180),
          const SizedBox(height: 24),
        ],
        _buildContent(),
      ],
    );
  }

  Widget _buildCompactCard() {
    return HoverCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (study.imagePath != null)
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                study.imagePath!,
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(study.category, style: AppTheme.label.copyWith(fontSize: 11)),
                const SizedBox(height: 8),
                Text(study.title, style: AppTheme.headlineSmall.copyWith(fontSize: 18)),
                const SizedBox(height: 12),
                Text(
                  study.problem,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.bodyMedium.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: study.techStack
                      .take(3)
                      .map((t) => SkillBadge(label: t))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(double width, {double height = 200}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        study.imagePath!,
        width: width == double.infinity ? null : width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(study.category, style: AppTheme.label.copyWith(fontSize: 12)),
        const SizedBox(height: 8),
        Text(study.title, style: AppTheme.headlineSmall),
        const SizedBox(height: 20),
        _SectionBlock(
          label: 'Problem',
          child: Text(study.problem, style: AppTheme.bodyMedium),
        ),
        const SizedBox(height: 16),
        _SectionBlock(
          label: 'Solution',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: study.solutions
                .map(
                  (s) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.check_circle_outline,
                            size: 16, color: AppColors.accent),
                        const SizedBox(width: 8),
                        Expanded(child: Text(s, style: AppTheme.bodyMedium.copyWith(fontSize: 14))),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 16),
        _SectionBlock(
          label: 'Tech Stack',
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: study.techStack.map((t) => SkillBadge(label: t)).toList(),
          ),
        ),
        const SizedBox(height: 16),
        _SectionBlock(
          label: 'Impact',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: study.impact
                .map(
                  (i) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.trending_up, size: 16, color: AppColors.success),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            i,
                            style: AppTheme.bodyMedium.copyWith(
                              fontSize: 14,
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _SectionBlock extends StatelessWidget {
  final String label;
  final Widget child;

  const _SectionBlock({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: AppColors.textMuted,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}

class CaseStudiesSection extends StatelessWidget {
  final bool isMobile;

  const CaseStudiesSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            number: '01',
            title: 'Case Studies',
            subtitle:
                'Production systems I\'ve architected and shipped — with measurable business impact.',
          ),
          const SizedBox(height: 16),
          Text(
            'Projects developed as lead or sole developer. Some were built for companies and clients worldwide.',
            style: AppTheme.bodyMedium.copyWith(fontSize: 14, color: AppColors.textMuted),
          ),
          const SizedBox(height: 40),
          ...PortfolioData.caseStudies.map(
            (study) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: CaseStudyCard(study: study, isMobile: isMobile),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'More Projects',
            style: AppTheme.headlineSmall.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount =
                  isMobile ? 1 : (constraints.maxWidth > 900 ? 4 : 2);
              final spacing = 16.0;
              final itemWidth = crossAxisCount == 1
                  ? constraints.maxWidth
                  : (constraints.maxWidth - spacing * (crossAxisCount - 1)) /
                      crossAxisCount;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: PortfolioData.additionalProjects
                    .map(
                      (study) => SizedBox(
                        width: itemWidth,
                        child: CaseStudyCard(
                          study: study,
                          isMobile: isMobile,
                          compact: true,
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
