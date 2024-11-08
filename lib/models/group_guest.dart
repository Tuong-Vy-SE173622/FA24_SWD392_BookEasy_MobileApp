class GroupGuest {
  final int guestGroupID;
  final int organizationID;
  final String organizationName;
  final String type;
  final int eventID;
  final String eventName;
  final String name;

  GroupGuest({
    required this.guestGroupID,
    required this.organizationID,
    required this.organizationName,
    required this.type,
    required this.eventID,
    required this.eventName,
    required this.name,
  });
}

// Tạo dữ liệu mẫu cho group guests
List<GroupGuest> generateSampleGroupGuests(int eventID, String eventName) {
  return [
    GroupGuest(
      guestGroupID: 1,
      organizationID: 101,
      organizationName: 'Organization A',
      type: 'VIP',
      eventID: eventID,
      eventName: eventName,
      name: 'Guest Group 1',
    ),
    GroupGuest(
      guestGroupID: 2,
      organizationID: 102,
      organizationName: 'Organization B',
      type: 'Regular',
      eventID: eventID,
      eventName: eventName,
      name: 'Guest Group 2',
    ),
    GroupGuest(
      guestGroupID: 3,
      organizationID: 103,
      organizationName: 'Organization C',
      type: 'VIP',
      eventID: eventID,
      eventName: eventName,
      name: 'Guest Group 3',
    ),
    GroupGuest(
      guestGroupID: 4,
      organizationID: 104,
      organizationName: 'Organization D',
      type: 'Special',
      eventID: eventID,
      eventName: eventName,
      name: 'Guest Group 4',
    ),
    GroupGuest(
      guestGroupID: 5,
      organizationID: 105,
      organizationName: 'Organization E',
      type: 'Regular',
      eventID: eventID,
      eventName: eventName,
      name: 'Guest Group 5',
    ),
    GroupGuest(
      guestGroupID: 6,
      organizationID: 106,
      organizationName: 'Organization F',
      type: 'VIP',
      eventID: eventID,
      eventName: eventName,
      name: 'Guest Group 6',
    ),
    GroupGuest(
      guestGroupID: 7,
      organizationID: 107,
      organizationName: 'Organization G',
      type: 'Special',
      eventID: eventID,
      eventName: eventName,
      name: 'Guest Group 7',
    ),
    GroupGuest(
      guestGroupID: 8,
      organizationID: 108,
      organizationName: 'Organization H',
      type: 'Regular',
      eventID: eventID,
      eventName: eventName,
      name: 'Guest Group 8',
    ),
    GroupGuest(
      guestGroupID: 9,
      organizationID: 109,
      organizationName: 'Organization I',
      type: 'VIP',
      eventID: eventID,
      eventName: eventName,
      name: 'Guest Group 9',
    ),
    GroupGuest(
      guestGroupID: 10,
      organizationID: 110,
      organizationName: 'Organization J',
      type: 'Regular',
      eventID: eventID,
      eventName: eventName,
      name: 'Guest Group 10',
    ),
  ];
}
