import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
//import 'homepage_second.dart';

class exa6 extends StatefulWidget {
  const exa6({super.key});

  @override
  State<exa6> createState() => _exa6State();
}

class _exa6State extends State<exa6> {
  bool isFavorite = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var isLoading = true;

  var name=[];
  var age=[];
  //var image=[];

  @override
  void initState() {
    // TODO: implement initState
    readShoes();
    super.initState();
  }

  readShoes() async {
    var url="https://example-project-c8377-default-rtdb.firebaseio.com/"+"records.json";

    final result=await http.get(
        Uri.parse(url)
    );

    final data= json.decode(result.body) as Map<String, dynamic>;

    data.forEach((key, value) {
      name.add(value["name"]);
      age.add(value["age"]);
     // image.add(value['image']);

    });

    setState(() {
      isLoading=false;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      key: _scaffoldKey,
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
        preferredSize: const Size.fromHeight(70),
      ),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) =>
              //     const HomePageSecond(), // Details widget for car details
              //   ),
              // );
            },
            child: Card(
              color: Colors.lightBlue[50],
              elevation: 8,
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  // ClipRRect(
                  //   borderRadius:
                  //   BorderRadius.vertical(top: Radius.circular(10)),
                  //   child: SizedBox(
                  //     height: 200,
                  //     width: double.infinity,
                  //     child: Image.asset(
                  //       carImages[index],
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                    "  ${name[index]}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_today_rounded,
                                color: Colors.white70),
                            Text(
                              '2014',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.speed_rounded,
                                color: Color.fromARGB(1768, 255, 204, 0)),
                            Text(
                              '59000 KM',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.info_outline_rounded,
                                color: Colors.teal),
                            Text(
                              'Diesel',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.currency_rupee),
                            Text(
                              '71,00,000',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isFavorite =
                                !isFavorite; // Toggle the favorite status
                              });
                            },
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite
                                  ? Colors.red[400]
                                  : Color.fromARGB(000066, 0, 0, 102),
                              size: 30,
                            ))
                      ],
                    ),
                  )
                  // Other car details here
                ],
              ),
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo[100],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Danial Disooza',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 10),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/image.jpeg'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListTile(
                onTap: () {},
                leading: Icon(Icons.home, color: Colors.green[100], size: 30),
                title: const Text('Home',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.settings, color: Colors.brown[100], size: 30),
              title: const Text('Settings',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
            ),
            ListTile(
              onTap: () {},
              leading:
              Icon(Icons.person, color: Colors.indigoAccent[100], size: 30),
              title: const Text('Profile',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.privacy_tip_outlined,
                  color: Colors.red[100], size: 30),
              title: const Text('About Us',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.star_border_rounded,
                  color: Colors.orange[100], size: 30),
              title: const Text('Share your experience',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.live_help_outlined,
                  color: Colors.purple[100], size: 30),
              title: const Text('Help line',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 90),
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.teal),
                      fixedSize: MaterialStatePropertyAll(Size(30, 30))),
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.login_outlined), Text('Logout')],
                  )),
            )

// Add more list items as needed
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({
    Key? key,
    required this.scaffoldKey,
    required this.preferredSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu),
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      title: const Padding(
        padding: EdgeInsets.only(left: 30),
        child: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Tell us your dream",
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  final Size preferredSize;
}
