import 'package:flutter/material.dart';
import 'package:bookeasy/models/group_guest.dart';
import 'package:go_router/go_router.dart';

class EventGroupGuestPage extends StatelessWidget {
  final int eventID;
  final String eventName;

  EventGroupGuestPage({required this.eventID, required this.eventName});

  @override
  Widget build(BuildContext context) {
    final groupGuests = generateSampleGroupGuests(eventID, eventName);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Event',
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
            context.go('/home');
          },
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 145, 200, 255),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   eventName,
            //   style: TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: groupGuests.length,
                itemBuilder: (context, index) {
                  final groupGuest = groupGuests[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          // Thêm biểu tượng tổ chức
                          Icon(
                            Icons.apartment,
                            size: 40,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(
                              width:
                                  16), // Khoảng cách giữa biểu tượng và thông tin
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  groupGuest.name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.business,
                                        size: 16, color: Colors.grey),
                                    SizedBox(width: 4),
                                    Text(
                                      groupGuest.organizationName,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.label,
                                        size: 16, color: Colors.grey),
                                    SizedBox(width: 4),
                                    Text(
                                      groupGuest.type,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Nút chi tiết
                          ElevatedButton(
                            onPressed: () {
                              // Chuyển trang với guestGroupID
                              context.go('/guest/${groupGuest.guestGroupID}');
                            },
                            child: Text(
                              'Details',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
