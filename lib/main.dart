import 'package:flutter/material.dart';

import 'screens/portfolio_screen.dart';
import 'theme/app_theme.dart';
import 'widgets/responsive_layout.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muhammad Javed Iqbal — Lead Mobile Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      builder: (context, child) {
        if (child == null) return const SizedBox.shrink();
        return ResponsiveLayout(child: child);
      },
      home: const PortfolioScreen(),
    );
  }
}
