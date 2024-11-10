// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:bookeasy/models/guest.dart';

// class GuestController {
//   static const String apiUrl =
//       'https://eventcheckinmanagement-h7bggygec8esg5cd.southeastasia-01.azurewebsites.net/api/guest/group/';

//   static const String checkInUrl =
//       'https://eventcheckinmanagement-h7bggygec8esg5cd.southeastasia-01.azurewebsites.net/api/guestcheckin';

//   Future<List<Guest>> fetchGuests(int guestGroupID) async {
//     final response = await http.get(Uri.parse('$apiUrl$guestGroupID'),
//         headers: {'accept': 'text/plain'});

//     if (response.statusCode == 200) {
//       // Chuyển đổi dữ liệu từ JSON thành List<Guest>
//       // final List<dynamic> data = json.decode(response.body);
//       final Map<String, dynamic> jsonResponse = json.decode(response.body);

//       // Kiểm tra nếu phản hồi không chứa trường "$values"
//       if (!jsonResponse.containsKey(r'$values')) {
//         throw Exception("Dữ liệu không hợp lệ: Không có trường '\$values'");
//       }

//       // Lấy danh sách dữ liệu từ '$values'
//       final List<dynamic> data = jsonResponse[r'$values'];

//       // Kiểm tra dữ liệu trống
//       if (data.isEmpty) {
//         throw Exception("Không có dữ liệu guest group");
//       }
//       return data.map((guestJson) => Guest.fromJson(guestJson)).toList();
//     } else {
//       throw Exception('Failed to load guests');
//     }
//   }

//   // Phương thức check-in guest
//   // Future<void> checkInGuest(int guestID) async {
//   //   print(guestID);
//   //   final response = await http.post(
//   //     Uri.parse(checkInUrl),
//   //     headers: {
//   //       'accept': 'text/plain',
//   //       'Content-Type': 'application/json',
//   //     },
//   //     body: json.encode({
//   //       'guestID': guestID,
//   //       'status': 'string',
//   //       'notes': 'string',
//   //     }),
//   //   );

//   //   if (response.statusCode != 200) {
//   //     throw Exception('Failed to check-in guest');
//   //   }
//   // }
//   Future<void> checkInGuest(int guestID) async {
//     final response = await http.post(
//       Uri.parse(checkInUrl),
//       headers: {
//         'accept': 'text/plain',
//         'Content-Type': 'application/json',
//       },
//       body: json.encode({
//         'guestID': guestID,
//         'status': 'Checked In',
//         'notes': 'string',
//       }),
//     );

//     // Kiểm tra mã phản hồi và in thông tin chi tiết nếu có lỗi
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       print("Check-in thành công!");
//     } else {
//       print("Check-in thất bại: ${response.statusCode}");
//       print("Nội dung phản hồi: ${response.body}");
//       throw Exception('Failed to check-in guest');
//     }
//   }
// }

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:bookeasy/models/guest.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuestController {
  static const String apiUrl =
      'https://eventcheckinmanagement-h7bggygec8esg5cd.southeastasia-01.azurewebsites.net/api/guest/group/';

  static const String checkInUrl =
      'https://eventcheckinmanagement-h7bggygec8esg5cd.southeastasia-01.azurewebsites.net/api/guestcheckin';

  Future<List<Guest>> fetchGuests(int guestGroupID) async {
    final response = await http.get(Uri.parse('$apiUrl$guestGroupID'),
        headers: {'accept': 'text/plain'});

    if (response.statusCode == 200) {
      // Chuyển đổi dữ liệu từ JSON thành List<Guest>
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      // Kiểm tra nếu phản hồi không chứa trường "$values"
      if (!jsonResponse.containsKey(r'$values')) {
        throw Exception("Dữ liệu không hợp lệ: Không có trường '\$values'");
      }

      // Lấy danh sách dữ liệu từ '$values'
      final List<dynamic> data = jsonResponse[r'$values'];

      // Kiểm tra dữ liệu trống
      if (data.isEmpty) {
        throw Exception("Không có dữ liệu guest group");
      }
      return data.map((guestJson) => Guest.fromJson(guestJson)).toList();
    } else {
      throw Exception('Failed to load guests');
    }
  }

  // Phương thức check-in guest
  Future<void> checkInGuest(int guestID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final verificationToken = prefs.getString('verificationToken');

    final response = await http.post(
      Uri.parse('$checkInUrl/$guestID'),
      headers: {
        'accept': 'text/plain',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $verificationToken'
      },
      body: '',
    );

    if (response.statusCode == 201) {
      print("Check-in thành công!");
    } else {
      // In ra thông tin lỗi chi tiết để dễ chẩn đoán
      print("Check-in thất bại với mã lỗi: ${response.statusCode}");
      print("Nội dung phản hồi: ${response.body}");
      throw Exception('Failed to check-in guest');
    }
  }
}
