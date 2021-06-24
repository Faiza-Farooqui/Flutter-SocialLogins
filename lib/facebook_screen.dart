import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookLoginPage extends StatelessWidget {

  FacebookLoginPage(this._userObj,this.facebookLogin);
  Map _userObj;
  FacebookLogin facebookLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook Login'),
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
                border: Border.all(color: Colors.blue),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    _userObj["picture"]["data"]["url"],
                  ),
                ),
              ),
            ),
            Text(_userObj["name"],style: const TextStyle(
            color: Colors.blue,
            fontSize: 15.0,
            fontWeight: FontWeight.bold)),
            Text(_userObj["email"], style: const TextStyle(
            color: Color(0xFF575757),
          fontSize: 15.0,
          fontWeight: FontWeight.bold)),
            TextButton(
                onPressed: () {
                  facebookLogin.logOut().then((value) {
                    _userObj = {};
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  });
                },
                child: Text("Logout"))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}