import 'dart:convert';

class User {
  String? id;
  bool? verified;
  String? dateCreated;
  int? age;
  String? phoneNumber;
  int? rating;
  String? firstName;
  String? lastName;
  String? email;
  String? token;
  String? profileImage;
  String? bio;
  String? role;

  User(
      {this.id,
      this.verified,
      this.dateCreated,
      this.age,
      this.phoneNumber,
      this.rating,
      this.firstName,
      this.lastName,
      this.email,
      this.token,
      this.profileImage,
      this.bio,
      this.role});

  User.fromJson(dynamic json) {
    json = jsonDecode(json);
    id = json['_id'];
    verified = json['verified'];
    dateCreated = json['date_created'];
    age = json['age'];
    phoneNumber = json['phone_number'];
    rating = json['rating'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    token = json['token'];
    profileImage = json['profile_image'];
    bio = json['bio'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['_id'] = id;
    map['verified'] = verified;
    map['date_created'] = dateCreated;
    map['age'] = age;
    map['phone_number'] = phoneNumber;
    map['rating'] = rating;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['token'] = token;
    map['profile_image'] = profileImage;
    map['bio'] = bio;
    map['role'] = role;
    return map;
  }
}
