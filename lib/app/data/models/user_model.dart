import 'package:feedbackstation/app/data/models/media_model.dart';

class User {
  final int id;
  final String? name;
  final String? lastname;
  final String? email;
  final String? serialNumber;
  final Media? avatar;

  User({
    required this.id,
    this.name,
    this.lastname,
    this.email,
    this.serialNumber,
    this.avatar,
  });

  // JSON'dan User nesnesine dönüştürmek için bir fabrika yöntemi
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        lastname: json['lastname'],
        email: json['email'],
        serialNumber: json['serialNumber'],
        avatar: json['avatar']);
  }

  // User nesnesini JSON'a dönüştürmek için bir yöntem
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      // 'lastname': lastname,
      'email': email,
      'serialNumber': serialNumber,
      'avatar': avatar?.toJson(),
    };
  }
}
