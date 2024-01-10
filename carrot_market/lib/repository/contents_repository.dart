/*
원래 여기에 다른 곳에서 (예를 들면 db라던데 api 이용해서 파일 불러옴
연습에서는 예를 들기 위해 선언으로 처리
*/
class ContentsRepository{
  Map<String, dynamic> data = {
    "bc": [
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
    ],
    "js": [
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
    ]
  };

  Future<List<Map<String, String>>> loadContentsFromLocation(String location) async {
    // awase를 이용하려면 async 이용해줘야함 
    // API 통신 location 값을 보내주면서
    await Future.delayed(const Duration(milliseconds: 1000)); // api에서 받아와서 delay가 있다고 가정했을때 
    return  data[location];
  }
}