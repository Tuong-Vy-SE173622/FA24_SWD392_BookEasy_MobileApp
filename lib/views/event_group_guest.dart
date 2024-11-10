import 'package:flutter/material.dart';
import 'package:bookeasy/controllers/group_guest_controller.dart';
import 'package:bookeasy/models/group_guest.dart';
import 'package:go_router/go_router.dart';

class EventGroupGuestPage extends StatefulWidget {
  final int eventID;
  final String eventName;

  EventGroupGuestPage({required this.eventID, required this.eventName});

  @override
  _EventGroupGuestPageState createState() => _EventGroupGuestPageState();
}

class _EventGroupGuestPageState extends State<EventGroupGuestPage> {
  late Future<List<GroupGuest>> _groupGuests;
  final GroupGuestController _controller = GroupGuestController();

  @override
  void initState() {
    super.initState();
    print("EventID passed: ${widget.eventID}");
    _groupGuests = _controller.fetchGroupGuests(widget.eventID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.eventName,
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
        child: FutureBuilder<List<GroupGuest>>(
          future: _groupGuests,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print(
                  "Error fetching group guests: ${snapshot.error}"); // Debugging
              return Center(child: Text("Đã xảy ra lỗi: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("Không có nhóm khách nào"));
            } else {
              final groupGuests = snapshot.data!;
              return ListView.builder(
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
                          Icon(
                            Icons.apartment,
                            size: 40,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  groupGuest.name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.business,
                                        size: 16, color: Colors.grey),
                                    SizedBox(width: 4),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          groupGuest.organizationName,
                                          style: TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.label,
                                        size: 16, color: Colors.grey),
                                    SizedBox(width: 4),
                                    Text(groupGuest.type,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // context.go(
                              //     '/guest/${groupGuest.guestGroupID}?eventID=${widget.eventID}');
                              context.go(
                                  '/guest/${groupGuest.guestGroupID}?eventID=${widget.eventID}');
                            },
                            child: Text('Details',
                                style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
