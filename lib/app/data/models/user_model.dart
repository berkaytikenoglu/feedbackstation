import 'package:feedbackstation/app/data/models/media_model.dart';
import 'package:feedbackstation/app/utils/applist.dart';

class User {
  final int id;
  final String? firstname;
  final String? lastname;
  final String? displayname;
  final String? email;
  final String? serialNumber;
  final Media? avatar;

  User({
    required this.id,
    this.firstname,
    this.lastname,
    this.displayname,
    this.email,
    this.serialNumber,
    this.avatar,
  });

  // JSON'dan User nesnesine dönüştürmek için bir fabrika yöntemi
  factory User.fromURLJson(Map<String, dynamic> json) {
    return User(
      id: AppList.userList.length + 1,
      firstname: json['name']['first'],
      lastname: json['name']['last'],
      displayname: json['name']['first'] + " " + json['name']['last'],
      email: json['email'],
      serialNumber: json['phone'],
      avatar: Media(
        id: 1,
        type: MediaType.image,
        bigUrl: json['picture']['large'],
        normalUrl: json['picture']['medium'],
        minUrl: json['picture']['thumbnail'],
        isLocal: false,
      ),
    );
  }

  // User nesnesini JSON'a dönüştürmek için bir yöntem
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'displayname': displayname,
      'email': email,
      'serialNumber': serialNumber,
      'avatar': avatar?.toJson(),
    };
  }
}
