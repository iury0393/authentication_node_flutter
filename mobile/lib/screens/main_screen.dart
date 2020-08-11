import 'package:authentication/components/user_card.dart';
import 'package:authentication/models/User.dart';
import 'package:authentication/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MainScreen extends StatefulWidget {
  static const String id = '/main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  UserList userList;
  AuthModel _authModel = AuthModel();
  bool showSpinner = false;
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
      setState(() {
        showSpinner = true;
      });
      var jsonUsers = await _authModel.getAllUsers();

      if (jsonUsers != null) {
        setState(() {
          showSpinner = false;
        });
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
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: ListView.builder(
            itemCount: showSpinner ? 1 : userList.users.length,
            itemBuilder: (context, index) {
              return UserCard(
                  name: showSpinner ? 'Usuário' : userList.users[index].name,
                  email: showSpinner ? 'Email' : userList.users[index].email);
            },
          ),
        ),
      ),
    );
  }
}
