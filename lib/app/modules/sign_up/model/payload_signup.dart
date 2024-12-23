// To parse this JSON data, do
//
//     final payLoadSignUp = payLoadSignUpFromJson(jsonString);

import 'dart:convert';

PayLoadSignUp payLoadSignUpFromJson(String str) => PayLoadSignUp.fromJson(json.decode(str));

String payLoadSignUpToJson(PayLoadSignUp data) => json.encode(data.toJson());

class PayLoadSignUp {
    String? username;
    String? password;
    String? email;
    String? phoneNumber;
    String? firstName;
    String? lastName;
    String? address;
    int? apartmentId;

    PayLoadSignUp({
        this.username,
        this.password,
        this.email,
        this.phoneNumber,
        this.firstName,
        this.lastName,
        this.address,
        this.apartmentId,
    });

    PayLoadSignUp copyWith({
        String? username,
        String? password,
        String? email,
        String? phoneNumber,
        String? firstName,
        String? lastName,
        String? address,
        int? apartmentId,
    }) => 
        PayLoadSignUp(
            username: username ?? this.username,
            password: password ?? this.password,
            email: email ?? this.email,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            address: address ?? this.address,
            apartmentId: apartmentId ?? this.apartmentId,
        );

    factory PayLoadSignUp.fromJson(Map<String, dynamic> json) => PayLoadSignUp(
        username: json["username"],
        password: json["password"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        address: json["address"],
        apartmentId: json["apartmentId"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
        "phoneNumber": phoneNumber,
        "firstName": firstName,
        "lastName": lastName,
        "address": address,
        "apartmentId": apartmentId,
    };
}
