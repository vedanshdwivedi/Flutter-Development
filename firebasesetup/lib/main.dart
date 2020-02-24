import 'package:firebasesetup/model/board.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MaterialApp(
    title: 'Board',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _imgUrl;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Board"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  onPressed: () => _gSignIn(),
                  child: Text("Google Sign-In"),
                  color: Colors.red,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  onPressed: () => _signInWithEmail(),
                  child: Text("Sign-In with Email"),
                  color: Colors.orange,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                    onPressed: () => _createUser(),
                    child: Text("Create Account"),
                    color: Colors.purple),
              ),
              new Image.network(_imgUrl == null || _imgUrl.isEmpty
                  ? "https://storage.googleapis.com/gd-wagtail-prod-assets/images/evolving_google_identity_2x.max-4000x2000.jpegquality-90.jpg"
                  : _imgUrl),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  onPressed: () => _logout(),
                  child: Text("Sign Out"),
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ));
  }

  Future<FirebaseUser> _gSignIn() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final AuthResult authResult = await _auth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
    print("User is: ${user.photoUrl} ");
    setState(() {
      _imgUrl = user.photoUrl;
    });
    return user;
  }

  Future _createUser() async {
    _auth.signOut();
    FirebaseUser user = await _auth
        .createUserWithEmailAndPassword(
            email: "vedanshiitb@gmail.com", password: "test1234")
        .then((userNew) {});
    print(user.email);
  }

  _logout() {
    _googleSignIn.signOut();
    setState(() {
      _imgUrl = null;
    });
  }

  _signInWithEmail() async {
    _auth.signOut();
    _auth.signInWithEmailAndPassword(
        email: "vedanshiitb@gmail.com", password: "test1234").catchError((error){
          print("Something Went Wrong");
          setState(() {
            _imgUrl = "https://cdn4.vectorstock.com/i/1000x1000/47/78/sad-round-emoji-vector-22414778.jpg";
          });
        }).then((newUser){
          print("User Signed In");
          setState(() {
            _imgUrl =
          "https://dg.imgix.net/do-you-think-you-re-happy-jgdbfiey-en/landscape/do-you-think-you-re-happy-jgdbfiey-9bb0198eeccd0a3c3c13aed064e2e2b3.jpg?ts=1520525855&ixlib=rails-4.0.0&auto=format%2Ccompress&fit=min&w=700&h=394&dpr=2&ch=Width%2CDPR";
    });
        });
  }
}
