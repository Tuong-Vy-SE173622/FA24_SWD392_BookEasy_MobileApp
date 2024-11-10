import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class UserController {
  final String apiUrl =
      'https://eventcheckinmanagement-h7bggygec8esg5cd.southeastasia-01.azurewebsites.net/api/user/get-by-id';

  // Fetch user data by userId
  Future<UserModel?> fetchUser() async {
    try {
      // Get userId and token from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');
      final verificationToken = prefs.getString('verificationToken');

      if (userId == null || verificationToken == null) {
        throw Exception('User ID or Verification Token is missing.');
      }

      // Make the GET request with Authorization header
      final response = await http.get(
        Uri.parse('$apiUrl?userId=$userId'),
        headers: {
          'accept': '*/*',
          'Authorization': 'Bearer $verificationToken',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        // Return a UserModel instance
        return UserModel.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
