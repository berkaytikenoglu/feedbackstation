import 'package:get/get.dart';
import '../models/user_model.dart';

class UserProvider extends GetConnect {
  // Örnek API endpoint URL
  final String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  // Tüm kullanıcıları getiren bir yöntem
  Future<List<User>> getUsers() async {
    final response = await get(apiUrl);
    if (response.status.hasError) {
      return Future.error(response.statusText ?? 'Error fetching users');
    } else {
      return response.body.map<User>((user) => User.fromJson(user)).toList();
    }
  }

  // Belirli bir kullanıcıyı ID ile getiren bir yöntem
  Future<User> getUserById(int id) async {
    final response = await get('$apiUrl/$id');
    if (response.status.hasError) {
      return Future.error(response.statusText ?? 'Error fetching user');
    } else {
      return User.fromJson(response.body);
    }
  }
}
