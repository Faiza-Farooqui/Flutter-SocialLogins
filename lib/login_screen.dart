import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_logins_flutter/linkedIn_login.dart';
import 'package:social_logins_flutter/google_signin.dart';

// fb
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'dart:convert' as JSON;
import 'package:http/http.dart' as http;

// google
import 'package:google_sign_in/google_sign_in.dart';

// linked in
import 'package:linkedin_login/linkedin_login.dart';
import 'package:social_logins_flutter/twitter_login.dart';
import 'package:social_logins_flutter/user_obj.dart';

//Twitter
import 'package:flutter_twitter/flutter_twitter.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'facebook_screen.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Map userObj = {};
  final facebookLogin = FacebookLogin();

  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );
  //Linked in Sign In prerequisite
  UserObject user;
  final String redirectUrl = 'https://www.google.com/';
  final String clientId = '86z7jxi81p333j';
  final String clientSecret = 'M398zwt7LsJax4QT';

  //Twitter Sign In Instance
  var twitterLogin = new TwitterLogin(
    consumerKey: '<your consumer key>',
    consumerSecret: '<your consumer secret>',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Social Logins', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blueGrey),),
            SizedBox(height: 40,),
            // facebook button
            Padding(
              padding: EdgeInsets.only(
                  left: 70.0,right: 70.0, top: 45.0, bottom: 10.0),
              child: new RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius:
                    new BorderRadius.circular(30.0)),
                onPressed: () {
                 logInWithFb();
                },
                child: new Row(
                  children: <Widget>[
                    new Image.asset(
                      "assets/facebook.png",
                      height: 24.0,
                      width: 24.0,
                      fit: BoxFit.scaleDown,
                    ),
                    new Image.asset(
                      "assets/substract.png",
                      height: 24.0,
                      width: 24.0,
                      fit: BoxFit.scaleDown,
                    ),
                    new Text(
                      "Facebook",
                      style: new TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                color: Color(0xFF3A559F),
                textColor: Colors.white,
                elevation: 5.0,
                padding: EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    top: 10.0,
                    bottom: 10.0),
              ),
            ),
            // linked in button
            Padding(
              padding: EdgeInsets.only(
                  left: 70.0,right: 70.0, top: 10.0, bottom: 10.0),
              child: new RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius:
                    new BorderRadius.circular(30.0)),
                onPressed: () {
                  logInWithLinkedIn();
                },
                child: new Row(
                  children: <Widget>[
                    new Image.asset(
                      "assets/linkedin.png",
                      height: 24.0,
                      width: 24.0,
                      fit: BoxFit.scaleDown,
                    ),
                    new Image.asset(
                      "assets/substract.png",
                      height: 24.0,
                      width: 24.0,
                      fit: BoxFit.scaleDown,
                    ),
                    new Text(
                      "Linked In",
                      style: new TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                color: Color(0xFF2797cf),
                textColor: Colors.white,
                elevation: 5.0,
                padding: EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    top: 10.0,
                    bottom: 10.0),
              ),
            ),
            // gmail button
            Padding(
              padding: EdgeInsets.only(
                  left: 70.0,right: 70.0, top: 10.0, bottom: 10.0),
              child: new RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius:
                    new BorderRadius.circular(30.0)),
                onPressed: () {
                  _logInWithGoogle();
                },
                child: new Row(
                  children: <Widget>[
                    new Image.asset(
                      "assets/google_logo.png",
                      height: 24.0,
                      width: 24.0,
                      fit: BoxFit.scaleDown,
                    ),
                    new Image.asset(
                      "assets/substract.png",
                      height: 24.0,
                      width: 24.0,
                      fit: BoxFit.scaleDown,
                    ),
                    new Text(
                      "Google",
                      style: new TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                color: Colors.white,
                textColor: Color(0xFF777777),
                elevation: 5.0,
                padding: EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    top: 10.0,
                    bottom: 10.0),
              ),
            ),
            // twitter
            Padding(
              padding: EdgeInsets.only(
                  left: 70.0,right: 70.0, top: 10.0, bottom: 10.0),
              child: new RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius:
                    new BorderRadius.circular(30.0)),
                onPressed: () {
                  logInWithTwitter();
                },
                child: new Row(
                  children: <Widget>[
                    new Image.asset(
                      "assets/twitter.png",
                      height: 24.0,
                      width: 24.0,
                      fit: BoxFit.scaleDown,
                    ),
                    new Image.asset(
                      "assets/substract.png",
                      height: 24.0,
                      width: 24.0,
                      fit: BoxFit.scaleDown,
                    ),
                    new Text(
                      "Twitter",
                      style: new TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                color: Color(0xFF26A6D1),
                textColor: Colors.white,
                elevation: 5.0,
                padding: EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    top: 10.0,
                    bottom: 10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void logInWithFb() async{
    final result = await facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        setState(() {
          userObj = profile;
        });
        var root = MaterialPageRoute(builder: (context) => new FacebookLoginPage(userObj,facebookLogin));
        Navigator.push(context, root);

        break;
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        break;
    }
  }

  Future<void> _logInWithGoogle() async {
    try {
      await googleSignIn.signIn();
        var root = MaterialPageRoute(builder: (context) => new SignInGooglePage(googleSignIn));
        Navigator.push(context, root);
    } catch (error) {
      print('======================= google error $error');
    }
  }

  void logInWithLinkedIn (){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => LinkedInUserWidget(
          redirectUrl: redirectUrl,
          clientId: clientId,
          clientSecret: clientSecret,
          projection:  [
            ProjectionParameters.id,
            ProjectionParameters.localizedFirstName,
            ProjectionParameters.localizedLastName,
            ProjectionParameters.firstName,
            ProjectionParameters.lastName,
            ProjectionParameters.profilePicture,
          ],
          onGetUserProfile: (LinkedInUserModel linkedInUser) {
            print('================== Access token ${linkedInUser.token.accessToken}');
            print('User id: ${linkedInUser.userId}');

            user = UserObject(
              firstName: linkedInUser?.firstName?.localized?.label,
              lastName: linkedInUser?.lastName?.localized?.label,
              email: linkedInUser
                  ?.email?.elements[0]?.handleDeep?.emailAddress,
              profileImageUrl: linkedInUser?.profilePicture?.displayImageContent?.elements[0]?.identifiers[0]?.identifier,
            );
            // Navigator.pop(context);

            var root = MaterialPageRoute(builder: (context) => new LinkedInLogin(user));
            Navigator.push(context, root);
          },
          catchError: (LinkedInErrorObject error) {
            print('Error description: ${error.description},'
                ' Error code: ${error.statusCode.toString()}');
            Navigator.pop(context);
          },
        ),
        fullscreenDialog: true,
      ),
    );
  }

  void logInWithTwitter () async{
    TwitterLoginResult _twitterLoginResult = await twitterLogin.authorize();
    TwitterSession _currentUserTwitterSession = _twitterLoginResult.session;
    TwitterLoginStatus  _twitterLoginStatus = _twitterLoginResult.status;
    AuthCredential _authCredential = TwitterAuthProvider.getCredential(
        authToken: _currentUserTwitterSession?.token ?? '',
        authTokenSecret: _currentUserTwitterSession?.secret ?? ''
    );
    FirebaseUser _currentUser = await FirebaseAuth.instance.signInWithCredential(_authCredential);
    print('=============== ${_currentUser.displayName}');
    var root = MaterialPageRoute(builder: (context) => new TwitterScreen(_currentUser, twitterLogin));
    Navigator.push(context, root);
  }

}
