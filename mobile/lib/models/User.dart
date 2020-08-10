class User {
  final String name;
  final String email;

  User({this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
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

/*
* [user:{}]
*/
