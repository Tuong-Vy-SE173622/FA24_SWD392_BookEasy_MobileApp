import 'dart:convert';
import 'package:bookeasy/models/group_guest.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GroupGuestController {
  final String apiUrl =
      'https://eventcheckinmanagement-h7bggygec8esg5cd.southeastasia-01.azurewebsites.net/api/guestgroup/event/';

  Future<List<GroupGuest>> fetchGroupGuests(int eventID) async {
    print("EventID: $eventID");
    final url = '$apiUrl$eventID/guest-groups';
    print("API URL: $url"); // Kiểm tra URL chính xác

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'accept': 'text/plain',
          // 'Authorization': 'Bearer $token', // Dùng token nếu không null
        },
      );

      if (response.statusCode == 200) {
        print("Response body: ${response.body}"); // Kiểm tra nội dung phản hồi

        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        // Kiểm tra nếu phản hồi không chứa trường "$values"
        if (!jsonResponse.containsKey(r'$values')) {
          throw Exception("Dữ liệu không hợp lệ: Không có trường '\$values'");
        }

        // Lấy danh sách dữ liệu từ '$values'
        final List<dynamic> data = jsonResponse[r'$values'];

        // Kiểm tra dữ liệu trống
        if (data.isEmpty) {
          throw Exception("Không có Guest trong Group này");
        }

        // Chuyển đổi dữ liệu thành danh sách các GroupGuest
        return data.map((item) => GroupGuest.fromJson(item)).toList();
      } else {
        throw Exception("Lỗi khi tải dữ liệu: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
      throw Exception("Không thể kết nối với API: $e");
    }
  }
}
