import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Change the return type to PreferredSizeWidget
  PreferredSizeWidget _appbarWidget(){
    return AppBar(
        title: GestureDetector(
          onTap: (){
            print("click");
          },
          child: Row(
            children: [
              Text("병천면"),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        elevation: 1,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
          IconButton(onPressed: () {}, icon: SvgPicture.asset("assets/svg/bell.svg", width: 22)),
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(), // No change here
      body: Container(),
      bottomNavigationBar: Container(), // Removed extra period
    );
  }
}
