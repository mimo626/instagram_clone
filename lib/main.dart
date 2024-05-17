import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/body.dart';

void main() {
  runApp(const InstaCloneApp());
}

class InstaCloneApp extends StatelessWidget {
  const InstaCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
              primary: Colors.white, secondary: Colors.black
          ),
          useMaterial3: true
          ),
      home: InstaCloneHome(),
    );
  }
}

class InstaCloneHome extends StatefulWidget {
  const InstaCloneHome({super.key});

  @override
  State<InstaCloneHome> createState() => _InstaCloneHomeState();
}

class _InstaCloneHomeState extends State<InstaCloneHome> {
  late int index;


  @override
  void initState() {
    super.initState();
     index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Instagram",
          style: GoogleFonts.lobsterTwo(color: Colors.black, fontSize: 32),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_outline,
              size: 32,
            ),
            onPressed: () {
              print('Tab favorite');
            },
          ),
          IconButton(
            icon: Icon(CupertinoIcons.paperplane, size: 32),
            onPressed: () {
              print('Tab paperplane');
            },
          )
        ],
      ),
      body: InstaBody(),
    );
  }
}
