class User {
  final String userName;
  final String userEmail;

  User({this.userName, this.userEmail});

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
      userName: json['name'],
      userEmail: json['email'],
    );
  }
}

class UserList {
  final List<User> users;

  UserList({this.users});

  factory UserList.fromJson(List<dynamic> parsedJson) {
    List<User> users = List<User>();
    users = parsedJson.map((i) => User.fromJson(i)).toList();

    return UserList(
      users: users,
    );
  }
}
