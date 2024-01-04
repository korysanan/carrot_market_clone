import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> datas = [];

  @override
  void initState() {
    super.initState();
    datas = [
      {
        "image": "assets/images/ara-1.jpg",
        "title": "네메시스 축구화275",
        "location": "천안시 동남구 병천면",
        "price": "30000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-2.jpg",
        "title": "LA갈비 5kg팔아요~",
        "location": "천안시 동남구 병천면",
        "price": "100000",
        "likes": "5"
      },
      {
        "image": "assets/images/ara-3.jpg",
        "title": "치약팝니다",
        "location": "천안시 동남구 병천면",
        "price": "5000",
        "likes": "0"
      },
      {
        "image": "assets/images/ara-4.jpg",
        "title": "맥북프로",
        "location": "천안시 동남구 병천면",
        "price": "1000000",
        "likes": "6"
      },
      {
        "image": "assets/images/ara-5.jpg",
        "title": "디월트존기임팩",
        "location": "천안시 동남구 병천면",
        "price": "150000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-6.jpg",
        "title": "갤럭시s10",
        "location": "천안시 동남구 병천면",
        "price": "180000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-7.jpg",
        "title": "선반",
        "location": "천안시 동남구 병천면",
        "price": "15000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-8.jpg",
        "title": "냉장 쇼케이스",
        "location": "천안시 동남구 병천면",
        "price": "80000",
        "likes": "3"
      },
      {
        "image": "assets/images/ara-9.jpg",
        "title": "대우 미니냉장고",
        "location": "천안시 동남구 병천면",
        "price": "150000",
        "likes": "3"
      },
      {
        "image": "assets/images/ara-10.jpg",
        "title": "멜킨스 풀업 턱걸이 판매합니다",
        "location": "천안시 동남구 병천면",
        "price": "50000",
        "likes": "7"
      },
    ];
  }

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
  Widget _bodyWidget(){
    return ListView.separated(
      itemBuilder: (BuildContext _context, int index){
        return Container(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset(datas[index]["image"].toString(),
                  width: 100,
                  height: 100,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text(datas[index]["title"].toString()),
                    Text(datas[index]["location"].toString()),
                    Text(datas[index]["price"].toString()),
                    Text(datas[index]["likes"].toString()),
                  ],
                )
              ),
            ],
          )
        );
      },
      itemCount: 10,
      separatorBuilder: (BuildContext _context, int index){
        return Container(height: 1, color: Colors.black.withOpacity(0.4));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(), // No change here
      body: _bodyWidget(),
      //bottomNavigationBar: Container(), // Removed extra period
    );
  }
}
