import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'shared_widgets.dart';

class PortfolioNavBar extends StatelessWidget {
  final ScrollController scrollController;
  final bool isMobile;
  final bool isCompact;

  const PortfolioNavBar({
    super.key,
    required this.scrollController,
    required this.isMobile,
    this.isCompact = false,
  });

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final navItems = [
      ('Work', PortfolioScreenKeys.projects),
      ('AI', PortfolioScreenKeys.ai),
      ('Skills', PortfolioScreenKeys.skills),
      ('About', PortfolioScreenKeys.about),
      ('Contact', PortfolioScreenKeys.contact),
    ];

    return Material(
      color: AppColors.backgroundElevated.withValues(alpha: 0.95),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 48,
          vertical: isMobile ? 12 : 14,
        ),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.borderSubtle)),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        colors: [AppColors.accent, AppColors.accentLight],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'MJ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  if (!isMobile && !isCompact) ...[
                    const SizedBox(width: 12),
                    const Text(
                      'Javed Iqbal',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (!isMobile) ...[
              const Spacer(),
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: navItems
                        .map(
                          (item) => _NavLink(
                            label: item.$1,
                            onTap: () => _scrollTo(item.$2),
                            compact: isCompact,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ] else
              const Spacer(),
            const SizedBox(width: 8),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: isMobile ? 88 : 96),
              child: PrimaryButton(
                label: isMobile ? 'Contact' : 'Hire Me',
                compact: true,
                onPressed: () => _scrollTo(PortfolioScreenKeys.contact),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PortfolioScreenKeys {
  static final projects = GlobalKey();
  static final ai = GlobalKey();
  static final skills = GlobalKey();
  static final about = GlobalKey();
  static final contact = GlobalKey();
}

class _NavBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _NavBarHeaderDelegate({required this.child});

  @override
  double get minExtent => 68;

  @override
  double get maxExtent => 68;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _NavBarHeaderDelegate oldDelegate) {
    return oldDelegate.child != child;
  }
}

SliverPersistentHeader pinnedNavBarHeader({
  required ScrollController scrollController,
  required bool isMobile,
  required bool isCompact,
}) {
  return SliverPersistentHeader(
    pinned: true,
    delegate: _NavBarHeaderDelegate(
      child: PortfolioNavBar(
        scrollController: scrollController,
        isMobile: isMobile,
        isCompact: isCompact,
      ),
    ),
  );
}

class HeroSection extends StatelessWidget {
  final bool isMobile;

  const HeroSection({super.key, required this.isMobile});

  void _scrollToProjects() {
    final context = PortfolioScreenKeys.projects.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToContact() {
    final context = PortfolioScreenKeys.contact.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -80,
          right: isMobile ? -60 : 0,
          left: isMobile ? -40 : null,
          child: Container(
            width: isMobile ? 320 : 560,
            height: isMobile ? 320 : 480,
            decoration: BoxDecoration(
              gradient: AppGradients.heroGlow,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 48,
            vertical: isMobile ? 48 : 80,
          ),
          child: isMobile ? _buildMobile() : _buildDesktop(),
        ),
      ],
    );
  }

  Widget _buildDesktop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: _buildContent(),
        ),
        const SizedBox(width: 64),
        Expanded(
          flex: 1,
          child: _buildProfileImage(320),
        ),
      ],
    );
  }

  Widget _buildMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContent(),
        const SizedBox(height: 40),
        Center(child: _buildProfileImage(220)),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.accentFaint,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.borderSubtle),
          ),
          child: Text(
            'Available for remote job, freelance & contract work',
            style: AppTheme.label.copyWith(fontSize: 12),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          PortfolioData.headline,
          style: AppTheme.headlineLarge.copyWith(
            fontSize: isMobile ? 32 : 48,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          PortfolioData.subheadline,
          style: AppTheme.bodyLarge.copyWith(
            fontSize: isMobile ? 16 : 18,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 36),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            PrimaryButton(
              label: 'View Projects',
              icon: Icons.arrow_downward,
              onPressed: _scrollToProjects,
            ),
            PrimaryButton(
              label: 'Contact Me',
              outlined: true,
              onPressed: _scrollToContact,
            ),
          ],
        ),
        const SizedBox(height: 48),
        Wrap(
          spacing: 32,
          runSpacing: 16,
          children: PortfolioData.trustSignals
              .take(3)
              .map(
                (s) => StatDisplay(value: s.value, label: s.label),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _buildProfileImage(double width) {
    return Container(
      width: width / 2.0,
      height: width * 1.25,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.profileImage,
      ),
      child: Image.asset(
        'assets/images/pp2.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool compact;

  const _NavLink({
    required this.label,
    required this.onTap,
    required this.compact,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: TextButton(
        onPressed: widget.onTap,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: widget.compact ? 12 : 16),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 150),
          style: TextStyle(
            color: _hovered ? AppColors.textPrimary : AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}
