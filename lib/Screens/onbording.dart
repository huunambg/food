import 'package:flutter/material.dart';
import 'home/home.dart';
import 'package:google_fonts/google_fonts.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onbordingpage(),
    );
  }
}
// Man hinh Onbording
class Onbordingpage extends StatefulWidget {
  const Onbordingpage({super.key});

  @override
  State<Onbordingpage> createState() => _OnbordingpageState();
}

class _OnbordingpageState extends State<Onbordingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container( // Backgroud cua onbording
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img1.png"), fit: BoxFit.cover)),
          ),
          Positioned(
            bottom: 50,
            left: 28,
            child: Column(
              children: [
                Icon(
                  Icons.apple,
                  color: Colors.white,
                  size: 50,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("  Welcome \nto our store",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Gilroy",
                      fontSize: 30,
                      color: Colors.white,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text("Ger your groceries in as fast as one hour",
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w200,
                      fontSize: 15,
                      color: Colors.white,
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 83, 177, 117),
                        borderRadius: BorderRadius.circular(19)),
                    height: 67,
                    width: 330,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 249, 255, 1)),
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
