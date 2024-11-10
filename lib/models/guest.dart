class Guest {
  final int guestID;
  final int guestGroupID;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final DateTime birthday;
  final String imageURL;
  final bool checkinStatus;

  Guest(
      {required this.guestID,
      required this.guestGroupID,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.address,
      required this.birthday,
      required this.imageURL,
      required this.checkinStatus});

  // Tạo một factory method để chuyển đổi từ dữ liệu JSON nhận được từ API
  factory Guest.fromJson(Map<String, dynamic> json) {
    return Guest(
        guestID: json['guestID'],
        guestGroupID: json['guestGroupID'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        address: json['address'],
        birthday: DateTime.parse(json['birthday']),
        imageURL: json['imageURL'] ?? '',
        checkinStatus: json['checkinStatus']);
  }
}
