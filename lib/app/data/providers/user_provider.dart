import 'package:get/get.dart';
import '../models/user_model.dart';

class UserProvider extends GetConnect {
  // Örnek API endpoint URL
  final String randomUserURL = 'https://randomuser.me/api/';

  Future<List<User>> fetchRandomUsers() async {
    final response = await get(randomUserURL);
    if (response.status.hasError) {
      return Future.error(response.statusText ?? 'Error fetching users');
    } else {
      return (response.body['results'] as List)
          .map<User>((user) => User.fromURLJson(user))
          .toList();
      // return response.body['results'][0]
      //     .map<User>((user) => User.fromURLJson(user))
      //     .toList();
    }
  }
}
