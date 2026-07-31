import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Model/Method.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'shared_widgets.dart';

class ContactSection extends StatelessWidget {
  final bool isMobile;

  const ContactSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final method = Method();

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: isMobile ? 32 : 48),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 48,
        vertical: isMobile ? 48 : 80,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.background,
            AppColors.backgroundElevated,
          ],
        ),
      ),
      child: Column(
        children: [
          Text('07', style: AppTheme.sectionNumber),
          const SizedBox(height: 16),
          Text(
            'Get In Touch',
            style: AppTheme.headlineMedium.copyWith(
              fontSize: isMobile ? 32 : 42,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              PortfolioData.contactCta,
              style: AppTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          PrimaryButton(
            label: 'Send Email',
            icon: Icons.email_outlined,
            onPressed: () => method.mailTo(PortfolioData.email),
          ),
          const SizedBox(height: 48),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 24,
            runSpacing: 16,
            children: [
              _ContactLink(
                icon: FaIcon(FontAwesomeIcons.envelope, size: 16),
                label: PortfolioData.email,
                onTap: () => method.mailTo(PortfolioData.email),
              ),
              _ContactLink(
                icon: FaIcon(FontAwesomeIcons.linkedin, size: 16),
                label: 'LinkedIn',
                onTap: () => method.launchURL(PortfolioData.linkedIn),
              ),
              _ContactLink(
                icon: FaIcon(FontAwesomeIcons.github, size: 16),
                label: 'GitHub',
                onTap: () => method.launchURL(PortfolioData.github),
              ),
            ],
          ),
          const SizedBox(height: 64),
          Text(
            '© ${DateTime.now().year} ${PortfolioData.name}. Built with Flutter.',
            style: const TextStyle(color: AppColors.textMuted, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _ContactLink extends StatefulWidget {
  final Widget icon;
  final String label;
  final VoidCallback onTap;

  const _ContactLink({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_ContactLink> createState() => _ContactLinkState();
}

class _ContactLinkState extends State<_ContactLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.surfaceLight : AppColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _hovered ? AppColors.border : AppColors.borderSubtle,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DefaultTextStyle(
                style: TextStyle(
                  color: _hovered
                      ? AppColors.primary
                      : AppColors.textMuted,
                ),
                child: widget.icon,
              ),
              const SizedBox(width: 10),
              Text(
                widget.label,
                style: TextStyle(
                  color: _hovered
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
