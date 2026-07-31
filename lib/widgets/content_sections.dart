import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'shared_widgets.dart';

class AiSection extends StatelessWidget {
  final bool isMobile;

  const AiSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: isMobile ? 32 : 48),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 48,
        vertical: isMobile ? 48 : 64,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.backgroundElevated,
            AppColors.background,
          ],
        ),
        border: const Border.symmetric(
          horizontal: BorderSide(color: AppColors.borderSubtle),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.surfaceLight,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.borderSubtle),
                ),
                child: const Icon(Icons.auto_awesome, color: AppColors.textSecondary, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('02', style: AppTheme.sectionNumber),
                    Text(PortfolioData.aiSectionTitle, style: AppTheme.headlineSmall),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(PortfolioData.aiSectionSubtitle, style: AppTheme.bodyLarge),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = isMobile ? 1 : (constraints.maxWidth > 900 ? 4 : 2);
              final spacing = 16.0;
              final itemWidth = columns == 1
                  ? constraints.maxWidth
                  : (constraints.maxWidth - spacing * (columns - 1)) /
                      columns;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: PortfolioData.aiCapabilities
                    .asMap()
                    .entries
                    .map(
                      (entry) => SizedBox(
                        width: itemWidth,
                        child: HoverCard(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  _iconForCapability(entry.key),
                                  color: AppColors.textSecondary,
                                  size: 28,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  entry.value.title,
                                  style: AppTheme.headlineSmall
                                      .copyWith(fontSize: 17),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  entry.value.description,
                                  style:
                                      AppTheme.bodyMedium.copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderSubtle),
            ),
            child: Row(
              children: [
                const Icon(Icons.insights, color: AppColors.success, size: 32),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Proven Results',
                        style: AppTheme.headlineSmall.copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Reduced healthcare document review time by 60% using Azure AI + OpenAI integrations.',
                        style: AppTheme.bodyMedium.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconForCapability(int index) {
    const icons = [
      Icons.psychology,
      Icons.chat_bubble_outline,
      Icons.settings_suggest,
      Icons.description_outlined,
    ];
    return icons[index % icons.length];
  }
}

class SkillsSection extends StatelessWidget {
  final bool isMobile;

  const SkillsSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            number: '03',
            title: 'Skills & Expertise',
            subtitle: 'Full-stack mobile engineering — from UI to backend to AI.',
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = isMobile ? 1 : (constraints.maxWidth > 800 ? 4 : 2);
              final spacing = 16.0;
              final itemWidth = columns == 1
                  ? constraints.maxWidth
                  : (constraints.maxWidth - spacing * (columns - 1)) /
                      columns;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: PortfolioData.skillGroups
                    .map(
                      (group) => SizedBox(
                        width: itemWidth,
                        child: HoverCard(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  group.title,
                                  style: AppTheme.headlineSmall.copyWith(
                                    fontSize: 16,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: group.skills
                                      .map((s) => SkillBadge(label: s))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
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

class TrustSection extends StatelessWidget {
  final bool isMobile;

  const TrustSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            number: '04',
            title: 'Experience & Trust',
            subtitle: 'A track record of leading teams and shipping production systems.',
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = isMobile ? 2 : 4;
              final spacing = 16.0;
              final itemWidth = (constraints.maxWidth - spacing * (columns - 1)) /
                  columns;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: PortfolioData.trustSignals
                    .map(
                      (signal) => SizedBox(
                        width: itemWidth,
                        child: HoverCard(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  signal.value,
                                  style: AppTheme.statValue(size: 36),
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  width: 20,
                                  height: 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1),
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.primary
                                            .withValues(alpha: 0.5),
                                        AppColors.primary
                                            .withValues(alpha: 0.0),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  signal.label,
                                  textAlign: TextAlign.center,
                                  style: AppTheme.statLabel,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: PortfolioData.industries
                .map(
                  (ind) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.border),
                      color: AppColors.surface,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.domain, size: 16, color: AppColors.textMuted),
                        const SizedBox(width: 8),
                        Text(ind, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14)),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 40),
          ...PortfolioData.experience.map(
            (entry) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: HoverCard(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(entry.company, style: AppTheme.headlineSmall.copyWith(fontSize: 17)),
                                const SizedBox(height: 4),
                                Text(
                                  entry.role,
                                  style: const TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Text(
                              entry.duration,
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                color: AppColors.textMuted,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(entry.highlight, style: AppTheme.bodyMedium.copyWith(fontSize: 14)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServicesSection extends StatelessWidget {
  final bool isMobile;

  const ServicesSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 48,
        vertical: isMobile ? 48 : 64,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.backgroundElevated,
            AppColors.background,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            number: '05',
            title: 'What I Can Help You With',
            subtitle: 'Engage me for end-to-end delivery or targeted expertise on your existing product.',
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = isMobile ? 1 : (constraints.maxWidth > 900 ? 3 : 2);
              final spacing = 16.0;
              final itemWidth = columns == 1
                  ? constraints.maxWidth
                  : (constraints.maxWidth - spacing * (columns - 1)) /
                      columns;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: PortfolioData.services
                    .map(
                      (service) => SizedBox(
                        width: itemWidth,
                        child: HoverCard(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: AppColors.surfaceLight,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.borderSubtle,
                                    ),
                                  ),
                                  child: Icon(
                                    service.icon,
                                    color: AppColors.textSecondary,
                                    size: 22,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  service.title,
                                  style: AppTheme.headlineSmall
                                      .copyWith(fontSize: 17),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  service.description,
                                  style:
                                      AppTheme.bodyMedium.copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
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

class AboutSection extends StatelessWidget {
  final bool isMobile;

  const AboutSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            number: '06',
            title: 'About',
          ),
          const SizedBox(height: 24),
          Text(PortfolioData.aboutText, style: AppTheme.bodyLarge),
          const SizedBox(height: 32),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const [
              _HighlightChip(label: 'Systems Thinking'),
              _HighlightChip(label: 'Clean Architecture'),
              _HighlightChip(label: 'Scalability'),
              _HighlightChip(label: 'AI Integrations'),
              _HighlightChip(label: 'Lead & Sole Developer'),
            ],
          ),
        ],
      ),
    );
  }
}

class _HighlightChip extends StatelessWidget {
  final String label;

  const _HighlightChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
