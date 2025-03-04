import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MeetTheShapers extends StatefulWidget {
  const MeetTheShapers({super.key});

  @override
  State<MeetTheShapers> createState() => _MeetTheShapersState();
}

class _MeetTheShapersState extends State<MeetTheShapers> {
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
              DrawerHeader(child: GestureDetector(
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
          image: DecorationImage(image: AssetImage('assets/images/Logos/nordwood-themes-background2.jpg'), fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          // Wrap the whole body in a scrollable view
          child: Column(
            children: [
              // Logo
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/Logos/blackLogo.png',
                  height: 150,
                ),
              ),
              Text(
                "Wave Riding Vehicles",
                style: GoogleFonts.marcellusSc(fontSize: 35),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Shapers of the Revolution",
                  style: GoogleFonts.marcellus(fontSize: 22),
                ),
              ),
              SizedBox(height: 30),

              SizedBox(height: 20),
              // Label below the board list
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      "At WRV, the love of surfing and board building is at the heart and soul of what we do.",
                      style: GoogleFonts.marcellus(fontSize: 20),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}