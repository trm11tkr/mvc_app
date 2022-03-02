// import 'package:json_annotation/json_annotation.dart';
// import 'package:json_serializable/json_serializable.dart';
// import 'package:build_runner/build_runner.dart';

class User {
  User({required this.gender,required this.email, required this.name});

  late String gender;
  late String email;
  late Name name;
  late Picture picture;

  User.fromJson(Map json) {
    gender = json['gender'];
    email = json['email'];
    name = (json['name'] != null ? Name.fromJson(json['name']) : null)!;
    picture = (json['picture'] != null ? Picture.fromJson(json['picture']) : null)!;

  }
}

class Name {
  Name({required this.title, required this.first, required this.last});

  late String title;
  late String first;
  late String last;

  Name.fromJson(Map json) {
    title = json['title'];
    first = json['first'];
    last = json['last'];
  }

  Map toJson() {
    final Map data = {};
    data['title'] = this.title;
    data['first'] = this.first;
    data['last'] = this.last;
    return data;
  }
}

class Picture {
  Picture({required this.large, required this.medium, required this.thumbnail});

  late String large;
  late String medium;
  late String thumbnail;

  Picture.fromJson(Map json) {
    large = json['large'];
    medium = json['medium'];
    thumbnail = json['thumbnail'];
  }

  Map toJson() {
    final Map data = {};
    data['large'] = this.large;
    data['medium'] = this.medium;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}