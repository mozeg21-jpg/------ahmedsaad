import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/ayah.dart';

class QuranApi {
  static const String baseUrl = 'https://api.example.com/quran'; // استبدل برابط API الصحيح

  static Future<List<Ayah>> fetchSurah(int surahNumber) async {
    final response = await http.get(Uri.parse('$baseUrl/surahs/$surahNumber'));
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return json.map((ayah) => Ayah.fromJson(ayah)).toList();
    } else {
      throw Exception('فشل في تحميل السورة');
    }
  }

  static Future<String> fetchInterpretation(int surahNumber, int ayahNumber) async {
    final response = await http.get(Uri.parse('$baseUrl/interpretation/$surahNumber/$ayahNumber'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['interpretation'] as String;
    } else {
      throw Exception('فشل في تحميل التفسير');
    }
  }
}