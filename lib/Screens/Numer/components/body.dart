import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imtihon1/Screens/Signup/signup_screen.dart';
import 'package:imtihon1/components/already_have_an_account_acheck.dart';

import '../../../constants.dart';
import '../../../main.dart';
import 'numberbackgound.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;

class Body extends StatefulWidget {
  String? phone;
  String? name;


  Body(this.phone,{
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController smsCode = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  String? parolUshla;

  String? password;

  bool _obscureText = true;

  var key1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _authUser.verifyPhoneNumber(
        phoneNumber: widget.phone!,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException credential) {},
        codeSent: (String verificationId, int? resendToken) async {},
        codeAutoRetrievalTimeout: (String text) {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NumerBackground(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 8, bottom: 8),
                child: TextFormField(
                  cursorColor: kPrimaryColor,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.deepPurple.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Enter your password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                    ),
                  ),
                  onSaved: (p) {
                    password = p;
                  },
                  validator: (text) {
                    if (text!.length == 6) {
                      return "6 ta nomer kerak";
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
                      margin: EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 15.0),
                      child: Text(
                        "Contuniu",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    onPressed: _phoneVerify,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                margin: EdgeInsets.all(8),
                child: InkWell(
                  onTap: (){},
                  child: Text(
                    "To contact if the number does not come",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _phoneVerify() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await _authUser.verifyPhoneNumber(
          phoneNumber: widget.phone!,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException credential) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 3),
                content: Text("Smsni Tekshirib Qaytadan Urinib Ko'ring !"),
              ),
            );
          },
          codeSent: (String verificationId, int? resendToken) async {
            print("Sms Jonatildi !");
            PhoneAuthCredential phoneAuthCredential =
            PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: smsCode.text);
            await _authUser.signInWithCredential(phoneAuthCredential);
            await Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MyHomePage()));
          },
          codeAutoRetrievalTimeout: (String text) {
            print("TEXT: $text");
          });
    }
  }

  phoneverification() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }
}
