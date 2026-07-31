import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class SectionHeader extends StatelessWidget {
  final String number;
  final String title;
  final String? subtitle;

  const SectionHeader({
    super.key,
    required this.number,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(number, style: AppTheme.sectionNumber),
            const SizedBox(width: 12),
            Expanded(
              child: Container(height: 1, color: AppColors.borderSubtle),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(title, style: AppTheme.headlineSmall),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          Text(subtitle!, style: AppTheme.bodyMedium),
        ],
      ],
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final bool outlined;
  final bool compact;
  final IconData? icon;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.outlined = false,
    this.compact = false,
    this.icon,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _hovered ? -2 : 0, 0),
        decoration: widget.outlined
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _hovered
                      ? AppColors.border
                      : AppColors.borderSubtle,
                  width: 1,
                ),
                color: _hovered
                    ? AppColors.surfaceLight.withValues(alpha: 0.5)
                    : Colors.transparent,
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: _hovered
                    ? AppGradients.primaryButtonHover
                    : AppGradients.primaryButton,
                boxShadow: AppShadows.primaryButton(hovered: _hovered),
              ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: widget.compact ? 18 : 28,
                vertical: widget.compact ? 10 : 16,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.label,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      color: widget.outlined
                          ? (_hovered
                              ? AppColors.textPrimary
                              : AppColors.textSecondary)
                          : AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: widget.compact ? 14 : 15,
                      letterSpacing: 0.2,
                    ),
                  ),
                  if (widget.icon != null) ...[
                    const SizedBox(width: 8),
                    Icon(
                      widget.icon,
                      size: 16,
                      color: widget.outlined
                          ? (_hovered
                              ? AppColors.textPrimary
                              : AppColors.textSecondary)
                          : AppColors.textPrimary,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SkillBadge extends StatelessWidget {
  final String label;

  const SkillBadge({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class HoverCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;

  const HoverCard({super.key, required this.child, this.onTap});

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.translationValues(0, _hovered ? -3 : 0, 0),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.surfaceLight : AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _hovered ? AppColors.border : AppColors.borderSubtle,
          ),
          boxShadow: _hovered ? AppShadows.cardHover : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(12),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

/// Reusable stat/metric display with optional accent underline.
class StatDisplay extends StatelessWidget {
  final String value;
  final String label;
  final bool showAccentLine;

  const StatDisplay({
    super.key,
    required this.value,
    required this.label,
    this.showAccentLine = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: AppTheme.statValue(size: 32)),
        if (showAccentLine) ...[
          const SizedBox(height: 6),
          Container(
            width: 24,
            height: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.6),
                  AppColors.primary.withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
        ],
        const SizedBox(height: 6),
        Text(label, style: AppTheme.statLabel),
      ],
    );
  }
}
