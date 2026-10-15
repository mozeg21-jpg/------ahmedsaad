import 'package:http/http.dart' as http;
import 'dart:convert';

class PrayerTimeService {
  static const String baseUrl = 'https://api.aladhan.com/v1/timings';

  static Future<Map<String, dynamic>> fetchPrayerTimes(double latitude, double longitude) async {
    final response = await http.get(Uri.parse('$baseUrl?latitude=$latitude&longitude=$longitude'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('فشل في تحميل مواقيت الصلاة');
    }
  }
}
