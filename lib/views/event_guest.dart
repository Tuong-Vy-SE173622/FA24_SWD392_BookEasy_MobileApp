import 'package:flutter/material.dart';
import 'package:bookeasy/controllers/guest_controller.dart';
import 'package:bookeasy/models/guest.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart'; // Thêm thư viện intl

class GuestListPage extends StatefulWidget {
  final int guestGroupID;
  final int eventID;

  GuestListPage({required this.guestGroupID, required this.eventID});

  @override
  _GuestListPageState createState() => _GuestListPageState();
}

class _GuestListPageState extends State<GuestListPage> {
  late Future<List<Guest>> _guestsFuture;
  late int eventID = widget.guestGroupID;

  @override
  void initState() {
    super.initState();
    _guestsFuture = GuestController().fetchGuests(widget.guestGroupID);
  }

  // Method to fetch guests after check-in
  void _refetchGuests() {
    setState(() {
      _guestsFuture = GuestController().fetchGuests(widget.guestGroupID);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            // Navigator.pop(context);
            context.go('/event/${eventID}');
          },
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 145, 200, 255),
        child: FutureBuilder<List<Guest>>(
          future: _guestsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No guests found.'));
            }

            final guests = snapshot.data!;

            return ListView.builder(
              itemCount: guests.length,
              itemBuilder: (context, index) {
                final guest = guests[index];
                return GuestCard(
                  guest: guest,
                  onCheckInSuccess: _refetchGuests,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// class GuestCard extends StatelessWidget {
//   final Guest guest;
//   final Function onCheckInSuccess;

//   GuestCard({required this.guest, required this.onCheckInSuccess});

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
//                     ClipOval(
//                       child: Image.network(
//                         guest.imageURL,
//                         width: 60,
//                         height: 60,
//                         fit: BoxFit.cover,
//                         errorBuilder: (context, error, stackTrace) {
//                           return Image.asset(
//                             'assets/images/avatar.jpg',
//                             width: 60,
//                             height: 60,
//                             fit: BoxFit.cover,
//                           );
//                         },
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
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: ElevatedButton(
//                     onPressed: guest.checkinStatus
//                         ? null
//                         : () async {
//                             try {
//                               await GuestController()
//                                   .checkInGuest(guest.guestID);
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text('Check-in thành công!')),
//                               );
//                             } catch (e) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                     content: Text('Check-in thất bại: $e')),
//                               );
//                             }
//                           },
//                     child: Text(
//                       'Check-in',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor:
//                           guest.checkinStatus ? Colors.grey : Colors.blueAccent,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Positioned(
//               right: 0,
//               top: 0,
//               child: IconButton(
//                 icon: Icon(Icons.info, color: Colors.blueAccent),
//                 onPressed: () {
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
//                                 errorBuilder: (context, error, stackTrace) {
//                                   return Image.asset(
//                                     'assets/images/avatar.jpg',
//                                     width: 100,
//                                     height: 100,
//                                     fit: BoxFit.cover,
//                                   );
//                                 },
//                               ),
//                             ),
//                             SizedBox(height: 16),
//                             Text('Name: ${guest.name}'),
//                             Text('Email: ${guest.email}'),
//                             Text('Phone: ${guest.phoneNumber}'),
//                             Text('Address: ${guest.address}'),
//                             Text(
//                                 'Birthday: ${DateFormat('dd/MM/yyyy').format(guest.birthday)}'),
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
  final Function onCheckInSuccess; // The callback function

  GuestCard({required this.guest, required this.onCheckInSuccess});

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
                    ClipOval(
                      child: Image.network(
                        guest.imageURL,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
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
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: guest.checkinStatus
                        ? null
                        : () async {
                            try {
                              await GuestController()
                                  .checkInGuest(guest.guestID);

                              // Trigger the callback to refresh the guest list
                              onCheckInSuccess();

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Check-in thành công!')),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Check-in thất bại: $e')),
                              );
                            }
                          },
                    child: Text(
                      'Check-in',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          guest.checkinStatus ? Colors.grey : Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                icon: Icon(Icons.info, color: Colors.blueAccent),
                onPressed: () {
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
                                'Birthday: ${DateFormat('dd/MM/yyyy').format(guest.birthday)}'),
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
