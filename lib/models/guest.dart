class Guest {
  final int guestID;
  final int guestGroupID;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final DateTime birthday;
  final String imageURL;

  Guest({
    required this.guestID,
    required this.guestGroupID,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.birthday,
    required this.imageURL,
  });
}

List<Guest> generateSampleGuests(int guestGroupID) {
  return [
    Guest(
      guestID: 1,
      guestGroupID: guestGroupID,
      name: 'John Doe',
      email: 'john.doe@example.com',
      phoneNumber: '+1234567890',
      address: '123 Main Street, City, Country',
      birthday: DateTime(1990, 5, 20),
      imageURL:
          'https://i.pinimg.com/736x/41/c8/07/41c80760a4ddd1e976b0e165f65f1351.jpg',
    ),
    Guest(
      guestID: 2,
      guestGroupID: guestGroupID,
      name: 'Jane Smith',
      email: 'jane.smith@example.com',
      phoneNumber: '+1234567891',
      address: '456 Oak Avenue, City, Country',
      birthday: DateTime(1985, 8, 15),
      imageURL:
          'https://i.pinimg.com/736x/41/c8/07/41c80760a4ddd1e976b0e165f65f1351.jpg',
    ),
    Guest(
      guestID: 3,
      guestGroupID: guestGroupID,
      name: 'Alice Johnson',
      email: 'alice.johnson@example.com',
      phoneNumber: '+1234567892',
      address: '789 Pine Road, City, Country',
      birthday: DateTime(1992, 11, 2),
      imageURL:
          'https://i.pinimg.com/736x/41/c8/07/41c80760a4ddd1e976b0e165f65f1351.jpg',
    ),
    Guest(
      guestID: 4,
      guestGroupID: guestGroupID,
      name: 'Bob Brown',
      email: 'bob.brown@example.com',
      phoneNumber: '+1234567893',
      address: '123 Birch Lane, City, Country',
      birthday: DateTime(1988, 3, 25),
      imageURL:
          'https://i.pinimg.com/736x/41/c8/07/41c80760a4ddd1e976b0e165f65f1351.jpg',
    ),
    Guest(
      guestID: 5,
      guestGroupID: guestGroupID,
      name: 'Eve White',
      email: 'eve.white@example.com',
      phoneNumber: '+1234567894',
      address: '456 Cedar Crescent, City, Country',
      birthday: DateTime(1995, 12, 10),
      imageURL:
          'https://i.pinimg.com/736x/41/c8/07/41c80760a4ddd1e976b0e165f65f1351.jpg',
    ),
    Guest(
      guestID: 6,
      guestGroupID: guestGroupID,
      name: 'Charlie Green',
      email: 'charlie.green@example.com',
      phoneNumber: '+1234567895',
      address: '789 Maple Drive, City, Country',
      birthday: DateTime(1990, 7, 17),
      imageURL:
          'https://i.pinimg.com/736x/41/c8/07/41c80760a4ddd1e976b0e165f65f1351.jpg',
    ),
    Guest(
      guestID: 7,
      guestGroupID: guestGroupID,
      name: 'David Black',
      email: 'david.black@example.com',
      phoneNumber: '+1234567896',
      address: '1010 Elm Street, City, Country',
      birthday: DateTime(1987, 9, 30),
      imageURL:
          'https://i.pinimg.com/736x/41/c8/07/41c80760a4ddd1e976b0e165f65f1351.jpg',
    ),
    Guest(
      guestID: 8,
      guestGroupID: guestGroupID,
      name: 'Grace Blue',
      email: 'grace.blue@example.com',
      phoneNumber: '+1234567897',
      address: '2020 Oak Hill, City, Country',
      birthday: DateTime(1993, 4, 12),
      imageURL:
          'https://i.pinimg.com/736x/41/c8/07/41c80760a4ddd1e976b0e165f65f1351.jpg',
    ),
    Guest(
      guestID: 9,
      guestGroupID: guestGroupID,
      name: 'Hank Red',
      email: 'hank.red@example.com',
      phoneNumber: '+1234567898',
      address: '3030 Cherry Blossom, City, Country',
      birthday: DateTime(1989, 6, 5),
      imageURL:
          'https://i.pinimg.com/736x/41/c8/07/41c80760a4ddd1e976b0e165f65f1351.jpg',
    ),
    Guest(
      guestID: 10,
      guestGroupID: guestGroupID,
      name: 'Ivy Yellow',
      email: 'ivy.yellow@example.com',
      phoneNumber: '+1234567899',
      address: '4040 Pineapple Avenue, City, Country',
      birthday: DateTime(1994, 2, 22),
      imageURL:
          'https://i.pinimg.com/736x/41/c8/07/41c80760a4ddd1e976b0e165f65f1351.jpg',
    ),
  ];
}
