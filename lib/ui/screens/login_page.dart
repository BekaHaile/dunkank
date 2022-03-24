
import 'package:dukkantek_test/ui/controllers/login_controller.dart';
import 'package:dukkantek_test/ui/widgets/entry_field.dart';
import 'package:dukkantek_test/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController>{
   LoginPage({Key? key}) : super(key: key);


    final _formKey = GlobalKey<FormState>();
    @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SizedBox(
      height: height,
      child: Column(
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
                  key: _formKey,child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  _title(),
                  const SizedBox(height: 50),
                  _usernamePasswordWidget(),
                  const SizedBox(height: 20),
                  Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
                        child: RoundedButton(
                          text: 'Login',
                          onPressed: () {
                            final form = _formKey.currentState;
                            if (form?.validate() ?? false) {
                              form?.save();
                              controller.login();
                            }
                          },
                        ),
                      ),
                  _divider(),
                  _googleButton(),
                  SizedBox(height: height * .055),
                ],
              ),
              ),
            ),),),
        ],
      ),
    ));
  }

Widget _usernamePasswordWidget() {
    return Column(
      children: <Widget>[
        EntryField("Username", false, (value) => controller.userName = value),
        EntryField("Password", true, (value) => controller.password = value),
      ]
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          text: 'Lo',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xffe46b10)
          ),
          children: [
            TextSpan(
              text: 'g',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'in',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  // Widget _submitButton(context) {
                      
    //                    Container(
    //   width: MediaQuery.of(context).size.width,
    //   padding: const EdgeInsets.symmetric(vertical: 15),
    //   alignment: Alignment.center,
    //   decoration: BoxDecoration(
    //       borderRadius: const BorderRadius.all(Radius.circular(5)),
    //       boxShadow: <BoxShadow>[
    //         BoxShadow(
    //             color: Colors.grey.shade200,
    //             offset: const Offset(2, 4),
    //             blurRadius: 5,
    //             spreadRadius: 2)
    //       ],
    //       gradient: const LinearGradient(
    //           begin: Alignment.centerLeft,
    //           end: Alignment.centerRight,
    //           colors: [Color(0xfffbb448), Color(0xfff7892b)])),
    //   child: const Text(
    //     'Login',
    //     style: TextStyle(fontSize: 20, color: Colors.white),
    //   ),
    // );
  // }

  Widget _divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: const <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _googleButton() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff1959a9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: const Text('G',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff2872ba),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: const Text('Log in with Google',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }
  
}