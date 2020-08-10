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
  int index;
  String name;
  String email;

  @override
  void initState() {
    super.initState();
    getNameLogged();
  }

  Future getNameLogged() async {
    try {
      var jsonUsers = await _authModel.getAllUsers();

      if (jsonUsers != null) {
        userList = UserList.fromJson(jsonUsers);
      }
    } catch (e) {
      print(e);
    }
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
      body: SafeArea(
        child: ListView.builder(
          itemCount: userList.users.length,
          itemBuilder: (context, index) {
            return UserCard(
              name: userList.users[index].name,
              email: userList.users[index].email,
            );
          },
        ),
      ),
    );
  }
}
