import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatelessWidget {
  Future<Map<String, dynamic>> _getAllStoredData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> allData = {};

    // Duyệt tất cả các key trong SharedPreferences
    final keys = prefs.getKeys();
    for (var key in keys) {
      final value = prefs.get(key);
      allData[key] = value;
    }

    return allData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _getAllStoredData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found in SharedPreferences.'));
          } else {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                String key = data.keys.elementAt(index);
                var value = data[key];
                return ListTile(
                  title: Text(key),
                  subtitle: Text(value.toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
