// To parse this JSON data, do
//
//     final salon = salonFromJson(jsonString);

import 'dart:convert';

Salon salonFromJson(String str) => Salon.fromJson(json.decode(str));

String salonToJson(Salon data) => json.encode(data.toJson());

class Salon {
  Salon({
    this.salon,
  });

  List<SalonElement>? salon;

  factory Salon.fromJson(Map<String, dynamic> json) => Salon(
    salon: List<SalonElement>.from(json["Salon"].map((x) => SalonElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Salon": List<dynamic>.from(salon!.map((x) => x.toJson())),
  };
}

class SalonElement {
  SalonElement({
    this.id,
    this.num,
    this.name,
    this.img,
    this.km,
    this.imges,
  });

  int? id;
  String? num;
  String? name;
  String? img;
  String? km;
  List<String>? imges;

  factory SalonElement.fromJson(Map<String, dynamic> json) => SalonElement(
    id: json["id"],
    num: json["num"],
    name: json["name"],
    img: json["img"],
    km: json["km"],
    imges: List<String>.from(json["imges"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "num": num,
    "name": name,
    "img": img,
    "km": km,
    "imges": List<dynamic>.from(imges!.map((x) => x)),
  };
}
