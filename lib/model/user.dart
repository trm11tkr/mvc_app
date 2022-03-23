class User {
  User({required this.gender,required this.email, required this.name,});

  late String gender; // 性別
  late String email; // メールアドレス
  late Name name; // 名前
  Picture? picture; // 顔画像
  late String fullName = name.title + " " + name.first + " " + name.last ;

  User.fromJson(Map json) {
    gender = json['gender'];
    email = json['email'];
    name = (json['name'] != null ? Name.fromJson(json['name']) : null)!;
    picture = (json['picture'] != null ? Picture.fromJson(json['picture']) : null);
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
    data['title'] = title;
    data['first'] = first;
    data['last'] = last;
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
    data['large'] = large;
    data['medium'] = medium;
    data['thumbnail'] = thumbnail;
    return data;
  }
}