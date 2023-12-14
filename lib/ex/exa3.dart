import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFavorite = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var table = Uri.parse("https://example-project-c8377-default-rtdb.firebaseio.com/CarDetails.json");
  var Names = [];
  var Model = [];
  var FuelType = [];
  var Price = [];
  var isLoading = true;
  @override
  void initState() {
    getRecord();
    super.initState();
  }

  getRecord() async {
    try {
      final response = await http.get(table);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((blogId, blogData) {
        Names.add(blogData["Name"]);
        Model.add(blogData["Model"]);
        FuelType.add(blogData["FuelType"]);
        Price.add(blogData["Price"]);
      });
      setState(() {
        //isLoading = false;
      });
    } catch (error) {
      throw error;
    }
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
        itemCount: Names.length,
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
                  ClipRRect(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(10)),
                    child: SizedBox(
                      height: 200,
                      width: double.infinity,
                      // child: Image.asset(
                      //   carImages[index],
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      Names[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_today_rounded,
                                color: Colors.white70),
                            Text(
                              Model[index],
                              style: TextStyle(fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.speed_rounded,
                                color: Color.fromARGB(1768, 255, 204, 0)),
                            Text(
                              '',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.info_outline_rounded,
                                color: Colors.teal),
                            Text(
                              '',
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
                              '',
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
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
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
