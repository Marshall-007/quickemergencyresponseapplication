import 'package:quickemergencyresponse/models/loginuser.dart';
import 'package:quickemergencyresponse/screens/authenticate/adminregister.dart';
import 'package:quickemergencyresponse/services/auth.dart';
import 'package:flutter/material.dart';

import 'register.dart';

class Selector extends StatefulWidget {
  final Function? toggleView;
  Selector({this.toggleView});

  @override
  State<StatefulWidget> createState() {
    return _Selector();
  }
}

class _Selector extends State<Selector> {
  final AuthService _auth = new AuthService();

  final _email = TextEditingController();

  final _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final txtbutton = TextButton(

        onPressed: () {},
        child: const Text('Please select what you are \n registering as.'));

    final userButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Register()));
        },
        child: Text(
          "User",
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          textAlign: TextAlign.center,
        ),
      ),
    );

    final serviceButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AdminRegister()));
        },
        child: Text(
          "Service Provider",
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Register as'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 53.0),
                  const SizedBox(height: 65.0),
                  txtbutton,
                  const SizedBox(height: 55.0),
                  userButton,
                  const SizedBox(height: 45.0),
                  serviceButton,
                  const SizedBox(height: 15.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
