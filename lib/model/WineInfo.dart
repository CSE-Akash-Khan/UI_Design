class WineInfo{
  String title;
  String wineType;
  String price;
  String image;
  int rating;
  int tokenNo;

  WineInfo(this.title, this.wineType, this.price, this.image, this.rating,
      this.tokenNo);

  static List<WineInfo> wineInfoList(){
    return [
      WineInfo("San Valentine\nGarnacha 2016", "Red wine, Spain", "12.29€", "assets/images/wineBottol1.png", 95, 23),
      WineInfo("San Valentine\nGarnacha 2018", "white wine, Spain", "12.29€", "assets/images/wineBottol2.png", 90, 20),
      WineInfo("San Valentine\nGarnacha 2017", "Red wine, Spain", "12.29€", "assets/images/wineBottol3.png", 85, 23),
      WineInfo("San Valentine\nGarnacha 2016", "Red wine, Spain", "12.29€", "assets/images/wineBottol1.png", 95, 23),
      WineInfo("San Valentine\nGarnacha 2018", "white wine, Spain", "12.29€", "assets/images/wineBottol2.png", 90, 20),
      WineInfo("San Valentine\nGarnacha 2017", "Red wine, Spain", "12.29€", "assets/images/wineBottol3.png", 85, 23),
      WineInfo("San Valentine\nGarnacha 2016", "Red wine, Spain", "12.29€", "assets/images/wineBottol1.png", 95, 23),
      WineInfo("San Valentine\nGarnacha 2018", "white wine, Spain", "12.29€", "assets/images/wineBottol2.png", 90, 20),
      WineInfo("San Valentine\nGarnacha 2017", "Red wine, Spain", "12.29€", "assets/images/wineBottol3.png", 85, 23),
      WineInfo("San Valentine\nGarnacha 2016", "Red wine, Spain", "12.29€", "assets/images/wineBottol3.png", 85, 23),
    ];
  }

}