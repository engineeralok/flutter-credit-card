// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    User? user;
    Tokens? tokens;

    UserModel({
        this.user,
        this.tokens,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        tokens: json["tokens"] == null ? null : Tokens.fromJson(json["tokens"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "tokens": tokens?.toJson(),
    };
}

class Tokens {
    Access? access;
    Access? refresh;

    Tokens({
        this.access,
        this.refresh,
    });

    factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        access: json["access"] == null ? null : Access.fromJson(json["access"]),
        refresh: json["refresh"] == null ? null : Access.fromJson(json["refresh"]),
    );

    Map<String, dynamic> toJson() => {
        "access": access?.toJson(),
        "refresh": refresh?.toJson(),
    };
}

class Access {
    String? token;
    DateTime? expires;

    Access({
        this.token,
        this.expires,
    });

    factory Access.fromJson(Map<String, dynamic> json) => Access(
        token: json["token"],
        expires: json["expires"] == null ? null : DateTime.parse(json["expires"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "expires": expires?.toIso8601String(),
    };
}

class User {
    String? id;
    String? email;
    String? name;
    String? role;

    User({
        this.id,
        this.email,
        this.name,
        this.role,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "role": role,
    };
}
