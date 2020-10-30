import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon_app/screens/main_page.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  // bool isDataLoading = false;
  // bool shouldFormAutoValidate = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // emailController.dispose();
    // passwordController.dispose();
  }

  void _doLogin() async {
    // if (_formKey.currentState.validate()) {
    //   // setState(() {
    //   //   isDataLoading = true;
    //   // });
    //   // var body = {
    //   //   "email": emailController.text,
    //   //   "password": passwordController.text,
    //   //   "role": "Doctor"
    //   // };
    //   // var attempLogin = LoginLogic();
    //   // var result = await attempLogin.doLogin(context, body);
    //   // if (result['status']) {
    //   //   Navigator.pushReplacement(
    //   //       context, MaterialPageRoute(builder: (_) => Dashboard()));
    //   // }
    //   try {
    //     setState(() {
    //       isDataLoading = true;
    //     });
    //     var body = {
    //       "email": emailController.text,
    //       "password": passwordController.text,
    //       "role": "Doctor"
    //     };
    //     var response = await api_service.fetchPost("users/login", body);
    //     if (response.statusCode == 200) {
    //       var res = json.decode(response.body);
    //       await shared_preferences.setAll(
    //           res['token'],
    //           res['data']['_id'],
    //           res['data']['email'],
    //           res['data']['first_name'],
    //           res['data']['last_name']);

    //       Navigator.pushReplacement(
    //           context, MaterialPageRoute(builder: (_) => NavigationHolder()));
    //     } else {
    //       setState(() {
    //         isDataLoading = false;
    //       });
    //       var errorObj = json.decode(response.body);
    //       snack.errorMsg(context, errorObj['msg'], 4);
    //     }
    //   } catch (e) {
    //     setState(() {
    //       isDataLoading = false;
    //     });
    //     snack.errorMsg(
    //         context, "Something went wrong! may be a network error", 3);
    //   }
    // } else {
    //   shouldFormAutoValidate = true;
    // }
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
                // _buildLogo(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(
                      letterSpacing: 2.5,
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0,
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
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
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
                    // key: _formKey,
                    child: Column(
                  children: [
                    Container(height: 70.0, child: buildUsername()),
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

  Widget buildUsername() {
    return Material(
      // elevation: 20.0,
      shadowColor: Colors.white,
      color: Colors.transparent,
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        // controller: emailController,
        validator: (value) {
          if (value.isEmpty ||
              !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
            return 'Valid email is required';
          }
          return null;
        },
        onChanged: (val) {
          // if (shouldFormAutoValidate) {
          //   _formKey.currentState.validate();
          // }
        },
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
      // elevation: 20.0,

      shadowColor: Colors.white,
      color: Colors.transparent,
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        // controller: passwordController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Password is required';
          }
          return null;
        },
        onChanged: (val) {
          // if (shouldFormAutoValidate) {
          //   _formKey.currentState.validate();
          // }
        },
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
          // side: BorderSide(color: Colors.red)
        ),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => MainPage()));
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
    // if (!isDataLoading) {
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
    // } else {
    //   return CircularProgressIndicator(
    //     valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    //   );
    // }
  }

  Widget _buildSignUpBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 0),
          child: FlatButton(
            onPressed: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (_) => ()));
            },
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "Don't have an account ?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height / 40,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0),
                ),
                TextSpan(
                  text: ' Sign Up',
                  style: TextStyle(
                    color: Color(0xFF200887),
                    fontSize: MediaQuery.of(context).size.height / 38,
                    fontWeight: FontWeight.w900,
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
