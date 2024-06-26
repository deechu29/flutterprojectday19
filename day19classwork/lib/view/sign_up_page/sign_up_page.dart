import 'dart:ui';

import 'package:day19classwork/view/home_screen/home_screen.dart';
import 'package:day19classwork/view/sign_in_page/sign_in_page.dart';
import 'package:flutter/material.dart';

class SignUPpage extends StatelessWidget {
  const SignUPpage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController password = TextEditingController();
    TextEditingController password2 = TextEditingController();

    final _formkey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(children: [
            Text("sign up for free",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            TextFormField(
                decoration: InputDecoration(
                    label: Text("Youre email address"),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 3),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (value.contains("@")) {
                    return null;
                  } else {
                    return 'Please enter a valid email';
                  }
                }),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: password,
                decoration: InputDecoration(
                    label: Text("Your password"),
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 3),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "null";
                  }
                }),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: password2,
                decoration: InputDecoration(
                    label: Text("Your confirm password"),
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 3),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                obscureText: true,
                validator: (value) {
                  if (password.text == password2.text) {
                    return null;
                  } else {
                    return "password not match";
                  }
                }),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey, width: 1)),
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Remember me"),
                SizedBox(
                  width: 140,
                ),
                Text("Forgot password")
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Homescreen(),
                          ),
                          (route) => false);
                    }
                  },
                  child: Text("Sign up"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                )),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already  have an account?"),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SigninPage(),
                        ));
                  },
                  child: Text(
                    "sign in",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
