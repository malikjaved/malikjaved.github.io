import 'package:flutter/material.dart';

import '../theme/app_breakpoints.dart';

/// Enforces a minimum layout width and enables horizontal scrolling when the
/// browser viewport is narrower than [AppBreakpoints.minLayoutWidth].
class ResponsiveLayout extends StatelessWidget {
  final Widget child;

  const ResponsiveLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final viewportWidth = constraints.maxWidth;
        final minWidth = AppBreakpoints.minLayoutWidth;
        final needsHorizontalScroll = viewportWidth < minWidth;
        final layoutWidth =
            needsHorizontalScroll ? minWidth : viewportWidth;

        final mediaQuery = MediaQuery.of(context);
        final layoutMediaQuery = mediaQuery.copyWith(
          size: Size(layoutWidth, mediaQuery.size.height),
        );

        final content = MediaQuery(
          data: layoutMediaQuery,
          child: child,
        );

        if (!needsHorizontalScroll) {
          return content;
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: minWidth,
            height: constraints.maxHeight.isFinite
                ? constraints.maxHeight
                : mediaQuery.size.height,
            child: content,
          ),
        );
      },
    );
  }
}
