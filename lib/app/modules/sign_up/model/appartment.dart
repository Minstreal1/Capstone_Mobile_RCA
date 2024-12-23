// To parse this JSON data, do
//
//     final appartment = appartmentFromJson(jsonString);

import 'dart:convert';

Appartment appartmentFromJson(String str) => Appartment.fromJson(json.decode(str));

String appartmentToJson(Appartment data) => json.encode(data.toJson());

class Appartment {
    DateTime? createdAt;
    DateTime? updatedAt;
    int? apartmentId;
    String? apartmentNumber;
    int? floor;
    String? residentCode;
    String? phoneNumber;

    Appartment({
        this.createdAt,
        this.updatedAt,
        this.apartmentId,
        this.apartmentNumber,
        this.floor,
        this.residentCode,
        this.phoneNumber,
    });

    Appartment copyWith({
        DateTime? createdAt,
        DateTime? updatedAt,
        int? apartmentId,
        String? apartmentNumber,
        int? floor,
        String? residentCode,
        String? phoneNumber,
    }) => 
        Appartment(
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            apartmentId: apartmentId ?? this.apartmentId,
            apartmentNumber: apartmentNumber ?? this.apartmentNumber,
            floor: floor ?? this.floor,
            residentCode: residentCode ?? this.residentCode,
            phoneNumber: phoneNumber ?? this.phoneNumber,
        );

    factory Appartment.fromJson(Map<String, dynamic> json) => Appartment(
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        apartmentId: json["apartmentId"],
        apartmentNumber: json["apartmentNumber"],
        floor: json["floor"],
        residentCode: json["residentCode"],
        phoneNumber: json["phoneNumber"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "apartmentId": apartmentId,
        "apartmentNumber": apartmentNumber,
        "floor": floor,
        "residentCode": residentCode,
        "phoneNumber": phoneNumber,
    };
}
