import 'package:flutter/material.dart';
import '../models/ayah.dart';
import '../services/quran_api.dart';

class QuranPage extends StatefulWidget {
  final double quranFontSize;

  const QuranPage({Key? key, required this.quranFontSize}) : super(key: key);

  @override
  _QuranPageState createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  late List<Ayah> ayahs;
  bool isLoading = true;
  String? interpretation;

  @override
  void initState() {
    super.initState();
    fetchAyahs();
  }

  Future<void> fetchAyahs() async {
    ayahs = await QuranApi.fetchSurah(1); // استبدل برقم السورة المطلوبة
    setState(() {
      isLoading = false;
    });
  }

  Future<void> fetchInterpretation(int surahNumber, int ayahNumber) async {
    interpretation = await QuranApi.fetchInterpretation(surahNumber, ayahNumber);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('القرآن الكريم')), 
      body: isLoading ? const Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: ayahs.length,
        itemBuilder: (context, index) {
          final ayah = ayahs[index];
          return ListTile(
            title: Text(ayah.displayText, style: TextStyle(fontSize: widget.quranFontSize)),
            onTap: () => fetchInterpretation(1, ayah.number), // استبدل برقم السورة
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // إضافة كود لتغيير حجم الخط وتباعد النص
        },
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}