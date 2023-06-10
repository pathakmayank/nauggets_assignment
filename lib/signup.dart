import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nauggets/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? email;
  String? password;
  String? passwordCheck;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            TextField(
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
              decoration: const InputDecoration(hintText: 'Enter Email'),
            ),
            TextField(
              onChanged: (val) {
                setState(() {
                  password = val;
                });
              },
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Enter password'),
            ),
            TextField(
              onChanged: (val) {
                setState(() {
                  passwordCheck = val;
                });
              },
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Re-enter Password'),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () async {
                if (password == passwordCheck) {
                  var data = {'email': email, 'password': password};
                  print(data);
                  Response res = await post(
                      Uri.parse('https://reqres.in/api/register'),
                      body: data);
                  if (res.statusCode == 200) {
                    var dec = json.decode(res.body);
                    String token = dec['token'];
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('token', token);
                    // ignore: use_build_context_synchronously
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Profile()));
                  } else {
                    print('');
                    var snackBar = SnackBar(
                        content: Text('${res.statusCode} and ${res.body}'));
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } else {
                  print('');
                  var snackBar =
                      const SnackBar(content: Text('Passwords not Matching'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text('Sign Up'),
            )
          ],
        ),
      ),
    );
  }
}
