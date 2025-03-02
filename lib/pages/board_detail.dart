import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wrv_catalog/models/board.dart';

class BoardDetail extends StatefulWidget {
  final Board board;

  const BoardDetail({super.key, required this.board});

  @override
  State<BoardDetail> createState() => _BoardDetailState();
}

class _BoardDetailState extends State<BoardDetail> {
  @override
  Widget build(BuildContext context) {
    // final smallTextStyle = Theme.of(context).primaryTextTheme;
    // final largeTextStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(backgroundColor: Color.fromARGB(255, 231, 231, 231)),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/Logos/nordwood-themes-background2.jpg'),fit: BoxFit.fill)
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                //HEADER
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
              //BOARDS DETAILS
              SizedBox(height: 10),
              Center(
                child: Text(
                  widget.board.model,
                  style: GoogleFonts.marcellusSc(fontSize: 40),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Text(
                    widget.board.shaper,
                    style: GoogleFonts.marcellus(fontSize: 22),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Image.asset(widget.board.frontImage, height: 420),
                  ),
                  Expanded(
                    child: Image.asset(widget.board.backImage, height: 420),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                child: Column(
                  children: [
                    Text(
                      widget.board.details,
                      style: GoogleFonts.marcellus(fontSize: 12),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              //SPECS AREA
              Center(
                child: Text(
                  "Specs",
                  style: GoogleFonts.marcellusSc(fontSize: 30),
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 185,
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Model",
                        style: GoogleFonts.marcellusSc(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.blur_circular_rounded,
                        size: 4,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Container(
                      width: 185,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.board.model,
                        style: GoogleFonts.marcellus(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 185,
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Shaper",
                        style: GoogleFonts.marcellusSc(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.blur_circular_rounded,
                        size: 4,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Container(
                      width: 185,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.board.shaper,
                        style: GoogleFonts.marcellus(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 185,
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Style",
                        style: GoogleFonts.marcellusSc(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.blur_circular_rounded,
                        size: 4,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Container(
                      width: 185,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.board.style,
                        style: GoogleFonts.marcellus(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 185,
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Fin Configuration",
                        style: GoogleFonts.marcellusSc(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.blur_circular_rounded,
                        size: 4,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Container(
                      width: 185,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.board.finConfig,
                        style: GoogleFonts.marcellus(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 185,
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Tail",
                        style: GoogleFonts.marcellusSc(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.blur_circular_rounded,
                        size: 4,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Container(
                      width: 185,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.board.tail,
                        style: GoogleFonts.marcellus(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 185,
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Concave",
                        style: GoogleFonts.marcellusSc(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.blur_circular_rounded,
                        size: 4,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Container(
                      width: 185,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.board.concave,
                        style: GoogleFonts.marcellus(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 185,
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Stringer",
                        style: GoogleFonts.marcellusSc(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.blur_circular_rounded,
                        size: 4,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Container(
                      width: 185,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.board.stringer,
                        style: GoogleFonts.marcellus(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 185,
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Blank",
                        style: GoogleFonts.marcellusSc(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.blur_circular_rounded,
                        size: 4,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Container(
                      width: 185,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.board.material,
                        style: GoogleFonts.marcellus(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              //DIMS TABLE AREA
              Center(
                child: Text(
                  "Dimensions",
                  style: GoogleFonts.marcellusSc(fontSize: 30),
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
