import 'package:flutter/material.dart';
import 'package:login_page2/SecondScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomescreenState();
}

var visibles = Icon(Icons.visibility);
var non_visible = Icon(Icons.visibility_off);
var icoon = non_visible;
var obs = true;
var buttonColor = Colors.yellow;
var use = 'nidhin';
var pas = '0000';
TextEditingController _username = TextEditingController();
TextEditingController _password = TextEditingController();

class _HomescreenState extends State<HomeScreen> {
  // TextEditingController _username = TextEditingController();
  //TextEditingController _password = TextEditingController();
  var colo = Colors.yellow;
  void fun() {
    setState(() {
      if (_username.text == use && _password.text == pas) {
        colo = Colors.yellow;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return SecondScreen();
        }));
        ScaffoldMessenger.of(context).showSnackBar(_login);
      } else if (_username.text.isEmpty || _password.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(_entry);
        colo = Colors.red;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(_invalid);
        colo = Colors.red;
      }
    });
  }

  void show() {
    setState(() {
      if (icoon == visibles) {
        icoon = non_visible;
        obs = true;
      } else {
        icoon = visibles;
        obs = false;
      }
    });
  }

  SnackBar _login = SnackBar(
    content: Text("Login Succesfull"),
    duration: Duration(seconds: 3),
    showCloseIcon: true,
  );
  SnackBar _invalid = SnackBar(
    content: Text("Invalid Entry"),
    duration: Duration(seconds: 3),
    showCloseIcon: true,
  );
  SnackBar _entry = SnackBar(
    content: Text("Enter both Field"),
    duration: Duration(seconds: 3),
    showCloseIcon: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 165, 200, 216),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.person_2_rounded,
              size: 100,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              maxLength: 10,
              controller: _username,
              decoration: InputDecoration(
                labelText: "Username",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.purple,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: colo,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Stack(
              children: [
                TextField(
                  maxLength: 8,
                  controller: _password,
                  keyboardType: TextInputType.number,
                  obscureText: obs,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.purple,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: colo,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: 50,
                  top: 3,
                  left: 320,
                  //right: 150,
                  child: IconButton(
                    onPressed: () {
                      show();
                    },
                    icon: icoon,
                    iconSize: 27,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                fun();
              },
              child: Text("Sign up"),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(buttonColor),
                minimumSize: WidgetStatePropertyAll(
                  Size(500, 50),
                ),
                textStyle: WidgetStatePropertyAll(
                  TextStyle(fontSize: 21),
                ),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(252, 231, 216, 216),
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        // actions: [Icon(Icons.search), Icon(Icons.exit_to_app)],
        elevation: 10,
        title: Text("Login Page"),
        centerTitle: true,
      ),
      drawer: Drawer(),
    );
  }
}
