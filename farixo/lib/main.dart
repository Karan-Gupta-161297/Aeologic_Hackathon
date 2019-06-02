import 'dart:async';
import 'package:farixo/homepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Ursprung-AEO',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/LoginPage': (BuildContext context) => new LoginPage()
      },
    ));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/LoginPage');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/splashscreen.png"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Image.asset('assets/icon.jpeg'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _email = "";
  String _password = "";
  FormType _form = FormType.login;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceIn);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  void _formChange() async {
    setState(() {
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Scaffold(
        backgroundColor: Colors.black,
        body: new Container(
          child: new Stack(fit: StackFit.expand, children: <Widget>[
            new Image(
              image: new AssetImage("assets/images/splashscreen.png"),
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: new Column(
                  children: <Widget>[
                    CircleAvatar(
                      child: Image.asset("assets/icon.jpeg"),
                      radius: 50.0,
                      backgroundColor: Colors.blueGrey[400],
                    ),
                    new Form(
                      autovalidate: true,
                      child: Theme(
                        data: new ThemeData(
                            brightness: Brightness.dark,
                            primarySwatch: Colors.teal,
                            inputDecorationTheme: new InputDecorationTheme(
                                labelStyle: new TextStyle(
                                    color: Colors.teal, fontSize: 20.0))),
                        child: Container(
                          padding: const EdgeInsets.all(39.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new TextFormField(
                                controller: _emailFilter,
                                decoration: new InputDecoration(
                                  labelText: "Enter Email",
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              new TextFormField(
                                controller: _passwordFilter,
                                decoration: new InputDecoration(
                                  labelText: "Enter Password",
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),
                              _buildButtons(),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    if (_form == FormType.login) {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Login'),
              onPressed: _loginPressed,
            ),
            new FlatButton(
              child: new Text(
                'Dont have an account? Tap here to register.',
                textAlign: TextAlign.center,
              ),
              onPressed: _formChange,
            ),
            new FlatButton(
              child: new Text('Forgot Password?'),
              onPressed: _passwordReset,
            )
          ],
        ),
      );
    } else {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Create an Account'),
              onPressed: _createAccountPressed,
            ),
            new FlatButton(
              child: new Text('Have an account? Click here to login.'),
              onPressed: _formChange,
            )
          ],
        ),
      );
    }
  }

  void _loginPressed() {
    if (_email == "" && _password == "") {
      _fulldata();
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      print('The user wants to login with $_email and $_password');
    }
  }

  void _createAccountPressed() {
    print('The user wants to create an account with $_email  and $_password');
  }

  void _passwordReset() {
    print(
        "The user wants a password reset request sent to $_email and $_password");
  }

  void _fulldata() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Incomplete!!"),
            content: new Text("Write full username or email. "),
            actions: <Widget>[
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatUI(),
    );
  }
}
