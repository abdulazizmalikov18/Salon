import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imtihon1/Screens/Numer/numer_screen.dart';
import 'package:imtihon1/Screens/Signup/signup_screen.dart';
import 'package:imtihon1/components/already_have_an_account_acheck.dart';

import '../../../constants.dart';
import 'background.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;

class Body extends StatefulWidget {
 Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _formKey = GlobalKey<FormState>();
  String? phone;
  String? name;

  String? verificationId;

  String? parolUshla;

  String? email;

  String? password;

  bool _obscureText = true;

  bool _obscureText1 = true;

  var key1;
  var send = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 8,bottom: 8),
                child: TextFormField(
                  onSaved: (e) {
                    print("Telefon Uzunligi: ${e!.length}");
                    phone = e;
                  },
                  cursorColor: kPrimaryColor,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.deepPurple.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Enter your phone number',
                    prefixIcon: Icon(Icons.phone_iphone,color: kPrimaryColor,),
                  ),
                  validator: (text) {
                    if (text!.length != 13) {
                      return "Raqamni +998907374483 tartibda kiriting";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 8,bottom: 8),
                child: TextFormField(
                  cursorColor: kPrimaryColor,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off,
                        color: kPrimaryColor,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.deepPurple.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.lock,color: kPrimaryColor,),
                  ),
                  onSaved: (p) {
                    password = p;
                  },
                  validator: (text) {
                    if (text!.length < 8) {
                      return "Kamida 8 ta belgi kerak";
                    } else {
                      parolUshla = text;
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Container(
                      margin:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifySmsCode(phone)));
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
