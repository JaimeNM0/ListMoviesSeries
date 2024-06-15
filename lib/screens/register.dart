import 'package:flutter/material.dart';
import 'package:list_movies_series/utils/function.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: const BoxDecoration(
          gradient: linearGradientFading,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 20, left: 100.0, right: 100.0),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 50),
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
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Nick',
                          labelStyle: customTextStyle(fontSize: 10.0),
                        ),
                        style: customTextStyle(fontSize: 16.0),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: customTextStyle(fontSize: 10.0),
                        ),
                        style: customTextStyle(fontSize: 16.0),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Surname',
                          labelStyle: customTextStyle(fontSize: 10.0),
                        ),
                        style: customTextStyle(fontSize: 16.0),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Gender',
                          labelStyle: customTextStyle(fontSize: 10.0),
                        ),
                        style: customTextStyle(fontSize: 16.0),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          labelStyle: customTextStyle(fontSize: 10.0),
                        ),
                        style: customTextStyle(fontSize: 16.0),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'E-mail Address',
                          labelStyle: customTextStyle(fontSize: 10.0),
                        ),
                        style: customTextStyle(fontSize: 16.0),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: customTextStyle(fontSize: 10.0),
                        ),
                        style: customTextStyle(fontSize: 16.0),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: customTextStyle(fontSize: 10.0),
                        ),
                        style: customTextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Register'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
