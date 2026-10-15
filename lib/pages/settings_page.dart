import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final bool isDarkMode;
  final Function onThemeChanged;
  final double quranFontSize;
  final Function onQuranFontSizeChanged;

  const SettingsPage({Key? key, required this.isDarkMode, required this.onThemeChanged, required this.quranFontSize, required this.onQuranFontSizeChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإعدادات')), 
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('الوضع الداكن'),
            value: isDarkMode,
            onChanged: (value) => onThemeChanged(),
          ),
          ListTile(
            title: const Text('حجم خط القرآن'),
            subtitle: Text(quranFontSize.toString()),
            onTap: () {
              // إضافة كود لتغيير حجم الخط
            },
          ),
          ListTile(
            title: const Text('اختيار المدينة لمواقيت الصلاة'),
            onTap: () {
              // إضافة كود لاختيار المدينة
            },
          ),
        ],
      ),
    );
  }
}
