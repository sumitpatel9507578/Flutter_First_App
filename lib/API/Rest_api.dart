// class productsModal {
//   int id;
//   String name;
//   int age;
//   String email;
//   String phone;
//   String username;
//   String password;
//   String birthdate;
//   String image;
//   String bloodGroup;
//   String height;
//   String weight;
//   String eyeColor;
//   String hair;
//   String ip;
//   String address;
//   String coordinates;
//   String macAddress;
//   String university;
//   String bank;
//   String company;
//   String companyAddress;
//   String companyCoordinates;
//   String ein;
//   String ssn;
//   String userAgent;
//   String crypto;
//   String role;
//
//   productsModal({
//     required this.id,
//     required this.name,
//     required this.age,
//     required this.email,
//     required this.phone,
//     required this.username,
//     required this.password,
//     required this.birthdate,
//     required this.image,
//     required this.bloodGroup,
//     required this.height,
//     required this.weight,
//     required this.eyeColor,
//     required this.hair,
//     required this.ip,
//     required this.address,
//     required this.coordinates,
//     required this.macAddress,
//     required this.university,
//     required this.bank,
//     required this.company,
//     required this.companyAddress,
//     required this.companyCoordinates,
//     required this.ein,
//     required this.ssn,
//     required this.userAgent,
//     required this.crypto,
//     required this.role,
//
//   });
//
//   factory productsModal.fromJson(Map<String, dynamic> json) => productsModal(
//     id: json["id"]??0,
//     name: "${json["firstName"]??''} ${json["lastName"]} ${json["maidenName"]??''}",
//     age: (json["age"]as num?)?.toInt()??0,
//     email: json["email"]?.toString()??'',
//     phone: json["phone"]?.toString()??'',
//     username: json["username"]?.toString()??'',
//     password: json["password"]?.toString()??'',
//     birthdate: json["birthdate"]?.toString()??'',
//     image: json["image"]?.toString()??"",
//     bloodGroup: json["bloodGroup"]?.toString()??'',
//     height: json["height"]?.toString()??'',
//     weight: json["weight"]?.toString()??'',
//       eyeColor: json["eyeColor"]?.toString()??'',
//     hair: "${json["hair"]?["color"]?.toString()??''}, ${json["hair"]?["type"]?.toString()??''}",
//     ip: json["ip"]?.toString()??'',
//     address:
//         " ${json["address"]?["city"]?.toString()??''} , "
//         "${json["address"]?["state"]?.toString()??''} ,"
//         " ${json["address"]?["stateCode"]?.toString()??''} ,"
//         "${json["address"]?["postalCode"]?.toString()??''} ,"
//         "${json["address"]?["country"]?.toString()??''}",
//     coordinates: "Lat: ${json["address"]?["coordinates"]?["lat"]??''}, "
//         "Lng: ${json["address"]?["coordinates"]?["lng"]??''}",
//     macAddress: json["macAddress"]?.toString()??'',
//     university: json["university"]?.toString()??'',
//     bank: "${json["bank"]?["cardExpire"]?.toString()??''}, "
//         "${json["bank"]?["cardNumber"]?.toString()??''}, "
//         "${json["bank"]?["cardType"]?.toString()??''}, "
//         "${json["bank"]?["currency"]?.toString()??''}, "
//         "${json["bank"]?["iban"]?.toString()??''}",
//     company: "${json["company"]?["department"]?.toString()??''}, "
//         "${json["company"]?["name"]?.toString()??''}, "
//         "${json["company"]?["title"]?.toString()??''}, ",
//     companyAddress:
//     "${json["company"]?["address"]?["address"] ?? ''}, "
//         "${json["company"]?["address"]?["city"] ?? ''}, "
//         "${json["company"]?["address"]?["state"] ?? ''}, "
//         "${json["company"]?["address"]?["stateCode"] ?? ''}, "
//         "${json["company"]?["address"]?["postalCode"] ?? ''}, "
//         "${json["company"]?["address"]?["country"] ?? ''}",
//     companyCoordinates:
//     "Lat: ${json["company"]?["address"]?["coordinates"]?["lat"] ?? ''}, "
//         "Lng: ${json["company"]?["address"]?["coordinates"]?["lng"] ?? ''}",
//     ein: json["ein"]?.toString()??'',
//     ssn: json["ssn"]?.toString()??'',
//     userAgent: json["userAgent"]?.toString()??'',
//     crypto:
//     "Coin: ${json["crypto"]?["coin"] ?? ''}, "
//         "Wallet: ${json["crypto"]?["wallet"] ?? ''}, "
//         "Network: ${json["crypto"]?["network"] ?? ''}",
//     role: json["role"]?.toString()??'',
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "age":age,
//     "email": email,
//     "category":phone,
//     "image":image,
//     "height":height,
//     "weight":weight,
//     "eyeColors": eyeColor,
//   "hair": hair,
//   "ip": ip,
//   "address": address,
//   "coordinates": coordinates,
//   "macAddress": macAddress,
//   "university": university,
//   "bank": bank,
//   "company": company,
//   "companyAddress": companyAddress,
//   "companyCoordinates": companyCoordinates,
//   "ein": ein,
//   "ssn": ssn,
//   "userAgent": userAgent,
//   "crypto": crypto,
//   "role": role,
//   };
// }

