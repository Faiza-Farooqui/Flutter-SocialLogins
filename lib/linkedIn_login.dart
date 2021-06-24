import 'package:flutter/material.dart';
import 'package:social_logins_flutter/user_obj.dart';
import 'login_screen.dart';

class LinkedInLogin extends StatelessWidget {

  LinkedInLogin(this.user);
  UserObject user;

  BuildContext mcontext;

  @override
  Widget build(BuildContext context) {
    mcontext = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('LinkedIn Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    '${user?.profileImageUrl}',
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Text('Name:  ${user?.firstName} ${user?.lastName}',
              style: const TextStyle(
                  color: Color(0xFF2797cf),
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold), ),
            SizedBox(height: 15,),
            Text('Email: ${user?.email}',style: const TextStyle(
                color: Color(0xFF575757),
                fontSize: 15.0,
                fontWeight: FontWeight.bold)),
            TextButton(
                onPressed: () {logOutWithLinkedIn();},
                child: Text("Logout",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue,
                ),))
          ],
        ),
      ),
    );
  }
  void logOutWithLinkedIn(){
       user = null;
       var root = MaterialPageRoute(builder: (context) => new LoginScreen());
       Navigator.push(mcontext, root);

      //  if (Navigator.canPop(context)) {
      //   Navigator.pop(context);
      // } else {
      // }
  }
}