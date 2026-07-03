class UserModal {
  final bool success;
  final String message;
  final Data data;

  UserModal({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UserModal.fromJson(Map<String, dynamic> json) => UserModal(
        success: json["success"] ?? false,
        message: json["message"] ?? '',
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  final List<User> users;

  Data({required this.users});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        users: json["users"] == null
            ? []
            : List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );
}

class User {
  final int id;
  final String fullName;
  final String mobile;
  final String? email;
  final String? profilePhoto;
  final int isActive;
  final String? companyName;
  final String roleName;

  User({
    required this.id,
    required this.fullName,
    required this.mobile,
    this.email,
    this.profilePhoto,
    required this.isActive,
    this.companyName,
    required this.roleName,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        fullName: json["full_name"] ?? "",
        mobile: json["mobile"] ?? "",
        email: json["email"],
        profilePhoto: json["profile_photo"],
        isActive: json["is_active"] ?? 0,
        companyName: json["company_name"],
        roleName: json["role_name"] ?? "",
      );
}

void main() {
  final Map<String, dynamic> jsonData = {
    "success": true,
    "message": "Users retrieved successfully.",
    "data": {
      "users": [
        {
          "id": 82,
          "full_name": "Supriya Kumari",
          "mobile": "9549889700",
          "email": "supriyasingh@gmail.com",
          "profile_photo": null,
          "is_active": 1,
          "company_name": "Beyondwud",
          "role_name": "ACCOUNTS"
        },
        {
          "id": 81,
          "full_name": "Anjali Kumari",
          "mobile": "9876543210",
          "email": null,
          "profile_photo": null,
          "is_active": 1,
          "company_name": null,
          "role_name": "CUSTOMER"
        },
      ]
    }
  };

  UserModal response = UserModal.fromJson(jsonData);

  if (response.data.users.isNotEmpty) {
    print("Id: ${response.data.users[0].id}");
    print("isActive: ${response.data.users[0].isActive}");
    print("Full Name: ${response.data.users[0].fullName}");
    print("Company Name: ${response.data.users[0].companyName}");
    print("Mobile: ${response.data.users[0].mobile}");
    print("Role: ${response.data.users[0].roleName}");
    print("Profile Photo: ${response.data.users[0].profilePhoto}");
  } else {
    print("No users found");
  }
}
