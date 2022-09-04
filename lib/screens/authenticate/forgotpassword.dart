import 'package:quickemergencyresponse/models/loginuser.dart';
import 'package:quickemergencyresponse/screens/authenticate/Selector.dart';
import 'package:quickemergencyresponse/screens/home/home.dart';
import 'package:quickemergencyresponse/services/auth.dart';
import 'package:flutter/material.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
//Import firestore database
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  //Initializing Database when starting the application.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
}

class Forgotpassword extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _Forgotpassword();
  }
}

class _Forgotpassword extends State<Forgotpassword> {
  bool _obscureText = true;

  final _email = TextEditingController();
  final _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService _auth = new AuthService();

  @override
  Widget build(BuildContext context) {
    CollectionReference user = FirebaseFirestore.instance.collection('User');
    final emailField = TextFormField(
        controller: _email,
        autofocus: false,
        validator: (value) {
          if (value != null) {
            if (value.contains('@') && value.endsWith('.com')) {
              return null;
            }
            return 'Enter a Valid Email Address';
          }
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Email",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    

    
    
    final loginEmailPasswordButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            
            
              //null means unsuccessfull authentication
              showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      content: Text("Request Submited. Will Contact you soon"),
                    );
                  });
            
          }
        },
        child: Text(
          "Submit",
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          textAlign: TextAlign.center,
        ),
      ),
    );

    var ForgotPasswordButton = loginEmailPasswordButon;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Forgot Password'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 SizedBox(
                height: 125,
                width: 125,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(90)),
                    child: Image.asset('assets/images/QER-RoundLogo.jpg',fit:BoxFit.cover),
   ),
),
                  const SizedBox(height: 45.0),
                  emailField,
                 
                  const SizedBox(height: 35.0),
                  ForgotPasswordButton,
               
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
