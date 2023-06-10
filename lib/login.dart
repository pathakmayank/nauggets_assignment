import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nauggets/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign In'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 70),
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
                decoration: const InputDecoration(hintText: 'Enter Password'),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  var data = {'email': email, 'password': password};
                  print(data);
                  Response res = await post(
                      Uri.parse('https://reqres.in/api/login'),
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
                },
                child: const Text('login'),
              )
            ],
          ),
        ));
  }
}
