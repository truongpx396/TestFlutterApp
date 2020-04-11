import 'package:flutter/material.dart';
import 'package:flutter_auth0/flutter_auth0.dart';

import 'pkce.dart';
import 'standard.dart';

import 'package:swagger/api.dart' as swagger;

//final String clientId = 'wlKGYgwdjixzM5DZmz14alnp3HCXJvQZ';
final String clientId = 'Dsufvww4WRF9XOU4PNvAdjsppNDhvBfL';
//final String clientId = '0p9kkzDmQ6KP87Gzx7JAJSz19N0II0Lq';

//final String domain = 'dev-cp8t6cr2.auth0.com';
final String domain = 'auth.mantu.com';
//final String domain = 'truongpx.auth0.com';

//from datahost manifest: truongpx.auth0.com

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  Auth0 auth;
  final GlobalKey<ScaffoldState> skey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, initialIndex: 0, length: 2);
    auth = Auth0(baseUrl: 'https://$domain/', clientId: clientId);

    // swagger..Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

    //testFunc();
  }

  void showInfo(String text, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: skey,
      appBar: AppBar(
        elevation: 0.7,
        centerTitle: false,
        leading: Image.network(
          'https://cdn.auth0.com/styleguide/components/1.0.8/media/logos/img/logo-grey.png',
          height: 40,
        ),
        backgroundColor: Color.fromRGBO(0, 0, 0, 1.0),
        title: Text(widget.title),
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              text: 'PKCE Flow',
            ),
            Tab(
              text: 'Standard Flow',
            )
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return Container(
            constraints: constraints,
            color: Colors.black,
            child: TabBarView(
              controller: controller,
              children: <Widget>[
                PKCEPage(auth, showInfo),
                StandardPage(auth, showInfo),
              ],
            ),
          );
        },
      ),
    );
  }
}
