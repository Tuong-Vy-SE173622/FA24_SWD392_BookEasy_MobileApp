// controllers/event_controller.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bookeasy/models/event.dart';

class EventController {
  final String apiUrl =
      'https://eventcheckinmanagement-h7bggygec8esg5cd.southeastasia-01.azurewebsites.net/api/userevent/user';

  // Hàm gọi API lấy dữ liệu sự kiện theo userId từ SharedPreferences
  Future<List<Event>> fetchEvents() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId') ?? '';

    final response = await http.get(
      Uri.parse('$apiUrl/$userId/events'),
      headers: {'accept': 'text/plain'},
    );

    if (response.statusCode == 200) {
      // final List<dynamic> data = json.decode(response.body)['$values'];

      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse['\$values'];

      if (data.isEmpty) {
        throw Exception("Không có Group Guest nào trong Event này");
      }
      return data.map((json) => Event.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }
}
