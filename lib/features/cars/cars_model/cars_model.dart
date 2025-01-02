class CarsModelData {
  List<Cars>? cars;

  CarsModelData({this.cars});

  CarsModelData.fromJson(Map<String, dynamic> json) {
    if (json['cars'] != null) {
      cars = <Cars>[];
      json['cars'].forEach((v) {
        cars!.add(Cars.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cars != null) {
      data['cars'] = cars!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cars {
  String? sId;
  String? name;
  String? brand;
  int? year;
  String? fuelType;
  String? transmission;
  String? address;
  int? pricePerDay;
  String? description;
  String? image;
  bool? available;
  String? userId;
  List<String>? favoriteBy;
  int? iV;

  Cars(
      {this.sId,
      this.name,
      this.brand,
      this.year,
      this.fuelType,
      this.transmission,
      this.address,
      this.pricePerDay,
      this.description,
      this.image,
      this.available,
      this.userId,
      this.favoriteBy,
      this.iV});

  Cars.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    brand = json['brand'];
    year = json['year'];
    fuelType = json['fuelType'];
    transmission = json['transmission'];
    address = json['address'];
    pricePerDay = json['pricePerDay'];
    description = json['description'];
    image = json['image'];
    available = json['available'];
    userId = json['userId'];
    favoriteBy = json['favoriteBy'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['brand'] = brand;
    data['year'] = year;
    data['fuelType'] = fuelType;
    data['transmission'] = transmission;
    data['address'] = address;
    data['pricePerDay'] = pricePerDay;
    data['description'] = description;
    data['image'] = image;
    data['available'] = available;
    data['userId'] = userId;
    data['favoriteBy'] = favoriteBy;
    data['__v'] = iV;
    return data;
  }
}