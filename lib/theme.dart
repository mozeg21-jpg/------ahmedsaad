import 'package:flutter/material.dart';

class AppTheme {
  // الألوان الأساسية للهوية البصرية الجديدة
  static const Color primaryGreen = Color(0xFF16745B);
  static const Color goldAccent = Color(0xFFC5A059);
  static const Color ivoryLight = Color(0xFFFDFBF7);
  static const Color darkSurface = Color(0xFF121412);

  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: primaryGreen,
      brightness: brightness,
      primary: primaryGreen,
      secondary: goldAccent,
      surface: brightness == Brightness.light ? ivoryLight : darkSurface,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: scheme.onSurface,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Amiri', // سنعتمد خطاً عربياً كلاسيكياً لاحقاً
        ),
      ),
      cardTheme: CardTheme(
        elevation: 0,
        color: brightness == Brightness.light ? Colors.white : const Color(0xFF1E201E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: scheme.outlineVariant.withOpacity(0.5)),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        elevation: 2,
        backgroundColor: scheme.surface,
        indicatorColor: primaryGreen.withOpacity(0.2),
      ),
    );
  }
}

class SoftCard extends StatelessWidget {
  const SoftCard({
    Key? key,
    required this.child,
    this.color,
    this.padding = const EdgeInsets.all(20),
  }) : super(key: key);

  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(padding: padding, child: child),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key? key,
    required this.title,
    this.action,
    this.onAction,
  }) : super(key: key);

  final String title;
  final String? action;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        const Spacer(),
        if (action != null)
          TextButton(
            onPressed: onAction,
            child: Text(action!, style: const TextStyle(color: AppTheme.primaryGreen)),
          ),
      ],
    );
  }
}

class QuickAction extends StatelessWidget {
  const QuickAction({
    Key? key,
    required this.icon,
    required this.title,
    required this.color,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(icon, size: 28, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
