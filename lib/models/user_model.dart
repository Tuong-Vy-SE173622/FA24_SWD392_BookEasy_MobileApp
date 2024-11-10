class UserModel {
  final String fullName;
  final String userName;
  final String email;
  final String phoneNumber;

  UserModel({
    required this.fullName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
  });

  // Factory method to create a UserModel from JSON response
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'] ?? '',
      userName: json['userName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
    );
  }
}
