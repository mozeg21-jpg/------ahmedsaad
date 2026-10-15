import 'package:flutter/material.dart';
import '../services/prayer_time_service.dart';

class PrayerTimePage extends StatefulWidget {
  const PrayerTimePage({Key? key}) : super(key: key);

  @override
  _PrayerTimePageState createState() => _PrayerTimePageState();
}

class _PrayerTimePageState extends State<PrayerTimePage> {
  Map<String, dynamic>? prayerTimes;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPrayerTimes();
  }

  Future<void> fetchPrayerTimes() async {
    // استخدم إحداثيات الموقع الحالي أو المدينة المحددة
    double latitude = 0.0; // استبدل بإحداثيات حقيقية
    double longitude = 0.0; // استبدل بإحداثيات حقيقية
    prayerTimes = await PrayerTimeService.fetchPrayerTimes(latitude, longitude);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مواقيت الصلاة')), 
      body: isLoading ? const Center(child: CircularProgressIndicator()) : ListView(
        children: [
          // عرض مواقيت الصلاة هنا
        ],
      ),
    );
  }
}
