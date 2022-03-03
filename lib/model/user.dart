class User {
  User({required this.gender,required this.email, required this.name});

  late String gender; // 性別
  late String email; // メールアドレス
  late Name name; // 名前
  late Picture picture; // 顔画像

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