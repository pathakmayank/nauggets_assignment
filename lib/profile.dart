import 'package:flutter/material.dart';
import 'package:nauggets/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome, User'),
          actions: [
            InkWell(
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove('token');
                  // ignore: use_build_context_synchronously
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Login()));
                },
                child: const Icon(Icons.logout)),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.person_rounded,
                    size: 100,
                    color: Color.fromARGB(255, 209, 207, 207),
                  ),
                  Container(
                    width: 20,
                  ),
                  const Column(
                    children: [
                      Text(
                        'Tommy Berns',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 39, 134, 212),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            'Los Angeles',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 154, 152, 152)),
                          ),
                          Icon(
                            Icons.pin_drop,
                            color: Color.fromARGB(255, 95, 199, 98),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Text(
                      'Balance',
                      style: TextStyle(fontSize: 18),
                    ),
                    Container(
                      width: 10,
                    ),
                    const Text(
                      '\$56,324',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Row(
                  children: [
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: const Color.fromARGB(255, 231, 231, 231),
                      padding: const EdgeInsets.all(10),
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.add,
                        size: 45,
                        color: Color.fromARGB(255, 39, 134, 212),
                      ),
                    ),
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: const Color.fromARGB(255, 231, 231, 231),
                      padding: const EdgeInsets.all(10),
                      shape: const CircleBorder(),
                      child: const Icon(Icons.search,
                          size: 45, color: Color.fromARGB(255, 39, 134, 212)),
                    ),
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: const Color.fromARGB(255, 231, 231, 231),
                      padding: const EdgeInsets.all(10),
                      shape: const CircleBorder(),
                      child: const Icon(Icons.bar_chart_sharp,
                          size: 45, color: Color.fromARGB(255, 39, 134, 212)),
                    )
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  width: 300,
                  height: 200,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color.fromARGB(255, 37, 207, 73))),
              Container(
                padding: const EdgeInsets.only(
                    top: 40, bottom: 10, left: 18, right: 18),
                child: const Row(
                  children: [
                    Text(
                      'My Cards',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Divider(
                  color: Colors.black,
                  height: 2,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 18, right: 18),
                child: const Row(
                  children: [
                    Text('Transactions',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Divider(
                  color: Colors.black,
                  height: 2,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: 3,
          iconSize: 30,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.stacked_bar_chart),
              label: 'Stocks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.currency_rupee_outlined),
              label: 'Currency',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.security_outlined),
              label: 'Security',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'User',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          onTap: (index) {
            setState(() {});
          },
        ),
      ),
    );
  }
}
