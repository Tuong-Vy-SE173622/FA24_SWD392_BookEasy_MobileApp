// class Event {
//   final int eventID;
//   final String name;
//   final int organizationID;
//   final String organizationName;
//   final DateTime startDate;
//   final DateTime endDate;
//   final String location;
//   final String description;
//   final int capacity;
//   final String status;

//   Event({
//     required this.eventID,
//     required this.name,
//     required this.organizationID,
//     required this.organizationName,
//     required this.startDate,
//     required this.endDate,
//     required this.location,
//     required this.description,
//     required this.capacity,
//     required this.status,
//   });
// }

// List<Event> sampleEvents = [
//   Event(
//     eventID: 1,
//     name: "Khai mạc Hội chợ Xuân 2024",
//     organizationID: 101,
//     organizationName: "Công ty Tổ chức Sự kiện ABC",
//     startDate: DateTime(2024, 1, 15, 9, 0),
//     endDate: DateTime(2024, 1, 15, 17, 0),
//     location: "Trung tâm Hội nghị Quốc gia",
//     description:
//         "Sự kiện khai mạc hội chợ Xuân 2024, quy tụ nhiều doanh nghiệp và nghệ nhân.",
//     capacity: 500,
//     status: "Đang diễn ra",
//   ),
//   Event(
//     eventID: 2,
//     name: "Hội thảo Công nghệ Mới",
//     organizationID: 102,
//     organizationName: "Tập đoàn Công nghệ XYZ",
//     startDate: DateTime(2024, 2, 20, 10, 0),
//     endDate: DateTime(2024, 2, 20, 15, 0),
//     location: "Khách sạn Grand Plaza",
//     description: "Hội thảo về các công nghệ mới trong năm 2024.",
//     capacity: 300,
//     status: "Sắp diễn ra",
//   ),
//   Event(
//     eventID: 3,
//     name: "Hội chợ Sách",
//     organizationID: 103,
//     organizationName: "Nhà xuất bản Văn học",
//     startDate: DateTime(2024, 3, 1, 8, 0),
//     endDate: DateTime(2024, 3, 5, 18, 0),
//     location: "Nhà văn hóa Thanh Niên",
//     description:
//         "Hội chợ sách lớn nhất trong năm, với nhiều hoạt động giao lưu với tác giả.",
//     capacity: 1000,
//     status: "Đã kết thúc",
//   ),
//   Event(
//     eventID: 4,
//     name: "Workshop Nhiếp ảnh",
//     organizationID: 104,
//     organizationName: "Câu lạc bộ Nhiếp ảnh",
//     startDate: DateTime(2024, 4, 12, 9, 30),
//     endDate: DateTime(2024, 4, 12, 12, 30),
//     location: "Phòng Studio ABC",
//     description: "Workshop hướng dẫn kỹ thuật nhiếp ảnh cơ bản và nâng cao.",
//     capacity: 50,
//     status: "Đang diễn ra",
//   ),
//   Event(
//     eventID: 5,
//     name: "Gala Âm nhạc Mùa Hè",
//     organizationID: 105,
//     organizationName: "Tập đoàn Âm nhạc Việt Nam",
//     startDate: DateTime(2024, 5, 25, 18, 0),
//     endDate: DateTime(2024, 5, 25, 22, 0),
//     location: "Sân vận động Quốc gia Mỹ Đình",
//     description: "Gala âm nhạc với sự tham gia của nhiều nghệ sĩ nổi tiếng.",
//     capacity: 20000,
//     status: "Sắp diễn ra",
//   ),
//   Event(
//     eventID: 6,
//     name: "Triển lãm Mỹ thuật Đương đại",
//     organizationID: 106,
//     organizationName: "Hiệp hội Mỹ thuật",
//     startDate: DateTime(2024, 6, 10, 9, 0),
//     endDate: DateTime(2024, 6, 15, 17, 0),
//     location: "Bảo tàng Mỹ thuật Việt Nam",
//     description: "Triển lãm trưng bày các tác phẩm mỹ thuật đương đại.",
//     capacity: 200,
//     status: "Đã kết thúc",
//   ),
//   Event(
//     eventID: 7,
//     name: "Lễ hội Ẩm thực Châu Á",
//     organizationID: 107,
//     organizationName: "Công ty Ẩm thực Toàn Cầu",
//     startDate: DateTime(2024, 7, 20, 11, 0),
//     endDate: DateTime(2024, 7, 22, 21, 0),
//     location: "Công viên Thống Nhất",
//     description:
//         "Lễ hội ẩm thực với các món ăn truyền thống của các nước Châu Á.",
//     capacity: 1500,
//     status: "Đang diễn ra",
//   ),
//   Event(
//     eventID: 8,
//     name: "Ngày hội Thể thao",
//     organizationID: 108,
//     organizationName: "Liên đoàn Thể thao Việt Nam",
//     startDate: DateTime(2024, 8, 15, 8, 0),
//     endDate: DateTime(2024, 8, 15, 18, 0),
//     location: "Sân vận động Thống Nhất",
//     description:
//         "Ngày hội thể thao với nhiều môn thi đấu và trò chơi thể thao.",
//     capacity: 1000,
//     status: "Sắp diễn ra",
//   ),
//   Event(
//     eventID: 9,
//     name: "Diễn đàn Kinh tế Việt Nam",
//     organizationID: 109,
//     organizationName: "Phòng Thương mại và Công nghiệp Việt Nam",
//     startDate: DateTime(2024, 9, 5, 8, 30),
//     endDate: DateTime(2024, 9, 5, 17, 30),
//     location: "Trung tâm Hội nghị Quốc gia",
//     description:
//         "Diễn đàn thảo luận về tình hình kinh tế và xu hướng phát triển trong năm tới.",
//     capacity: 500,
//     status: "Sắp diễn ra",
//   ),
//   Event(
//     eventID: 10,
//     name: "Liên hoan Phim Quốc tế",
//     organizationID: 110,
//     organizationName: "Hiệp hội Điện ảnh Việt Nam",
//     startDate: DateTime(2024, 10, 10, 18, 0),
//     endDate: DateTime(2024, 10, 15, 23, 0),
//     location: "Rạp chiếu phim Quốc gia",
//     description:
//         "Liên hoan phim với sự tham gia của các đoàn làm phim đến từ nhiều quốc gia.",
//     capacity: 800,
//     status: "Đang diễn ra",
//   ),
// ];

// models/event.dart
class Event {
  final int eventID;
  final String name;
  final int organizationID;
  final String organizationName;
  final DateTime startDate;
  final DateTime endDate;
  final String location;
  final String description;
  final int capacity;
  final String status;

  Event({
    required this.eventID,
    required this.name,
    required this.organizationID,
    required this.organizationName,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.description,
    required this.capacity,
    required this.status,
  });

  // Hàm từ JSON
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventID: json['eventID'],
      name: json['name'],
      organizationID: json['organizationID'],
      organizationName: json['organizationName'] ?? '', // Có thể null
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      location: json['location'],
      description: json['description'],
      capacity: json['capacity'],
      status: json['status'],
    );
  }
}
