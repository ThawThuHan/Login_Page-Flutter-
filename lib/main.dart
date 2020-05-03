import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpage/second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]); //screen rotation off
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: loginPage(),
        ),
      ),
    );
  }
}

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  bool _showPassword = false;
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  correct({title1, content1}) {
    return showDialog(
      context: context,
      builder: (content) {
        return AlertDialog(
          title: Text(title1),
          content: Text(content1),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
//      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 160.0, bottom: 90.0),
          child: Center(
            child: Text(
              'Welcome from IT-Onlinetutorial',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontFamily: 'Pacifico',
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: TextField(
            controller: _username,
            decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Enter Your Username.',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: TextField(
            controller: _password,
            textInputAction: TextInputAction.done,
            obscureText: !this
                ._showPassword, //true or false bool type ပဲထည့်ရမယ် //true ဆိုရင် text ကို hide ပေးတာ
            // !this._showPassword ဆိုတော့ true
            decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter Your Password.',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: this._showPassword ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      this._showPassword = !this._showPassword;
                    });
                  },
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  if (_username.text == 'thawthuhan' &&
                      _password.text == '621994') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return MyApp2();
                    }));
                    _username.clear();
                    _password.clear();
                  } else {
                    correct(
                        title1: 'Failed',
                        content1: 'Wrong Username or Password');
                  }
                  _username.clear();
                  _password.clear();
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Center(
            child: Text.rich(
              TextSpan(
                text: 'Don\'t you have a Account? ',
                style: TextStyle(fontSize: 15),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Sign Up here!',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      )),
                  // can add more TextSpans here...
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
