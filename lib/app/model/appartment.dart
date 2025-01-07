// To parse this JSON data, do
//
//     final appartment = appartmentFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Appartment appartmentFromJson(String str) => Appartment.fromJson(json.decode(str));

String appartmentToJson(Appartment data) => json.encode(data.toJson());

class Appartment {
    int apartmentId;
    String apartmentNumber;
    int floor;
    String residentCode;

    Appartment({
        required this.apartmentId,
        required this.apartmentNumber,
        required this.floor,
        required this.residentCode,
    });

    Appartment copyWith({
        int? apartmentId,
        String? apartmentNumber,
        int? floor,
        String? residentCode,
    }) => 
        Appartment(
            apartmentId: apartmentId ?? this.apartmentId,
            apartmentNumber: apartmentNumber ?? this.apartmentNumber,
            floor: floor ?? this.floor,
            residentCode: residentCode ?? this.residentCode,
        );

    factory Appartment.fromJson(Map<String, dynamic> json) => Appartment(
        apartmentId: json["apartmentId"],
        apartmentNumber: json["apartmentNumber"],
        floor: json["floor"],
        residentCode: json["residentCode"],
    );

    Map<String, dynamic> toJson() => {
        "apartmentId": apartmentId,
        "apartmentNumber": apartmentNumber,
        "floor": floor,
        "residentCode": residentCode,
    };
}
