import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvc_app/model/user.dart';

void main() {
  group('original class in User Test', () {
    test("Name test", () {
      final Name name = Name(title: 'mr', first: '日本', last: '太郎');
      expect(name.title, 'mr');
      expect(name.first, '日本');
      expect(name.last, '太郎');
    });

    test("Picture test", () {
      final Picture picture = Picture(
        large: 'https://randomuser.me/api/portraits/men/75.jpg',
        medium: 'https://randomuser.me/api/portraits/med/men/75.jpg',
        thumbnail: 'https://randomuser.me/api/portraits/thumb/men/75.jpg',
      );

      expect(picture.large, 'https://randomuser.me/api/portraits/men/75.jpg');
      expect(picture.medium, 'https://randomuser.me/api/portraits/med/men/75.jpg');
      expect(picture.thumbnail, 'https://randomuser.me/api/portraits/thumb/men/75.jpg');
    });

  });

  test("User test",() {
    final name = Name(title: 'mr', first: '日本', last: '太郎');
    final Picture picture = Picture(
      large: 'https://randomuser.me/api/portraits/men/75.jpg',
      medium: 'https://randomuser.me/api/portraits/med/men/75.jpg',
      thumbnail: 'https://randomuser.me/api/portraits/thumb/men/75.jpg',
    );

    final japanese = User(gender: 'man', email: 'sample.@co.jp', name: name);
    japanese.picture = picture;

    expect(japanese.gender, 'man');
    expect(japanese.name.first, '日本');
    expect(japanese.picture!.large, 'https://randomuser.me/api/portraits/men/75.jpg');

  });
}