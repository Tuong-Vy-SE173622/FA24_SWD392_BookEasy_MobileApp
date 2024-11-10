// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../controllers/event_controller.dart';
// import '../models/event.dart';
// import 'package:go_router/go_router.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final EventController _eventController = EventController();
//   late Future<List<Event>> _events;

//   @override
//   void initState() {
//     super.initState();
//     _events = _eventController.fetchEvents();
//   }

//   String formatDateTime(DateTime dateTime) {
//     return DateFormat('dd-MM-yyyy HH:mm').format(dateTime);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Image.asset(
//           'assets/images/BookEasy2.png',
//           width: 180,
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 6,
//       ),
//       body: Container(
//         color: Color.fromARGB(255, 145, 200, 255),
//         child: FutureBuilder<List<Event>>(
//           future: _events,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return Center(child: Text('No events found.'));
//             }

//             final events = snapshot.data!;
//             return ListView.builder(
//               padding: EdgeInsets.all(12),
//               itemCount: events.length,
//               itemBuilder: (context, index) {
//                 final event = events[index];
//                 return GestureDetector(
//                   onTap: () {
//                     // Điều hướng đến trang chi tiết sự kiện
//                     context.go('/event/${event.eventID}');
//                   },
//                   child: Card(
//                     margin: EdgeInsets.symmetric(vertical: 8),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     elevation: 4,
//                     child: Padding(
//                       padding: EdgeInsets.all(16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Tên sự kiện
//                           Text(
//                             event.name,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               color: Colors.blueAccent,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           // Tên tổ chức
//                           Row(
//                             children: [
//                               Icon(Icons.business, color: Colors.grey),
//                               SizedBox(width: 5),
//                               Expanded(
//                                 child: Text(
//                                   event.organizationName,
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 8),
//                           // Địa điểm
//                           Row(
//                             children: [
//                               Icon(Icons.location_on, color: Colors.red),
//                               SizedBox(width: 5),
//                               Expanded(
//                                 child: Text(
//                                   event.location,
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 8),
//                           // Thời gian bắt đầu và kết thúc
//                           Row(
//                             children: [
//                               Icon(Icons.access_time, color: Colors.green),
//                               SizedBox(width: 5),
//                               Text(
//                                 '${formatDateTime(event.startDate)} -> ${formatDateTime(event.endDate)}',
//                                 style: TextStyle(
//                                     fontSize: 14, color: Colors.black54),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 8),
//                           // Trạng thái sự kiện
//                           Row(
//                             children: [
//                               Icon(
//                                 event.status == 'Đang diễn ra'
//                                     ? Icons.check_circle
//                                     : Icons.schedule,
//                                 color: event.status == 'Đang diễn ra'
//                                     ? Colors.green
//                                     : Colors.orange,
//                               ),
//                               SizedBox(width: 5),
//                               Text(
//                                 event.status,
//                                 style: TextStyle(
//                                   color: event.status == 'Đang diễn ra'
//                                       ? Colors.green
//                                       : Colors.orange,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Divider(),
//                           // Sức chứa
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Sức chứa:',
//                                 style: TextStyle(
//                                     fontSize: 14, fontWeight: FontWeight.w500),
//                               ),
//                               Text(
//                                 '${event.capacity} người',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.blueAccent,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../controllers/event_controller.dart';
import '../models/event.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EventController _eventController = EventController();
  late Future<List<Event>> _events;

  @override
  void initState() {
    super.initState();
    _events = _eventController.fetchEvents();
  }

  String formatDateTime(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy HH:mm').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/BookEasy2.png',
          width: 180,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 6,
      ),
      body: Container(
        color: Color.fromARGB(255, 145, 200, 255),
        child: FutureBuilder<List<Event>>(
          future: _events,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No events found.'));
            }

            final events = snapshot.data!;
            return ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to the EventGroupGuestPage with the correct eventID
                    context.go('/event/${event.eventID}');
                    print('/event/${event.eventID}');
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blueAccent,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.business, color: Colors.grey),
                              SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  event.organizationName,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.red),
                              SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  event.location,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.access_time, color: Colors.green),
                              SizedBox(width: 5),
                              Text(
                                '${formatDateTime(event.startDate)} -> ${formatDateTime(event.endDate)}',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black54),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                event.status == 'Đang diễn ra'
                                    ? Icons.check_circle
                                    : Icons.schedule,
                                color: event.status == 'Đang diễn ra'
                                    ? Colors.green
                                    : Colors.orange,
                              ),
                              SizedBox(width: 5),
                              Text(
                                event.status,
                                style: TextStyle(
                                  color: event.status == 'Đang diễn ra'
                                      ? Colors.green
                                      : Colors.orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sức chứa:',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '${event.capacity} người',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.blueAccent),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
