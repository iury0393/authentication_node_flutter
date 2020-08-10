import 'package:authentication/components/user_card.dart';
import 'package:authentication/models/User.dart';
import 'package:authentication/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MainScreen extends StatefulWidget {
  static const String id = '/main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  UserList userList;
  AuthModel _authModel = AuthModel();

  Future getNameLogged() async {
    var jsonUsers = await _authModel.getAllUsers();
    userList = UserList.fromJson(jsonUsers);

    print(userList.users[0].name);
    print(userList.users[0].email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlAuth'),
        leading: IconButton(
          icon: Icon(FeatherIcons.logOut),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //getName();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: UserCard(),
      ),
    );
  }
}
