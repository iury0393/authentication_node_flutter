class User {
  String id;
  String name;
  String email;

  User({
    this.id,
    this.name,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

class Token {
  User user;
  String token;

  Token({this.user, this.token});

  factory Token.fromJson(Map<String, dynamic> parsedJson) {
    return Token(
      token: parsedJson['token'],
      user: User.fromJson(parsedJson['user']),
    );
  }
}

/*
* {user: {name: , email:}, token: }
*/
