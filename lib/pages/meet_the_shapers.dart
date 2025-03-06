import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MeetTheShapers extends StatefulWidget {
  const MeetTheShapers({super.key});

  @override
  State<MeetTheShapers> createState() => _MeetTheShapersState();
}

class _MeetTheShapersState extends State<MeetTheShapers> {
  // List<Shaper> shapers = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _loadShapers();
  // }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 226, 226, 226),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: Center(
          child: Column(
            children: [
              DrawerHeader(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/intropage');
                  },
                  child: Icon(Icons.surfing_sharp, size: 45),
                ),
              ),
              SizedBox(height: 40),
              ListTile(
                title: Center(child: Text("C A T A L O G")),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/catalog');
                  if (kDebugMode) {
                    debugPrint('Moving to Catalog');
                  }
                },
              ),
              SizedBox(height: 40),
              ListTile(
                title: Center(child: Text("S H A P E R S")),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/shapers');
                  if (kDebugMode) {
                    debugPrint('Moving to Shapers');
                  }
                },
              ),
            ],
          ),
        ),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/Logos/nordwood-themes-background2.jpg',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        height: 2,
                        margin: EdgeInsets.only(left: 50),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: Image.asset(
                          'assets/images/Logos/blackLogo.png',
                          height: 50,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        height: 2,
                        margin: EdgeInsets.only(right: 50),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Meet the Shapers",
                style: GoogleFonts.marcellusSc(fontSize: 38),
              ),
              SizedBox(height: 10),
              
            ],
          ),
        ),
      ),
    );
  }
}
