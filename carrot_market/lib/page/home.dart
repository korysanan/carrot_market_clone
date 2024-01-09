import 'package:carrot_market/repository/contents_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentLocation = "bc";
  ContentsRepository contentsRepository = ContentsRepository();
  final Map<String, String> locationTypeToString = {
    "bc" : "병천면",
    "js" : "주산면",
    "mc" : "목천읍",
  };

  @override
  void initState() {
    super.initState();
  }

  final oCcy = new NumberFormat("#,###", "ko_KR");
  String calcStringToWon(String priceString){
    return "${oCcy.format(int.parse(priceString))}원";
  }

  PreferredSizeWidget _appbarWidget(){  // appbarWidget 부분 
    return AppBar(
        title: GestureDetector(
          onTap: (){
            print("click");
          },
          child: PopupMenuButton<String>(
            offset: Offset(0, 30),
            shape: ShapeBorder.lerp(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              1
            ),
            onSelected: (String where){
              print(where);
              setState(() {
                currentLocation = where;
              });
            },
            itemBuilder: (BuildContext context){
              return [
                PopupMenuItem(value: "bc", child: Text("병천면")),
                PopupMenuItem(value: "js", child: Text("주산면")),
                PopupMenuItem(value: "mc", child: Text("목천읍")),
              ];
            },
            child: Row(
              children: [
                Text(locationTypeToString[currentLocation] ?? '기본 위치'),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        elevation: 1,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
          IconButton(
            onPressed: () {}, 
            icon: SvgPicture.asset(
              "assets/svg/bell.svg", width: 22,
            )),
        ],
      );
  }

  _loadContents(){
    contentsRepository.loadContentsFromLocation(currentLocation);
  }

  Widget _bodyWidget(){
    return FutureBuilder(
      future: _loadContents(),
      builder: (context, snapshot){ //dynamic한 이유는 선언을 안해서 class 등 귀찮으면 안해도 됨 
        List<Map<String, String>> datas = snapshot.data;
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (BuildContext _context, int index){
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(datas[index]["image"].toString(),
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            datas[index]["title"].toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 5),
                          Text(
                            datas[index]["location"].toString(),
                            style: TextStyle(
                              fontSize: 12, color: Colors.black.withOpacity(0.3)
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            calcStringToWon(datas[index]["price"].toString()),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 5),
                          Expanded(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/heart_off.svg",
                                    width: 13,
                                    height: 13,
                                  ),
                                  SizedBox(width: 5),
                                  Text(datas[index]["likes"].toString()),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
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
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(), // No change here
      body: _bodyWidget(),
    );
  }
}
