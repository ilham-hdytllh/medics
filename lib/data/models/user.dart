class UserModel {
  final String name;
  final String email;
  final String address;
  final String phone;

  UserModel({
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
  });

  // Static function to create an empty UserModel
  static UserModel empty() => UserModel(
        name: "",
        email: "",
        address: "",
        phone: "",
      );

  // Convert model to JSON structure
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'phone': phone,
    };
  }

  // Factory method to create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      address: json["address"] ?? "",
      phone: json["phone"] ?? "",
    );
  }
}
