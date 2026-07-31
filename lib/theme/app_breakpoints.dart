/// Shared layout breakpoints for the portfolio site.
class AppBreakpoints {
  AppBreakpoints._();

  /// Minimum layout width — viewport narrower than this scrolls horizontally.
  static const double minLayoutWidth = 768;

  /// Mobile layout threshold (matches min layout width).
  static const double mobile = 768;

  /// Compact nav / reduced chrome.
  static const double compact = 1100;

  /// Hero and two-column sections switch to stacked layout.
  static const double stacked = 960;
}
