class UserModal {
  String name;
  String email,add;
  String phone;
  String profilePic;

  UserModal(
      this.name,
      this.email,
      this.add,
      this.phone,
      this.profilePic,
      );
}

class UserHelper {
  List<UserModal> _users = [];

  void addUser() {
    _users.add(
      UserModal(
        "Sumit Patel",
        "sumit@gmail.com",
        "hussepur",
        "9631049569",
        "assets/images/Marvel.png",

      ),
    );

    _users.add(
      UserModal(
        "Amit Patel",
        "amit@gmail.com",
        "hussepur",
        "9507484442",
        "assets/images/img_1.png".toString(),

      ),
    );

    _users.add(
      UserModal(
        "Rahul Kumar",
        "rahul@gmail.com",
        "hussepur",
        "9876543210",
        "assets/images/Tiger.png".toString(),

      ),
    );
  }

  List<UserModal> get users => _users;

  void updateUser(){


  }
}

void main() {
  UserHelper helper = UserHelper();
  helper.addUser();

}