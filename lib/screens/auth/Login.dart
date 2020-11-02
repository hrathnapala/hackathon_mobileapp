import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon_app/screens/auth/SignUp.dart';
import 'package:hackathon_app/screens/main_page.dart';
import 'package:hackathon_app/widgets/info_snack.dart' as snack;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<FirebaseUser> _doLogin(String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      return user;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xfff2f3f7),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xFF200887), Colors.black]),
                borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(70),
                  bottomRight: const Radius.circular(70),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(
                      letterSpacing: 2.5,
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                _buildContainer(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(25.0),
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topCenter,
                  colors: [Color(0xFF200887), Colors.white]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/images/login.svg",
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                SizedBox(
                  height: 40,
                ),
                Form(
                    child: Column(
                  children: [
                    Container(height: 70.0, child: buildEmail()),
                    Container(height: 70.0, child: buildPassword()),
                  ],
                )),
                SizedBox(
                  height: 0,
                ),
                buildButton(),
                _buildSignUpBtn(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildEmail() {
    return Material(
      shadowColor: Colors.white,
      color: Colors.transparent,
      child: TextFormField(
        controller: emailController,
        style: TextStyle(color: Colors.white),
        autofocus: false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: Colors.white,
          ),
          hintText: 'Email',
          fillColor: Color(0xFF200887),
          filled: true,
          hintStyle: TextStyle(color: Colors.white, letterSpacing: 1.5),
          contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }

  Widget buildPassword() {
    return Material(
      shadowColor: Colors.white,
      color: Colors.transparent,
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        controller: passwordController,
        obscureText: true,
        autofocus: false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.white,
          ),
          hintText: 'Password',
          fillColor: Color(0xFF200887),
          filled: true,
          hintStyle: TextStyle(color: Colors.white, letterSpacing: 1.5),
          contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }

  Widget buildButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        onPressed: () async {
          FirebaseUser user = await _doLogin(
              emailController.text.trim().toString(),
              passwordController.text.trim().toString());
          if (user != null) {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => MainPage()));
          } else {
            snack.errorMsg(context, "Login Error", 3);
          }
        },
        color: Color(0xFF200887),
        textColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
          child: setUpButtonChild(),
        ),
      ),
    );
  }

  Widget setUpButtonChild() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Text("Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: MediaQuery.of(context).size.height / 40,
          )),
    );
  }

  Widget _buildSignUpBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 0),
          child: FlatButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SignUp()));
            },
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "Don't have an account ?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width / 25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0),
                ),
                TextSpan(
                  text: ' Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 20,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