// class productsModal {
//   final bool success;
//   final String message;
//   final Data data;
//
//   productsModal({
//     required this.success,
//     required this.message,
//     required this.data,
//   });
//
//   factory productsModal.fromJson(Map<String, dynamic> json) => productsModal(
//     success: json["success"] ?? false,
//     message: json["message"] ?? '',
//     data: Data.fromJson(json["data"] ?? {}),
//   );
// }
//
// class Data {
//   final List<User> users;
//
//   Data({required this.users});
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     users: json["users"] == null
//         ? []
//         : List<User>.from(json["users"].map((x) => User.fromJson(x))),
//   );
// }
//
// class User {
//   final int id;
//   final String fullName;
//   final String mobile;
//   final String? email;
//   final String? profilePhoto;
//   final int isActive;
//   final String? companyName;
//   final String roleName;
//
//   User({
//     required this.id,
//     required this.fullName,
//     required this.mobile,
//     this.email,
//     this.profilePhoto,
//     required this.isActive,
//     this.companyName,
//     required this.roleName,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     id: json["id"] ?? 0,
//     fullName: json["full_name"] ?? "",
//     mobile: json["mobile"] ?? "",
//     email: json["email"],
//     profilePhoto: json["profile_photo"],
//     isActive: json["is_active"] ?? 0,
//     companyName: json["company_name"],
//     roleName: json["role_name"] ?? "",
//   );
// }

class ProductsModel {
  final String message;
  final List<User> data;

  ProductsModel({
    required this.message,
    required this.data,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      message: json["message"] ?? "",
      data:json["data"] == null
          ? []
          : List<User>.from(
        json["data"].map((x) => User.fromJson(x)),
      ),
    );
  }

}

class Data {
  final List<User> users;

  Data({
    required this.users,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      users: json["users"] == null
          ? []
          : List<User>.from(
        json["users"].map((x) => User.fromJson(x)),
      ),
    );
  }
}

class User {
  final int empId;
  final String empName;
  final String? empEmail;
  final String empPhone;
  final String? empDepartment;
  final String? empSalary;
  final String? empHire;

  User({
    required this.empId,
    required this.empName,
    required this.empEmail,
    required this.empPhone,
    required this.empDepartment,
    required this.empSalary,
    required this.empHire,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      empId: json["emp_id"] ?? 0,
      empName: json["emp_name"] ?? "",
      empEmail: json["emp_email"],
      empPhone: json["emp_phone"] ?? "",
      empDepartment: json["emp_department"],
      empSalary: json["emp_salary"] ?? 0,
      empHire: json["hire_date"] ?? "",
    );
  }

}