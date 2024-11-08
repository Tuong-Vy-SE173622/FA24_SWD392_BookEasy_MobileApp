import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bookeasy/models/guest.dart';
import 'package:intl/intl.dart'; // Thêm thư viện intl

class GuestListPage extends StatelessWidget {
  final int guestGroupID;

  GuestListPage({required this.guestGroupID});

  @override
  Widget build(BuildContext context) {
    final guests =
        generateSampleGuests(guestGroupID); // Lấy dữ liệu từ guestGroupID

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Guests',
          style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 27),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go('/event/$guestGroupID');
          },
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 145, 200, 255), // Thêm màu nền
        child: ListView.builder(
          itemCount: guests.length,
          itemBuilder: (context, index) {
            final guest = guests[index];
            return GuestCard(guest: guest);
          },
        ),
      ),
    );
  }
}

// class GuestCard extends StatelessWidget {
//   final Guest guest;

//   GuestCard({required this.guest});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 Row(
//                   children: [
//                     // Hình ảnh của khách
//                     ClipOval(
//                       child: Image.network(
//                         guest.imageURL,
//                         width: 60,
//                         height: 60,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     SizedBox(width: 16),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             guest.name,
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Row(
//                             children: [
//                               Icon(Icons.phone, color: Colors.grey),
//                               SizedBox(width: 4),
//                               Text(
//                                 guest.phoneNumber,
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Icon(Icons.email, color: Colors.grey),
//                               SizedBox(width: 4),
//                               Text(
//                                 guest.email,
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 8),
//                 // Nút Check-in
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Xử lý check-in
//                     },
//                     child: Text(
//                       'Check-in',
//                       style: TextStyle(color: Colors.white), // Màu chữ trắng
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blueAccent,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             // Nút Xem chi tiết thông tin khách
//             Positioned(
//               right: 0,
//               top: 0,
//               child: IconButton(
//                 icon: Icon(Icons.info, color: Colors.blueAccent),
//                 onPressed: () {
//                   // Hiển thị popup thông tin chi tiết khách
//                   showDialog(
//                     context: context,
//                     builder: (context) {
//                       return AlertDialog(
//                         title: Text('Guest Details'),
//                         content: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             ClipOval(
//                               child: Image.network(
//                                 guest.imageURL,
//                                 width: 100,
//                                 height: 100,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             SizedBox(height: 16),
//                             Text('Name: ${guest.name}'),
//                             Text('Email: ${guest.email}'),
//                             Text('Phone: ${guest.phoneNumber}'),
//                             Text('Address: ${guest.address}'),
//                             Text(
//                                 'Birthday: ${DateFormat('dd/MM/yyyy').format(guest.birthday)}'), // Định dạng ngày
//                           ],
//                         ),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: Text('Close'),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class GuestCard extends StatelessWidget {
  final Guest guest;

  GuestCard({required this.guest});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    // Hình ảnh của khách
                    ClipOval(
                      child: Image.network(
                        guest.imageURL,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Khi không thể tải ảnh từ URL, sử dụng ảnh mặc định từ assets
                          return Image.asset(
                            'assets/images/avatar.jpg',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            guest.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.phone, color: Colors.grey),
                              SizedBox(width: 4),
                              Text(
                                guest.phoneNumber,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.email, color: Colors.grey),
                              SizedBox(width: 4),
                              Text(
                                guest.email,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // Nút Check-in
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Xử lý check-in
                    },
                    child: Text(
                      'Check-in',
                      style: TextStyle(color: Colors.white), // Màu chữ trắng
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Nút Xem chi tiết thông tin khách
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                icon: Icon(Icons.info, color: Colors.blueAccent),
                onPressed: () {
                  // Hiển thị popup thông tin chi tiết khách
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Guest Details'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipOval(
                              child: Image.network(
                                guest.imageURL,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/avatar.jpg',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 16),
                            Text('Name: ${guest.name}'),
                            Text('Email: ${guest.email}'),
                            Text('Phone: ${guest.phoneNumber}'),
                            Text('Address: ${guest.address}'),
                            Text(
                                'Birthday: ${DateFormat('dd/MM/yyyy').format(guest.birthday)}'), // Định dạng ngày
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
