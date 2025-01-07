// To parse this JSON data, do
//
//     final building = buildingFromJson(jsonString);

import 'dart:convert';

Building buildingFromJson(String str) => Building.fromJson(json.decode(str));

String buildingToJson(Building data) => json.encode(data.toJson());

class Building {
    int? buildingId;
    String? buildingName;
    String? location;
    String? description;

    Building({
        this.buildingId,
        this.buildingName,
        this.location,
        this.description,
    });

    Building copyWith({
        int? buildingId,
        String? buildingName,
        String? location,
        String? description,
    }) => 
        Building(
            buildingId: buildingId ?? this.buildingId,
            buildingName: buildingName ?? this.buildingName,
            location: location ?? this.location,
            description: description ?? this.description,
        );

    factory Building.fromJson(Map<String, dynamic> json) => Building(
        buildingId: json["buildingId"],
        buildingName: json["buildingName"],
        location: json["location"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "buildingId": buildingId,
        "buildingName": buildingName,
        "location": location,
        "description": description,
    };
}
