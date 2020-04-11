import 'package:flutter/material.dart';
import 'package:flutter_auth0/flutter_auth0.dart';
import '../my_shared_preferences.dart';

import 'package:swagger/api.dart';

class PKCEPage extends StatefulWidget {
  final auth;
  final Function showInfo;
  const PKCEPage(this.auth, this.showInfo);
  @override
  _PKCEPageState createState() => _PKCEPageState();
}

class _PKCEPageState extends State<PKCEPage> {
  bool webLogged;
  dynamic currentWebAuth;

  @override
  void initState() {
    super.initState();
    webLogged = false;
  }

  Auth0 get auth {
    return widget.auth;
  }

  Function get showInfo {
    return widget.showInfo;
  }

  void webLogin() async {
    try {
      var response = await auth.webAuth.authorize({
        //'audience': 'https://${auth.auth.client.domain}/userinfo',
        // 'scope': 'openid email offline_access',
        'scope': 'openid profile email',
      });
      DateTime now = DateTime.now();
      showInfo('Web Login', '''
      \ntoken_type: ${response['token_type']}
      \nexpires_in: ${DateTime.fromMillisecondsSinceEpoch(response['expires_in'] + now.millisecondsSinceEpoch)}
      \nindentityToken: ${response['id_token']}
      \nrefreshToken: ${response['refresh_token']}
      \naccess_token: ${response['access_token']}
      ''');

      await MySharedPreference.init();
      MySharedPreference.setIdToken(response['id_token']);
      Configuration.IdAccessToken = MySharedPreference.getIdToken();

      testFunc();
      webLogged = true;
      currentWebAuth = Map.from(response);
      setState(() {});

      Navigator.pushNamed(context, 'blogScreen');
    } catch (e) {
      print('Error: $e');
    }
  }

  void testFunc() async {
    Configuration.IdAccessToken = MySharedPreference.getIdToken();

    var api_instance = new PostsApi();
    try {
      var result = await api_instance.postsGet();
      print(result);
    } catch (e) {
      print("Exception when calling PostsApi->postsGet: $e\n");
    }
  }

  void webRefreshToken() async {
    try {
      var response = await auth.webAuth.client.refreshToken({
        'refreshToken': currentWebAuth['refresh_token'],
      });
      DateTime now = DateTime.now();
      showInfo('Refresh Token', '''
      \ntoken_type: ${response['token_type']}
      \nexpires_in: ${DateTime.fromMillisecondsSinceEpoch(response['expires_in'] + now.millisecondsSinceEpoch)}
      \naccess_token: ${response['access_token']}
      ''');
    } catch (e) {
      print('Error: $e');
    }
  }

  void closeSessions() async {
    try {
      await auth.webAuth.clearSession();
      webLogged = false;
      setState(() {});
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MaterialButton(
            color: Colors.lightBlueAccent,
            textColor: Colors.white,
            child: const Text('Test Login'),
            onPressed: !webLogged ? webLogin : null,
          ),
          MaterialButton(
            color: Colors.blueAccent,
            textColor: Colors.white,
            child: const Text('Test Refresh Token'),
            onPressed: webLogged ? webRefreshToken : null,
          ),
          MaterialButton(
            color: Colors.redAccent,
            textColor: Colors.white,
            child: const Text('Test Clear Sessions'),
            onPressed: webLogged ? closeSessions : null,
          ),
        ],
      ),
    );
  }
}
