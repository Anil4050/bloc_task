class UserModel {
  final String id;
  final String name;
  final String mobile;

  UserModel({required this.id, required this.name, required this.mobile});

  factory UserModel.fromMap(Map<String, dynamic> data, String id) {
    return UserModel(
      id: id,
      name: data["name"] ?? "",
      mobile: data["mobile"] ?? "",
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "mobile": mobile,
    };
  }
}
