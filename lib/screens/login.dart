import 'package:flutter/material.dart';
import 'package:list_movies_series/screens/home.dart';
import 'package:list_movies_series/screens/register.dart';
import 'package:list_movies_series/google_sign_in/google_sign_in.dart';
import 'package:list_movies_series/utils/function.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Color.fromRGBO(252, 92, 92, 1),
                Color.fromRGBO(252, 68, 172, 1),
                Color.fromRGBO(228, 84, 244, 1),
                Color.fromRGBO(156, 84, 244, 1),
              ],
            ),
          ),
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 40),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logo.png'),
                  radius: 60,
                  child: Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 218, 216, 216),
                        width: 4.0,
                      ),
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                ),
              ),
              Container(
                width: 400.0,
                margin: EdgeInsets.only(bottom: 5.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'E-mail Address',
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 50, bottom: 10),
                child: Column(
                  children: [
                    SizedBox(width: 20.0),
                    Container(
                      margin: EdgeInsets.only(left: 80, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Color.fromARGB(250, 104, 58, 183),
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          checkColor: Colors.white,
                          activeColor:
                              isChecked ? Colors.purple : Colors.transparent,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text(
                          'Remember Password',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20.0),
              SizedBox(
                width: 200.0,
                child: ElevatedButton(
                  child: Text('Sign in'),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Home()),
                    // );
                  },
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: 200.0,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Sign in with Google'),
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: 200.0,
                child: ElevatedButton(
                  child: Text('Guest Session'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    )
    );
  }
}
