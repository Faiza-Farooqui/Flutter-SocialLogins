import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInGooglePage extends StatelessWidget {
  SignInGooglePage(this._googleSignIn);
  GoogleSignIn _googleSignIn;

  BuildContext mcontext;
  @override
  Widget build(BuildContext context) {
    mcontext =context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80.0,
              width: 80.0,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.deepPurple),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    _googleSignIn.currentUser.photoUrl != null?_googleSignIn.currentUser.photoUrl: "",
                  ),
                ),
              ),
            ),
            Text('Name : ${_googleSignIn.currentUser.displayName}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple, fontSize: 17),),
            Text('Email : ${_googleSignIn.currentUser.email}',style: const TextStyle(
                color: Color(0xFF575757),
                fontSize: 15.0,
                fontWeight: FontWeight.bold)),
            SizedBox(height: 20,),
            RaisedButton(
              elevation: 3.0,
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              padding: EdgeInsets.only(
                  top: 7.0, bottom: 7.0, right: 40.0, left: 40.0),
              onPressed: () async{
                logOutWithGoogle();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage("assets/google_logo.png"), height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void logOutWithGoogle() async{
    if(await _googleSignIn.isSignedIn()){
      _googleSignIn.signOut();
      if (Navigator.canPop(mcontext)) {
        Navigator.pop(mcontext);
      } else {
        // SystemNavigator.pop();
      }
    }
  }
}


