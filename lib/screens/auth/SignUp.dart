import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon_app/screens/auth/Login.dart';
import 'package:hackathon_app/widgets/info_snack.dart' as snack;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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

  Future<bool> _doRegister(String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      UserUpdateInfo info = UserUpdateInfo();
      user.updateProfile(info);
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
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
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => Login()));
                  },
                  iconSize: 35,
                  color: Colors.white,
                )
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
        style: TextStyle(color: Colors.white),
        controller: emailController,
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
          bool result = await _doRegister(
              emailController.text.trim().toString(),
              passwordController.text.trim().toString());

          if (result) {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
          } else {
            snack.errorMsg(context, "Signup Error", 3);
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
      child: Text("Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: MediaQuery.of(context).size.height / 40,
          )),
    );
  }
}
