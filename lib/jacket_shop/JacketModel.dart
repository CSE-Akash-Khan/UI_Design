/// id : 1
/// name : "Grey Yellow Jacket"
/// desc : "Very Cool Jacket Ipsum sed duo labore et eos accusam et voluptua. Sed ut clita sadipscing lorem at ut et dolor. Voluptua nonumy et est lorem et, takimata stet dolores et eos sit erat et sit justo, stet vero voluptua sadipscing vero lorem at. Eos vero vero gubergren at duo et ipsum, ipsum."
/// price : 2000
/// color : "0xffffdb61"
/// size : "42"
/// image : "assets/images/greyyellow.png"

class JacketModel {
  int quantity = 1;
  JacketModel({
      num? id, 
      String? name, 
      String? desc, 
      num? price, 
      String? color, 
      String? size, 
      String? image,}){
    _id = id;
    _name = name;
    _desc = desc;
    _price = price;
    _color = color;
    _size = size;
    _image = image;
}

  JacketModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _desc = json['desc'];
    _price = json['price'];
    _color = json['color'];
    _size = json['size'];
    _image = json['image'];
  }
  num? _id;
  String? _name;
  String? _desc;
  num? _price;
  String? _color;
  String? _size;
  String? _image;
JacketModel copyWith({  num? id,
  String? name,
  String? desc,
  num? price,
  String? color,
  String? size,
  String? image,
}) => JacketModel(  id: id ?? _id,
  name: name ?? _name,
  desc: desc ?? _desc,
  price: price ?? _price,
  color: color ?? _color,
  size: size ?? _size,
  image: image ?? _image,
);
  num? get id => _id;
  String? get name => _name;
  String? get desc => _desc;
  num? get price => _price;
  String? get color => _color;
  String? get size => _size;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['desc'] = _desc;
    map['price'] = _price;
    map['color'] = _color;
    map['size'] = _size;
    map['image'] = _image;
    return map;
  }

}