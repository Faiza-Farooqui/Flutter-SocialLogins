import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter/flutter_twitter.dart';
import 'package:social_logins_flutter/user_obj.dart';

class TwitterScreen extends StatelessWidget {
  TwitterScreen(this._userObject, this.twitterLogin);
  FirebaseUser _userObject;
  TwitterLogin twitterLogin;
  BuildContext mcontext;

  @override
  Widget build(BuildContext context) {

    mcontext = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFF26A6D1)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    _userObject.photoUrl,
                  ),
                ),
              ),
            ),
            Text('Name: ${_userObject.displayName}', style: const TextStyle(
                color: Color(0xFF26A6D1),
                fontSize: 17.0,
                fontWeight: FontWeight.bold)),
            Text('Email: ${_userObject.email}',style: const TextStyle(
                color: Color(0xFF575757),
                fontSize: 15.0,
                fontWeight: FontWeight.bold)),
            TextButton(
                onPressed: () {
              _logoutTwitter();
                },
                child: Text("Logout"))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _logoutTwitter() async {
    await twitterLogin.logOut();
    Navigator.pop(mcontext);
  }
}
